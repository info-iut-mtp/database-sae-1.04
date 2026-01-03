-- ============================================================= --
-- 🎓 CERTIFICATIONS
-- ============================================================= --

INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('N1', 'plongee', 20, 20, 0);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('N2', 'plongee', 20, 40, 0);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('N3', 'plongee', 60, 60, 0);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('N4', 'plongee', 60, 60, 40);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('E1', 'encadrement', 0, 6, 6);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('E2', 'encadrement', 0, 20, 20);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('E3', 'encadrement', 0, 40, 40);
INSERT INTO CERTIFICATIONS (code_certification, type_certification, profondeur_max_autonome, profondeur_max_plongee, profondeur_max_encadrement) VALUES ('E4', 'encadrement', 0, 60, 60);

-- ============================================================= --
-- 📚 CATÉGORIES DE COMPÉTENCES
-- ============================================================= --

INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (1, 'Compétences techniques - N1', 'N1');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (2, 'Compétences théoriques - N1', 'N1');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (3, 'Compétences techniques - N2', 'N2');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (4, 'Compétences théoriques - N2', 'N2');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (5, 'Compétences techniques - E1', 'E1');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (6, 'Compétences théoriques - E1', 'E1');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (7, 'Compétences techniques - E2', 'E2');
INSERT INTO CATEGORIES_COMPETENCES (id_categorie, nom_categorie, code_certification) VALUES (8, 'Compétences théoriques - E2', 'E2');

-- ============================================================= --
-- ✅ COMPÉTENCES
-- ============================================================= --

INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (1, 'Palmage', 1, 1, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (2, 'Vidage de masque', 1, 1, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (3, 'Équilibrage oreilles', 1, 1, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (4, 'Signes de communication', 1, 2, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (5, 'Règles de sécurité', 1, 2, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (6, 'Assistance plongeur', 1, 3, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (7, 'Remontée contrôlée', 1, 3, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (8, 'Navigation aux instruments', 0, 3, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (9, 'Tables de plongée', 1, 4, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (10, 'Physique des gaz', 1, 4, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (11, 'Démonstration palmage', 1, 5, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (12, 'Pédagogie vidage masque', 1, 5, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (13, 'Prérogatives N1', 1, 6, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (14, 'Organisation plongée', 1, 6, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (15, 'Gestion palanquée', 1, 7, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (16, 'Intervention panique', 1, 7, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (17, 'Réglementation', 1, 8, NULL);
INSERT INTO COMPETENCES (id_competence, nom_competence, est_obligatoire, id_categorie, id_competence_parent) VALUES (18, 'Accidents de plongée', 1, 8, NULL);

-- ============================================================= --
-- 👥 MEMBRES
-- ============================================================= --

INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100001, 'Dupont', 'Alice', TO_DATE('2014-08-02', 'YYYY-MM-DD'), '31 Rue de la Mer, Sète', '0719574823', 'alice.dupont@plongee-sete.fr', 'B+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/alice.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100002, 'Martin', 'Bob', TO_DATE('2017-08-02', 'YYYY-MM-DD'), '97 Rue de la Mer, Sète', '0736578337', 'bob.martin@plongee-sete.fr', 'AB-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/bob.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100003, 'Bernard', 'Charlie', TO_DATE('2013-07-09', 'YYYY-MM-DD'), '3 Rue de la Mer, Sète', '0740438390', 'charlie.bernard@plongee-sete.fr', 'AB+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/charlie.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100004, 'Dubois', 'Diana', TO_DATE('2010-11-10', 'YYYY-MM-DD'), '18 Rue de la Mer, Sète', '0704007435', 'diana.dubois@plongee-sete.fr', 'B-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/diana.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100005, 'Thomas', 'Ethan', TO_DATE('2007-04-13', 'YYYY-MM-DD'), '57 Rue de la Mer, Sète', '0734241697', 'ethan.thomas@plongee-sete.fr', 'B-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/ethan.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100006, 'Robert', 'Fiona', TO_DATE('1979-09-04', 'YYYY-MM-DD'), '27 Rue de la Mer, Sète', '0691612053', 'fiona.robert@plongee-sete.fr', 'B+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/fiona.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100007, 'Richard', 'George', TO_DATE('1996-06-28', 'YYYY-MM-DD'), '54 Rue de la Mer, Sète', '0685711312', 'george.richard@plongee-sete.fr', 'O+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/george.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100008, 'Petit', 'Hannah', TO_DATE('2007-09-20', 'YYYY-MM-DD'), '60 Rue de la Mer, Sète', '0634631079', 'hannah.petit@plongee-sete.fr', 'A+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/hannah.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100009, 'Durand', 'Ivan', TO_DATE('1967-01-06', 'YYYY-MM-DD'), '87 Rue de la Mer, Sète', '0641760683', 'ivan.durand@plongee-sete.fr', 'B+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/ivan.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100010, 'Leroy', 'Julia', TO_DATE('1994-11-05', 'YYYY-MM-DD'), '66 Rue de la Mer, Sète', '0609691896', 'julia.leroy@plongee-sete.fr', 'A-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/julia.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100011, 'Moreau', 'Kevin', TO_DATE('1994-07-01', 'YYYY-MM-DD'), '86 Rue de la Mer, Sète', '0772761220', 'kevin.moreau@plongee-sete.fr', 'O-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/kevin.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100012, 'Simon', 'Laura', TO_DATE('1995-02-19', 'YYYY-MM-DD'), '85 Rue de la Mer, Sète', '0791481988', 'laura.simon@plongee-sete.fr', 'B+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/laura.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100013, 'Laurent', 'Marc', TO_DATE('1981-03-28', 'YYYY-MM-DD'), '70 Rue de la Mer, Sète', '0745354516', 'marc.laurent@plongee-sete.fr', 'O-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/marc.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100014, 'Lefebvre', 'Nina', TO_DATE('1984-02-17', 'YYYY-MM-DD'), '14 Rue de la Mer, Sète', '0695816503', 'nina.lefebvre@plongee-sete.fr', 'O-', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/nina.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100015, 'Michel', 'Oscar', TO_DATE('2000-08-22', 'YYYY-MM-DD'), '44 Rue de la Mer, Sète', '0690482410', 'oscar.michel@plongee-sete.fr', 'O+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'https://plongee-sete.fr/photos/oscar.jpg');
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100016, 'Terieur', 'Alain', TO_DATE('1980-05-15', 'YYYY-MM-DD'), '10 Rue du Bug, Sète', '0600000000', 'alain.terieur@plongee-sete.fr', 'A+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), NULL);
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100017, 'SeteFan', 'Pierre', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '20 Rue de Sète', '0600000001', 'pierre.setefan@plongee-sete.fr', 'O+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), NULL);
INSERT INTO MEMBRES (numero_licence, nom, prenom, date_naissance, adresse, telephone, email, groupe_sanguin, date_delivrance_licence, date_certificat_medical, url_photo) VALUES (100018, 'OctobreOnce', 'Marie', TO_DATE('1992-03-20', 'YYYY-MM-DD'), '30 Rue Test', '0600000002', 'marie.once@plongee-sete.fr', 'A+', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), NULL);

-- ============================================================= --
-- 💰 RÈGLES DE TARIFICATION
-- ============================================================= --

INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (1, 'licence', 'moins_12_ans', 0, 0, 'adherent', 25);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (2, 'licence', 'moins_16_ans', 0, 0, 'adherent', 30);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (3, 'licence', 'moins_16_ans', 1, 0, 'adherent', 25);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (4, 'licence', 'adulte', 0, 0, 'adherent', 45);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (5, 'licence', 'adulte', 1, 0, 'adherent', 35);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (6, 'licence', 'adulte', 0, 1, 'adherent', 30);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (7, 'licence', 'moins_12_ans', 0, 0, 'federal', 30);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (8, 'licence', 'adulte', 0, 0, 'federal', 55);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (9, 'cotisation', 'moins_12_ans', 0, 0, 'adherent', 80);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (10, 'cotisation', 'moins_16_ans', 0, 0, 'adherent', 120);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (11, 'cotisation', 'adulte', 0, 0, 'adherent', 200);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (12, 'cotisation', 'adulte', 1, 0, 'adherent', 150);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (13, 'plongee', 'adulte', 0, 0, 'adherent', 15);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (14, 'formation', 'adulte', 0, 0, 'adherent', 150);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (15, 'formation', 'adulte', 0, 0, 'adherent', 250);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (16, 'formation', 'adulte', 0, 0, 'adherent', 350);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (17, 'formation', 'adulte', 0, 0, 'adherent', 200);
INSERT INTO REGLES_TARIFICATIONS (id_regle, type_frais, categorie_age, est_etudiant, est_aidant_accompagnant, type_accueil, montant_euros) VALUES (18, 'formation', 'adulte', 0, 0, 'adherent', 300);

-- ============================================================= --
-- 🛠️ MATÉRIEL
-- ============================================================= --

INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (1, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XS', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (2, 'Combinaison', 'Beuchat', 'Premium 5mm', 'S', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (3, 'Combinaison', 'Beuchat', 'Premium 5mm', 'M', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (4, 'Combinaison', 'Beuchat', 'Premium 5mm', 'L', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (5, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XL', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (6, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XS', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (7, 'Combinaison', 'Beuchat', 'Premium 5mm', 'S', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (8, 'Combinaison', 'Beuchat', 'Premium 5mm', 'M', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (9, 'Combinaison', 'Beuchat', 'Premium 5mm', 'L', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (10, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XL', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (11, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XS', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (12, 'Combinaison', 'Beuchat', 'Premium 5mm', 'S', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (13, 'Combinaison', 'Beuchat', 'Premium 5mm', 'M', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (14, 'Combinaison', 'Beuchat', 'Premium 5mm', 'L', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (15, 'Combinaison', 'Beuchat', 'Premium 5mm', 'XL', TO_DATE('2024-03-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (16, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'XS', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (17, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'S', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (18, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'M', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (19, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'L', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (20, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'XL', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (21, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'XS', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (22, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'S', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (23, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'M', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (24, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'L', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (25, 'Gilet stabilisateur', 'Aqualung', 'Zuma', 'XL', TO_DATE('2024-05-20', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (26, 'Palmes', 'Mares', 'Avanti Quattro', 'XS', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (27, 'Palmes', 'Mares', 'Avanti Quattro', 'S', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (28, 'Palmes', 'Mares', 'Avanti Quattro', 'M', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (29, 'Palmes', 'Mares', 'Avanti Quattro', 'L', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (30, 'Palmes', 'Mares', 'Avanti Quattro', 'XL', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (31, 'Palmes', 'Mares', 'Avanti Quattro', 'XS', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (32, 'Palmes', 'Mares', 'Avanti Quattro', 'S', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (33, 'Palmes', 'Mares', 'Avanti Quattro', 'M', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (34, 'Palmes', 'Mares', 'Avanti Quattro', 'L', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (35, 'Palmes', 'Mares', 'Avanti Quattro', 'XL', TO_DATE('2024-02-10', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (36, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (37, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (38, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (39, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (40, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (41, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (42, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (43, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (44, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (45, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (46, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (47, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (48, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (49, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (50, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (51, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (52, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (53, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (54, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (55, 'Bouteille 12L', 'Roth', 'Acier 232 bars', NULL, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (56, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (57, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (58, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (59, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (60, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (61, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (62, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (63, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (64, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (65, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (66, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (67, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (68, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (69, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);
INSERT INTO MATERIEL (numero_inventaire, type_materiel, marque, modele, taille, date_achat, date_derniere_revision) VALUES (70, 'Détendeur', 'Scubapro', 'MK25 EVO', NULL, TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL);

-- ============================================================= --
-- 🗺️ SITES DE PLONGÉE
-- ============================================================= --

INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (1, 'Les Tables', 'Sète', 'naturel', 43.3851, 3.7021, 25, 'Récif calcaire avec gorgones et mérous', 'https://plongee-sete.fr/sites/sete_tables.jpg', 'https://plongee-sete.fr/plans/plan_tables.pdf');
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (2, 'Le Grec', 'Hyères', 'artificiel', 43.392, 3.6985, 35, 'Épave cargo grec coulé en 1945', 'https://plongee-sete.fr/sites/grec.jpg', 'https://plongee-sete.fr/plans/plan_grec.pdf');
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (3, 'La Pointe Courte', 'Sète', 'naturel', 43.389, 3.705, 18, 'Tombant avec mérous et poulpes', 'https://plongee-sete.fr/sites/pointe_courte.jpg', NULL);
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (4, 'Cap d''Agde - Brescou', 'Agde', 'naturel', 43.2833, 3.4833, 40, 'Îlot rocheux, faune riche', 'https://plongee-sete.fr/sites/brescou.jpg', 'https://plongee-sete.fr/plans/plan_brescou.pdf');
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (5, 'Gruissan - Peyrefi', 'Gruissan', 'naturel', 43.0908, 3.1075, 22, 'Herbiers de posidonie', NULL, NULL);
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (6, 'Port-Vendres - Le Sec', 'Port-Vendres', 'naturel', 42.5167, 3.1167, 30, 'Sec rocheux avec barracudas', 'https://plongee-sete.fr/sites/sec.jpg', NULL);
INSERT INTO SITES_PLONGEE (id_site, nom_site, ville, milieu, latitude, longitude, profondeur_max_metres, description, url_photo, url_plan_site) VALUES (7, 'Le Rocher du Large', 'Sète', 'naturel', 43.3000, 3.8000, 60, 'Site très profond et exposé aux courants, accès difficile.', NULL, NULL);

-- ============================================================= --
-- ⛵ BATEAUX
-- ============================================================= --

INSERT INTO BATEAUX (id_bateau, nom_bateau, capacite_places) VALUES (1, 'Aqua Dream', 12);
INSERT INTO BATEAUX (id_bateau, nom_bateau, capacite_places) VALUES (2, 'Blue Spirit', 8);
INSERT INTO BATEAUX (id_bateau, nom_bateau, capacite_places) VALUES (3, 'Sea Explorer', 15);

-- ============================================================= --
-- 🌊 SORTIES DE PLONGÉE
-- ============================================================= --

INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (1, TO_DATE('2025-08-18 09:00', 'YYYY-MM-DD HH24:MI'), 1, 1, 100001, 100002, 100003);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (2, TO_DATE('2025-09-15 10:00', 'YYYY-MM-DD HH24:MI'), 2, 2, 100001, 100004, 100005);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (3, TO_DATE('2025-10-05 08:30', 'YYYY-MM-DD HH24:MI'), 4, 1, 100001, 100002, 100003);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (4, TO_DATE('2025-10-12 09:00', 'YYYY-MM-DD HH24:MI'), 3, 3, 100004, 100002, 100005);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (5, TO_DATE('2025-10-20 14:00', 'YYYY-MM-DD HH24:MI'), 5, 2, 100001, 100004, 100003);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (6, TO_DATE('2025-10-25 09:30', 'YYYY-MM-DD HH24:MI'), 1, 1, 100004, 100002, 100005);
INSERT INTO SORTIES_PLONGEE (id_sortie, date_heure_debut, id_site, id_bateau, numero_licence_directeur, numero_licence_pilote, numero_licence_securite) VALUES (7, TO_DATE('2025-11-08 10:00', 'YYYY-MM-DD HH24:MI'), 6, NULL, 100001, NULL, 100003);

-- ============================================================= --
-- 👥 PALANQUÉES
-- ============================================================= --

INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (1, 'autonome', 15, 35, 1, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (2, 'encadrée', 12, 40, 1, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (3, 'enseignement', 10, 30, 1, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (4, 'autonome', 18, 38, 1, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (5, 'autonome', 20, 40, 2, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (6, 'encadrée', 15, 35, 2, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (7, 'enseignement', 12, 30, 2, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (8, 'autonome', 18, 42, 2, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (9, 'autonome', 25, 38, 3, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (10, 'encadrée', 20, 40, 3, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (11, 'enseignement', 15, 35, 3, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (12, 'autonome', 22, 36, 3, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (13, 'autonome', 12, 22, 4, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (14, 'encadrée', 10, 35, 4, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (15, 'enseignement', 8, 28, 4, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (16, 'autonome', 15, 32, 4, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (17, 'autonome', 18, 40, 5, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (18, 'encadrée', 15, 38, 5, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (19, 'enseignement', 12, 30, 5, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (20, 'autonome', 20, 45, 5, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (21, 'autonome', 16, 35, 6, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (22, 'encadrée', 12, 32, 6, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (23, 'enseignement', 10, 28, 6, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (24, 'autonome', 18, 40, 6, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (25, 'autonome', 22, 38, 7, NULL);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (26, 'encadrée', 18, 35, 7, 100004);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (27, 'enseignement', 15, 30, 7, 100001);
INSERT INTO PALANQUEES (id_palanquee, type_groupe, profondeur_max_metres, duree_plongee_minutes, id_sortie, numero_licence_encadrant) VALUES (28, 'autonome', 25, 42, 7, NULL);

-- ============================================================= --
-- 🤿 COMPOSITION DES PALANQUÉES
-- ============================================================= --

INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (1, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (1, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (1, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100011);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100012);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (3, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (3, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (3, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (3, 100015);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (4, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (4, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (5, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (5, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (6, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (6, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (6, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (7, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (7, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (7, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (8, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (8, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (9, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (9, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (10, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (10, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (10, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (11, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (11, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (11, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (12, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (12, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (13, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (13, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (14, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (14, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (14, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (15, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (15, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (15, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (16, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (16, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (17, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (17, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (18, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (18, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (18, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (19, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (19, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (19, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (20, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (20, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (21, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (21, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (22, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (22, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (22, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (23, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (23, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (23, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (24, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (24, 100008);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (25, 100006);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (25, 100007);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (26, 100004);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (26, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (26, 100010);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (27, 100001);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (27, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (27, 100014);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (1, 100017);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (21, 100017);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (9, 100013);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (9, 100018);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (13, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (17, 100009);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (1, 100005);
INSERT INTO COMPOSITION_PALANQUEE (id_palanquee, numero_licence_membre) VALUES (2, 100016);

-- ============================================================= --
-- 📦 EMPRUNTS DE MATÉRIEL
-- ============================================================= --

INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100006, 1, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100006, 16, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100006, 26, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100007, 2, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100007, 17, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100008, 3, TO_DATE('2025-08-18', 'YYYY-MM-DD'), TO_DATE('2025-08-18', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100009, 5, TO_DATE('2025-12-01', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100010, 6, TO_DATE('2025-12-05', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100010, 19, TO_DATE('2025-12-05', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100011, 7, TO_DATE('2025-11-20', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100013, 8, TO_DATE('2025-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-15', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100014, 9, TO_DATE('2025-10-05', 'YYYY-MM-DD'), TO_DATE('2025-10-10', 'YYYY-MM-DD'));
INSERT INTO EMPRUNTS (numero_licence_membre, numero_inventaire, date_debut, date_fin) VALUES (100015, 5, TO_DATE('2025-12-02', 'YYYY-MM-DD'), TO_DATE('2025-12-10', 'YYYY-MM-DD'));

-- ============================================================= --
-- 💳 PAIEMENTS
-- ============================================================= --

INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (1, 100001, 1, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 25, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (2, 100001, 9, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 80, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (3, 100002, 1, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 25, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (4, 100002, 9, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 80, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (5, 100003, 2, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 30, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (6, 100003, 10, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 120, 0);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (7, 100004, 2, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 30, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (8, 100004, 10, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 120, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (9, 100005, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (10, 100005, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (11, 100006, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (12, 100006, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 0);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (13, 100007, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (14, 100007, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (15, 100008, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (16, 100008, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (17, 100009, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (18, 100009, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 0);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (19, 100010, 4, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 45, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (20, 100010, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (21, 100016, 9, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 80, 1);
INSERT INTO PAIEMENTS (id_paiement, numero_licence_membre, id_regle, date_frais, montant_euros, est_paye) VALUES (22, 100001, 11, TO_DATE('2025-01-20', 'YYYY-MM-DD'), 200, 1);

-- ============================================================= --
-- 📖 PRÉPARATIONS DE CERTIFICATIONS
-- ============================================================= --

INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation) VALUES (100005, 'N2', TO_DATE('2025-06-01', 'YYYY-MM-DD'));
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation) VALUES (100006, 'N3', TO_DATE('2025-07-15', 'YYYY-MM-DD'));
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation) VALUES (100007, 'E1', TO_DATE('2025-08-01', 'YYYY-MM-DD'));
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation) VALUES (100008, 'N2', TO_DATE('2025-09-01', 'YYYY-MM-DD'));
INSERT INTO PREPARATION_CERTIF (numero_licence_membre, code_certification, date_debut_formation) VALUES (100009, 'E2', TO_DATE('2025-10-01', 'YYYY-MM-DD'));

-- ============================================================= --
-- 🏆 OBTENTIONS DE CERTIFICATIONS
-- ============================================================= --

INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100001, 'N4', TO_DATE('2020-06-15', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100001, 'E2', TO_DATE('2021-05-20', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100002, 'N3', TO_DATE('2019-07-10', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100003, 'N2', TO_DATE('2020-08-22', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100004, 'N4', TO_DATE('2021-09-05', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100004, 'E1', TO_DATE('2022-06-18', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100005, 'N1', TO_DATE('2023-05-12', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100006, 'N2', TO_DATE('2022-07-08', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100007, 'N3', TO_DATE('2021-06-25', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100008, 'N1', TO_DATE('2024-04-15', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100009, 'N1', TO_DATE('2023-08-20', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100010, 'N1', TO_DATE('2024-03-10', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100011, 'N1', TO_DATE('2023-09-05', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100012, 'N2', TO_DATE('2022-10-12', 'YYYY-MM-DD'));
INSERT INTO OBTENTION_CERTIF (numero_licence_membre, code_certification, date_obtention) VALUES (100013, 'N1', TO_DATE('2024-06-18', 'YYYY-MM-DD'));

-- ============================================================= --
-- 🎓 SESSIONS DE FORMATION
-- ============================================================= --

INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (1, TO_DATE('2025-08-18', 'YYYY-MM-DD'), 10, 3, 'N1', 100001);
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (2, TO_DATE('2025-09-15', 'YYYY-MM-DD'), 12, 7, 'N2', 100001);
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (3, TO_DATE('2025-10-05', 'YYYY-MM-DD'), 15, 11, 'N2', 100001);
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (4, TO_DATE('2025-10-12', 'YYYY-MM-DD'), 10, 15, 'N1', 100001);
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (5, TO_DATE('2025-10-20', 'YYYY-MM-DD'), 12, 19, 'E1', 100004);
INSERT INTO SESSION_FORMATION (id_session, date_session, profondeur_metres, id_palanquee, code_certification, numero_licence_instructeur) VALUES (6, TO_DATE('2025-10-25', 'YYYY-MM-DD'), 10, 23, 'N1', 100001);

-- ============================================================= --
-- ✍️ INSCRIPTIONS AUX SESSIONS
-- ============================================================= --

INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (1, 100013);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (1, 100014);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (1, 100015);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (2, 100005);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (2, 100008);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (3, 100005);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (3, 100008);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (4, 100013);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (4, 100014);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (5, 100007);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (6, 100013);
INSERT INTO INSCRIPTIONS_SESSION (id_session, numero_licence_membre) VALUES (6, 100015);

-- ============================================================= --
-- 📊 RÉSULTATS DES SESSIONS
-- ============================================================= --

INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (1, 'Bonne maîtrise du palmage', 100013, 1);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (2, 'Vidage de masque à améliorer', 100014, 1);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (3, 'Très bien', 100015, 1);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (4, 'Progrès constants', 100005, 2);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (5, 'Bon niveau', 100008, 2);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (6, 'Excellent', 100005, 3);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (7, 'Très bon', 100008, 3);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (8, 'Bien', 100013, 4);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (9, 'À améliorer', 100014, 4);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (10, 'Excellent formateur', 100007, 5);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (11, 'Bon', 100013, 6);
INSERT INTO RESULTATS_SESSION_FORMATION (id_resultat, commentaires, numero_licence_membre, id_session) VALUES (12, 'Très bien', 100015, 6);

-- ============================================================= --
-- ✅ ÉVALUATIONS DES COMPÉTENCES
-- ============================================================= --

INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (1, 1, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (1, 2, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (1, 3, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (1, 4, 'en_cours');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (1, 5, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (2, 1, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (2, 2, 'en_cours');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (2, 3, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (2, 4, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (2, 5, 'non_acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (3, 1, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (3, 2, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (3, 3, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (3, 4, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (3, 5, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (4, 6, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (4, 7, 'en_cours');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (4, 8, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (5, 6, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (5, 7, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (5, 9, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (5, 10, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (6, 6, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (6, 7, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (6, 9, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (6, 10, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (7, 6, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (7, 7, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (7, 9, 'en_cours');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (7, 10, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (9, 11, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (9, 12, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (9, 13, 'acquis');
INSERT INTO EVALUATIONS (id_resultat, id_competence, statut_competence) VALUES (9, 14, 'acquis');

COMMIT;
