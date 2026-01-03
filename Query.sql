-- 1. Spots sur lesquels aucune plongée n’a été organisée

SELECT SITES_PLONGEE.id_site, SITES_PLONGEE.nom_site
FROM SITES_PLONGEE
MINUS
SELECT SORTIES_PLONGEE.id_site, SITES_PLONGEE.nom_site
FROM SORTIES_PLONGEE
JOIN SITES_PLONGEE ON SORTIES_PLONGEE.id_site = SITES_PLONGEE.id_site;

-- 2. Plongeurs ayant un niveau mais avec une compétence "En cours" pour ce niveau

SELECT DISTINCT M.nom, M.prenom, M.numero_licence, C.code_certification
FROM MEMBRES M
JOIN OBTENTION_CERTIF OC ON M.numero_licence = OC.numero_licence_membre
JOIN CERTIFICATIONS C ON OC.code_certification = C.code_certification
JOIN CATEGORIES_COMPETENCES CC ON C.code_certification = CC.code_certification
JOIN COMPETENCES Comp ON CC.id_categorie = Comp.id_categorie
JOIN EVALUATIONS E ON Comp.id_competence = E.id_competence
JOIN RESULTATS_SESSION_FORMATION R ON E.id_resultat = R.id_resultat
WHERE R.numero_licence_membre = M.numero_licence
    AND E.statut_competence = 'en_cours';

-- 3. Plongeurs sans niveau actuel et sans niveau en préparation
SELECT MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence FROM MEMBRES
MINUS
SELECT MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence FROM MEMBRES
JOIN OBTENTION_CERTIF ON MEMBRES.numero_licence = OBTENTION_CERTIF.numero_licence_membre
MINUS
SELECT MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
FROM MEMBRES
JOIN PREPARATION_CERTIF ON MEMBRES.numero_licence = PREPARATION_CERTIF.numero_licence_membre;

-- 4. Plongeurs avec une cotisation ne correspondant pas à leur tranche d’âge
SELECT
    MEMBRES.nom,
    MEMBRES.prenom,
    TRUNC(MONTHS_BETWEEN(SYSDATE, MEMBRES.date_naissance)/12) AS age_reel,
    REGLES_TARIFICATIONS.categorie_age AS categorie_payee
FROM MEMBRES
JOIN PAIEMENTS ON MEMBRES.numero_licence = PAIEMENTS.numero_licence_membre
JOIN REGLES_TARIFICATIONS ON PAIEMENTS.id_regle = REGLES_TARIFICATIONS.id_regle
WHERE
    (REGLES_TARIFICATIONS.categorie_age = 'moins_12_ans' AND TRUNC(MONTHS_BETWEEN(SYSDATE, MEMBRES.date_naissance)/12) >= 12)
    OR
    (REGLES_TARIFICATIONS.categorie_age = 'moins_16_ans' AND TRUNC(MONTHS_BETWEEN(SYSDATE, MEMBRES.date_naissance)/12) >= 16);

-- 5. Plongeurs qui plongent uniquement à Sète
SELECT MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN SORTIES_PLONGEE ON PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie
JOIN SITES_PLONGEE ON SORTIES_PLONGEE.id_site = SITES_PLONGEE.id_site
WHERE SITES_PLONGEE.ville = 'Sète'
MINUS
SELECT MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN SORTIES_PLONGEE ON PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie
JOIN SITES_PLONGEE ON SORTIES_PLONGEE.id_site = SITES_PLONGEE.id_site
WHERE SITES_PLONGEE.ville != 'Sète';

-- 6. Matériel à préparer pour la sortie du 18 Août 2025
SELECT
    SP.nom_site,
    MAT.type_materiel,
    MAT.marque,
    MAT.taille,
    COUNT(*) as quantite
FROM
    SORTIES_PLONGEE S
    JOIN SITES_PLONGEE SP ON S.id_site = SP.id_site
    -- 1. Récupérer les palanquées de la sortie
    JOIN PALANQUEES P ON S.id_sortie = P.id_sortie
    -- 2. Récupérer les membres dans l'eau
    JOIN COMPOSITION_PALANQUEE CP ON P.id_palanquee = CP.id_palanquee
    -- 3. Vérifier si ces membres ont un emprunt ACTIF au moment de la sortie
    JOIN EMPRUNTS E ON CP.numero_licence_membre = E.numero_licence_membre
    -- 4. Récupérer les détails du matériel
    JOIN MATERIEL MAT ON E.numero_inventaire = MAT.numero_inventaire
