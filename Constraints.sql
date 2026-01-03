-- =============================================================
-- TABLE: MEMBRES
-- =============================================================

-- VIOLATION: PK_MEMBRES - Duplicate primary key
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo)
VALUES (100001, 'Test', 'Duplicate', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '1 Rue Test', '0600000000', 'test@test.fr', 'A+', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), NULL);

-- VIOLATION: CK_MEMBRES_GRP_SANGUIN - Invalid blood type
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo)
VALUES (999999, 'Test', 'BadBlood', TO_DATE('1990-01-01', 'YYYY-MM-DD'), '1 Rue Test', '0600000000', 'test@test.fr', 'C+', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), NULL);

-- =============================================================
-- TABLE: REGLES_TARIFICATIONS
-- =============================================================

-- VIOLATION: PK_REGLES_TARIFICATIONS - Duplicate primary key
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (1, 'licence', 'adulte', 0, 0, 'adherent', 50);

-- VIOLATION: CK_TARIF_EST_ETUDIANT - Invalid value for est_etudiant
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (999, 'licence', 'adulte', 2, 0, 'adherent', 50);

-- VIOLATION: CK_TARIF_EST_AIDANT - Invalid value for est_aidant_accompagnant
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (998, 'licence', 'adulte', 0, 5, 'adherent', 50);

-- VIOLATION: CK_TARIF_CAT_AGE - Invalid age category
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (997, 'licence', 'senior', 0, 0, 'adherent', 50);

-- VIOLATION: CK_TARIF_TYPE_FRAIS - Invalid type_frais
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (996, 'abonnement', 'adulte', 0, 0, 'adherent', 50);

-- VIOLATION: CK_TARIF_TYPE_ACCUEIL - Invalid type_accueil
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros)
VALUES (995, 'licence', 'adulte', 0, 0, 'visiteur', 50);

-- =============================================================
-- TABLE: MATERIEL
-- =============================================================

-- VIOLATION: PK_MATERIEL - Duplicate primary key
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision)
VALUES (1, 'Combinaison', 'Test', 'Test Model', 'M', TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL);

-- VIOLATION: CK_MATERIEL_TAILLE - Invalid size
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision)
VALUES (9999, 'Combinaison', 'Test', 'Test Model', '3XL', TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL);

-- =============================================================
-- TABLE: SITES_PLONGEE
-- =============================================================

-- VIOLATION: PK_SITES_PLONGEE - Duplicate primary key
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site)
VALUES (1, 'Test Site', 'Test City', 'naturel', 43.0000, 3.0000, 30, 'Test description', NULL, NULL);

-- VIOLATION: CK_SITES_MILIEU - Invalid milieu
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site)
VALUES (999, 'Test Site', 'Test City', 'mixte', 43.0000, 3.0000, 30, 'Test description', NULL, NULL);

-- =============================================================
-- TABLE: BATEAUX
-- =============================================================

-- VIOLATION: PK_BATEAUX - Duplicate primary key
INSERT INTO BATEAUX (id_bateau, nom_bateau, capacite_places)
VALUES (1, 'Test Boat', 10);

-- =============================================================
-- TABLE: CERTIFICATIONS
-- =============================================================

-- VIOLATION: PK_CERTIFICATIONS - Duplicate primary key
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement)
VALUES ('N1', 'plongee', 20, 20, 0);

-- VIOLATION: CK_CERTIF_TYPE - Invalid certification type
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement)
VALUES ('TEST', 'technique', 20, 20, 0);

-- =============================================================
-- TABLE: SORTIES_PLONGEE
-- =============================================================

-- VIOLATION: PK_SORTIES_PLONGEE - Duplicate primary key
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (1, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 100001, 100002, 100003);

-- VIOLATION: FK_SORTIES_SITE - Non-existent site
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (999, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 9999, 1, 100001, 100002, 100003);

-- VIOLATION: FK_SORTIES_BATEAU - Non-existent boat
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (998, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 9999, 100001, 100002, 100003);

-- VIOLATION: FK_SORTIES_DIRECTEUR - Non-existent member
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (997, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 999999, 100002, 100003);

-- VIOLATION: FK_SORTIES_PILOTE - Non-existent member
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (996, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 100001, 999999, 100003);

-- VIOLATION: FK_SORTIES_SECURITE - Non-existent member
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (995, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 100001, 100002, 999999);

-- VIOLATION: CK_SORTIES_COHERENCE_PILOT - Boat without pilot
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (994, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 100001, NULL, 100003);

-- VIOLATION: CK_SORTIES_COHERENCE_PILOT - Pilot without boat
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite)
VALUES (993, TO_DATE('2025-12-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, NULL, 100001, 100002, 100003);

-- =============================================================
-- TABLE: PALANQUEES
-- =============================================================

-- VIOLATION: PK_PALANQUEES - Duplicate primary key
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (1, 'autonome', 15, 35, 1, NULL);

-- VIOLATION: FK_PALANQUEES_SORTIE - Non-existent sortie
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (999, 'autonome', 15, 35, 9999, NULL);

-- VIOLATION: FK_PALANQUEES_ENCADRANT - Non-existent member
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (998, 'encadrée', 15, 35, 1, 999999);

-- VIOLATION: CK_PALANQUEES_TYPE_GRP - Invalid type_groupe
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (997, 'libre', 15, 35, 1, NULL);

-- VIOLATION: CK_PALANQ_COHERENCE_ENCAD - Autonome with encadrant
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (996, 'autonome', 15, 35, 1, 100001);

-- VIOLATION: CK_PALANQ_COHERENCE_ENCAD - Encadrée without encadrant
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant)
VALUES (995, 'encadrée', 15, 35, 1, NULL);

-- =============================================================
-- TABLE: CATEGORIES_COMPETENCES
-- =============================================================

-- VIOLATION: PK_CATEGORIES_COMPETENCES - Duplicate primary key
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification)
VALUES (1, 'Test Category', 'N1');

-- VIOLATION: FK_CAT_COMP_CODE_CERT - Non-existent certification
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification)
VALUES (999, 'Test Category', 'N99');

-- =============================================================
-- TABLE: COMPETENCES
-- =============================================================

-- VIOLATION: PK_COMPETENCES - Duplicate primary key
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent)
VALUES (1, 'Test Competence', 1, 1, NULL);

-- VIOLATION: FK_COMPETENCES_CATEGORIE - Non-existent category
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent)
VALUES (999, 'Test Competence', 1, 9999, NULL);

-- VIOLATION: FK_COMPETENCES_PARENT - Non-existent parent competence
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent)
VALUES (998, 'Test Competence', 1, 1, 9999);

-- VIOLATION: CK_COMPETENCES_OBLIGATOIRE - Invalid value
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent)
VALUES (997, 'Test Competence', 2, 1, NULL);

-- =============================================================
-- TABLE: SESSION_FORMATION
-- =============================================================

-- VIOLATION: PK_SESSION_FORMATION - Duplicate primary key
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur)
VALUES (1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 10, 3, 'N1', 100001);

-- VIOLATION: FK_SESS_FORM_ID_PALANQ - Non-existent palanquée
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur)
VALUES (999, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 10, 9999, 'N1', 100001);

-- VIOLATION: FK_SESS_FORM_CODE_CERT - Non-existent certification
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur)
VALUES (998, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 10, 3, 'N99', 100001);

-- VIOLATION: FK_SESS_FORM_INSTRUC - Non-existent instructor
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur)
VALUES (997, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 10, 3, 'N1', 999999);

-- =============================================================
-- TABLE: RESULTATS_SESSION_FORMATION
-- =============================================================

-- VIOLATION: PK_RESULTATS_SESS_FORM - Duplicate primary key
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session)
VALUES (1, 'Test comment', 100001, 1);

-- VIOLATION: FK_RESULTATS_SESSIONS - Non-existent session
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session)
VALUES (999, 'Test comment', 100001, 9999);

-- VIOLATION: FK_RESULTATS_MEMBRES - Non-existent member
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session)
VALUES (998, 'Test comment', 999999, 1);

-- =============================================================
-- TABLE: COMPOSITION_PALANQUEE
-- =============================================================

-- VIOLATION: PK_COMPOSITION_PALANQUEE - Duplicate primary key
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre)
VALUES (1, 100006);