WHERE
    TRUNC(S.date_heure_debut) = TO_DATE('18/08/2025', 'DD/MM/YYYY')
    AND
    TRUNC(S.date_heure_debut) BETWEEN E.date_debut AND E.date_fin
GROUP BY
    SP.nom_site,
    MAT.type_materiel,
    MAT.marque,
    MAT.taille
ORDER BY
    SP.nom_site,
    MAT.type_materiel;

-- 7. Plongeurs n'ayant pas respecté les paramètres de la palanquée
SELECT DISTINCT
    MEMBRES.nom,
    MEMBRES.prenom,
    CERTIFICATIONS.profondeur_max_plongee AS max_autorise,
    PALANQUEES.profondeur_max_metres AS profondeur_palanquee
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN OBTENTION_CERTIF ON MEMBRES.numero_licence = OBTENTION_CERTIF.numero_licence_membre
JOIN CERTIFICATIONS ON OBTENTION_CERTIF.code_certification = CERTIFICATIONS.code_certification
WHERE PALANQUEES.profondeur_max_metres > CERTIFICATIONS.profondeur_max_plongee;

-- 8. Nombre de matériels non rendus par plongeur (Tous les membres inclus)
-- Peut être simplifié par un LEFT JOIN mais non vu?
SELECT
    MEMBRES.numero_licence,
    MEMBRES.nom,
    COUNT(EMPRUNTS.numero_inventaire) as nb
FROM MEMBRES
JOIN EMPRUNTS ON MEMBRES.numero_licence = EMPRUNTS.numero_licence_membre
WHERE (EMPRUNTS.date_fin is NULL OR EMPRUNTS.date_fin > SYSDATE)
GROUP BY MEMBRES.numero_licence, MEMBRES.nom
UNION (
    SELECT
        MEMBRES.numero_licence,
        MEMBRES.nom,
        0
    FROM MEMBRES
    MINUS
    SELECT
        MEMBRES.numero_licence,
        MEMBRES.nom,
        0
    FROM MEMBRES
    JOIN EMPRUNTS ON MEMBRES.numero_licence = EMPRUNTS.numero_licence_membre
    WHERE (EMPRUNTS.date_fin is NULL OR EMPRUNTS.date_fin > SYSDATE)
);

-- 9. Le spot avec la plus grande profondeur lors d'une sortie en 2025
SELECT * FROM (
    SELECT
        SITES_PLONGEE.nom_site,
        SITES_PLONGEE.profondeur_max_metres
    FROM SITES_PLONGEE
    JOIN SORTIES_PLONGEE ON SITES_PLONGEE.id_site = SORTIES_PLONGEE.id_site
    WHERE SORTIES_PLONGEE.date_heure_debut BETWEEN TO_DATE('01/01/2025','DD/MM/YYYY') AND TO_DATE('31/12/2025','DD/MM/YYYY')
    ORDER BY SITES_PLONGEE.profondeur_max_metres DESC
) WHERE ROWNUM = 1;

-- 10. Date de la dernière sortie de chaque bateau
SELECT BATEAUX.nom_bateau, MAX(SORTIES_PLONGEE.date_heure_debut) AS date_sortie
FROM BATEAUX
JOIN SORTIES_PLONGEE ON BATEAUX.id_bateau = SORTIES_PLONGEE.id_bateau
GROUP BY BATEAUX.nom_bateau;

-- 11. Incohérence : Matériel emprunté par plusieurs personnes
SELECT E1.numero_inventaire, E1.numero_licence_membre, E2.numero_licence_membre
FROM EMPRUNTS E1
JOIN EMPRUNTS E2 ON E1.numero_inventaire = E2.numero_inventaire
WHERE E1.numero_licence_membre < E2.numero_licence_membre -- < pour empêcher les dupliqués miroir
AND E1.date_debut < E2.date_fin
AND E1.date_fin > E2.date_debut;

-- 12. Membres ayant fait une seule et unique sortie en octobre 2025
SELECT
    MEMBRES.nom,
    MEMBRES.prenom
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN SORTIES_PLONGEE ON PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie
WHERE TO_CHAR(SORTIES_PLONGEE.date_heure_debut, 'MM/YYYY') = '10/2025'
GROUP BY MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
HAVING COUNT(DISTINCT SORTIES_PLONGEE.id_sortie) = 1;