-- VIOLATION: FK_COMP_PAL_PALANQUEE - Non-existent palanquée
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre)
VALUES (9999, 100006);

-- VIOLATION: FK_COMP_PAL_MEMBRE - Non-existent member
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre)
VALUES (1, 999999);

-- =============================================================
-- TABLE: EMPRUNTS
-- =============================================================

-- VIOLATION: PK_EMPRUNTS - Duplicate primary key
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin)
VALUES (100006, 1, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));

-- VIOLATION: FK_EMPRUNTS_MEMBRE - Non-existent member
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin)
VALUES (999999, 1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'));

-- VIOLATION: FK_EMPRUNTS_MATERIEL - Non-existent material
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin)
VALUES (100006, 9999, TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'));

-- VIOLATION: CK_EMPRUNTS_DATES - End date before start date
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin)
VALUES (100006, 2, TO_DATE('2025-12-10', 'YYYY-MM-DD'), TO_DATE('2025-12-05', 'YYYY-MM-DD'));

-- =============================================================
-- TABLE: PAIEMENTS
-- =============================================================

-- VIOLATION: PK_PAIEMENTS - Duplicate primary key
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye)
VALUES (1, 100001, 1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 25, 1);

-- VIOLATION: FK_PAIEMENTS_MEMBRES - Non-existent member
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye)
VALUES (999, 999999, 1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 25, 1);

-- VIOLATION: FK_PAIEMENTS_REGLES_TARIF - Non-existent tarif rule
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye)
VALUES (998, 100001, 9999, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 25, 1);

-- VIOLATION: CK_PAIEMENTS_EST_PAYE - Invalid value
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye)
VALUES (997, 100001, 1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), 25, 2);

-- VIOLATION: CK_PAIEMENTS_MONTANT_POSITIF - Negative amount
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye)
VALUES (996, 100001, 1, TO_DATE('2025-12-01', 'YYYY-MM-DD'), -25, 1);

-- =============================================================
-- TABLE: PREPARATION_CERTIF
-- =============================================================

-- VIOLATION: PK_PREPARATION_CERTIF - Duplicate primary key
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation)
VALUES (100005, 'N2', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- VIOLATION: FK_PREPARATION_MEMBRES - Non-existent member
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation)
VALUES (999999, 'N2', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- VIOLATION: FK_PREPARATION_CERTIFICATIONS - Non-existent certification
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation)
VALUES (100005, 'N99', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- =============================================================
-- TABLE: OBTENTION_CERTIF
-- =============================================================

-- VIOLATION: PK_OBTENTION_CERTIF - Duplicate primary key
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention)
VALUES (100001, 'N4', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- VIOLATION: FK_OBTENTIONS_MEMBRES - Non-existent member
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention)
VALUES (999999, 'N1', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- VIOLATION: FK_OBTENTIONS_CERTIFICATIONS - Non-existent certification
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention)
VALUES (100001, 'N99', TO_DATE('2025-12-01', 'YYYY-MM-DD'));

-- =============================================================
-- TABLE: INSCRIPTIONS_SESSION
-- =============================================================

-- VIOLATION: PK_INSCRIPTIONS - Duplicate primary key
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre)
VALUES (1, 100013);

-- VIOLATION: FK_INSCRIPTIONS_SESSIONS - Non-existent session
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre)
VALUES (9999, 100013);

-- VIOLATION: FK_INSCRIPTIONS_MEMBRES - Non-existent member
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre)
VALUES (1, 999999);

-- =============================================================
-- TABLE: EVALUATIONS
-- =============================================================

-- VIOLATION: PK_EVALUATIONS - Duplicate primary key
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence)
VALUES (1, 1, 'acquis');

-- VIOLATION: FK_EVAL_RESULTAT - Non-existent result
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence)
VALUES (9999, 1, 'acquis');

-- VIOLATION: FK_EVAL_COMPETENCE - Non-existent competence
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence)
VALUES (1, 9999, 'acquis');

-- VIOLATION: CK_EVAL_STATUT - Invalid status
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence)
VALUES (2, 5, 'valide');