-- 13. Nb violations paramètres par plongeur (trié)
SELECT
    MEMBRES.nom,
    MEMBRES.prenom,
    COUNT(*) as nb_violations
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN OBTENTION_CERTIF ON MEMBRES.numero_licence = OBTENTION_CERTIF.numero_licence_membre
JOIN CERTIFICATiONS ON OBTENTION_CERTIF.code_certification = CERTIFICATIONS.code_certification
WHERE PALANQUEES.profondeur_max_metres > CERTIFICATIONS.profondeur_max_plongee
GROUP BY MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
ORDER BY nb_violations DESC;

-- 14. Plongeurs en formation : nb plongées Sète vs Hors Sète
SELECT M.nom, M.prenom,
       SUM(CASE WHEN SP.ville = 'Sète' THEN 1 ELSE 0 END) as nb_plongees_sete,
       SUM(CASE WHEN SP.ville != 'Sète' THEN 1 ELSE 0 END) as nb_plongees_hors_sete
FROM MEMBRES M
JOIN PREPARATION_CERTIF PC ON M.numero_licence = PC.numero_licence_membre
JOIN COMPOSITION_PALANQUEE CP ON M.numero_licence = CP.numero_licence_membre
JOIN PALANQUEES P ON CP.id_palanquee = P.id_palanquee
JOIN SORTIES_PLONGEE S ON P.id_sortie = S.id_sortie
JOIN SITES_PLONGEE SP ON S.id_site = SP.id_site
GROUP BY M.nom, M.prenom, M.numero_licence;

-- 15. Sorties en surcharge (Nb personnes > Capacité Bateau)
SELECT SORTIES_PLONGEE.id_sortie, SORTIES_PLONGEE.date_heure_debut
FROM SORTIES_PLONGEE
JOIN BATEAUX ON SORTIES_PLONGEE.id_bateau = BATEAUX.id_bateau
WHERE (
    (
        SELECT COUNT(DISTINCT COMPOSITION_PALANQUEE.numero_licence_membre)
        FROM PALANQUEES
        JOIN COMPOSITION_PALANQUEE ON PALANQUEES.id_palanquee = COMPOSITION_PALANQUEE.id_palanquee
        WHERE PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie)
    + 2
) > BATEAUX.capacite_places;

-- 16. Palanquées ne respectant pas le code du sport
SELECT id_palanquee, type_groupe, 'Encadrant manquant' as probleme
FROM PALANQUEES
WHERE type_groupe = 'encadrée'
AND numero_licence_encadrant IS NULL
UNION
SELECT P.id_palanquee, P.type_groupe, 'Trop de plongeurs' as probleme
FROM PALANQUEES P
JOIN COMPOSITION_PALANQUEE CP ON P.id_palanquee = CP.id_palanquee
WHERE P.type_groupe = 'autonome'
GROUP BY P.id_palanquee, P.type_groupe
HAVING COUNT(CP.numero_licence_membre) > 4;
-- UNION ... chaque problème

-- 17. Palanquées où la profondeur max prévue dépasse celle du site
SELECT PALANQUEES.id_palanquee
FROM PALANQUEES
JOIN SORTIES_PLONGEE ON PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie
JOIN SITES_PLONGEE ON SORTIES_PLONGEE.id_site = SITES_PLONGEE.id_site
WHERE PALANQUEES.profondeur_max_metres > SITES_PLONGEE.profondeur_max_metres;

-- 18. Plongeurs ayant réalisé plus de 3 sorties en octobre 2025
SELECT MEMBRES.nom, MEMBRES.prenom
FROM MEMBRES
JOIN COMPOSITION_PALANQUEE ON MEMBRES.numero_licence = COMPOSITION_PALANQUEE.numero_licence_membre
JOIN PALANQUEES ON COMPOSITION_PALANQUEE.id_palanquee = PALANQUEES.id_palanquee
JOIN SORTIES_PLONGEE ON PALANQUEES.id_sortie = SORTIES_PLONGEE.id_sortie
WHERE TO_CHAR(SORTIES_PLONGEE.date_heure_debut, 'MM/YYYY') = '10/2025'
GROUP BY MEMBRES.nom, MEMBRES.prenom, MEMBRES.numero_licence
HAVING COUNT(DISTINCT SORTIES_PLONGEE.id_sortie) > 3;