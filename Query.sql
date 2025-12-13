-- ============================================================= --
-- 💣 CLEANUP (REVERSE DEPENDENCY ORDER)
-- ============================================================= --

-- Level 3: Tables with FKs to Level 2 or 1
DROP TABLE RESULTATS_SESSION_FORMATION;
DROP TABLE SESSION_FORMATION;
DROP TABLE COMPETENCES;

-- Level 2: Tables with FKs to Level 1
DROP TABLE CATEGORIES_COMPETENCES;

-- Level 1: Independent / Parent Tables
DROP TABLE CERTIFICATIONS;
DROP TABLE MEMBRES;
DROP TABLE SORTIES_PLONGEE;
DROP TABLE PALANQUEES;
DROP TABLE BATEAUX;
DROP TABLE SITES_PLONGEE;
DROP TABLE MATERIEL;
DROP TABLE REGLES_TARIFICATIONS;

-- ============================================================= --
-- 🏗️ SCHEMA SETUP
-- ============================================================= --

CREATE TABLE MEMBRES (
    numero_license INTEGER,
    nom VARCHAR2(100) NOT NULL,
    prenom VARCHAR2(100) NOT NULL,
    date_naissance DATE,
    adresse VARCHAR2(255),
    telephone VARCHAR2(20),
    email VARCHAR2(150),
    groupe_sanguin VARCHAR2(5),
    date_delivrance_licence DATE,
    date_certificat_medical DATE,
    url_photo VARCHAR2(500),

    CONSTRAINT PK_MEMBRES
        PRIMARY KEY (numero_license),

    CONSTRAINT CK_MEMBRES_GRP_SANGUIN
        CHECK (groupe_sanguin IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
);

CREATE TABLE REGLES_TARIFICATIONS (
    id_regle INTEGER,
    type_frais VARCHAR(20),
    categorie_age VARCHAR2(20),
    est_etudiant NUMBER(1) DEFAULT 0 NOT NULL,
    est_aidant_accompagnant NUMBER(1) DEFAULT 0 NOT NULL,
    type_accueil VARCHAR(20),
    montant_euros NUMBER(10, 2),

    CONSTRAINT PK_REGLES_TARIFICATIONS
        PRIMARY KEY (id_regle),

    CONSTRAINT CK_TARIF_EST_ETUDIANT
        CHECK (est_etudiant IN (0, 1)),

    CONSTRAINT CK_TARIF_EST_AIDANT
        CHECK (est_aidant_accompagnant IN (0, 1)),

    CONSTRAINT CK_TARIF_CAT_AGE
        CHECK (categorie_age IN ('moins_12_ans', 'moins_16_ans', 'adulte')),

    CONSTRAINT CK_TARIF_TYPE_FRAIS
        CHECK (type_frais IN ('licence', 'cotisation', 'plongee', 'formation')),

    CONSTRAINT CK_TARIF_TYPE_ACCUEIL
        CHECK (type_accueil IN ('adherent', 'federal'))
);

CREATE TABLE MATERIEL (
    numero_inventaire INTEGER,
    type_materiel VARCHAR2(100),
    marque VARCHAR2(100),
    modele VARCHAR2(100),
    taille VARCHAR2(2),
    date_achat DATE,
    date_derniere_revision DATE,

    CONSTRAINT PK_MATERIEL
        PRIMARY KEY (numero_inventaire),

    CONSTRAINT CK_MATERIEL_TAILLE
        CHECK (taille IN ('XS', 'S', 'M', 'L', 'XL'))
);

CREATE TABLE SITES_PLONGEE (
    id_site INTEGER,
    nom_site VARCHAR2(100),
    milieu VARCHAR2(20),
    latitude NUMBER(10,8),
    longitude NUMBER(11,8),
    profondeur_max_metres INTEGER,
    description VARCHAR2(4000),
    url_photo VARCHAR2(500),
    url_plan_site VARCHAR2(500),

    CONSTRAINT PK_SITES_PLONGEE
        PRIMARY KEY (id_site),

    CONSTRAINT CK_SITES_MILIEU
        CHECK (milieu IN ('artificiel', 'naturel'))
);

CREATE TABLE BATEAUX (
    nom_bateau VARCHAR2(100),
    capacite_places INTEGER NOT NULL,

    CONSTRAINT PK_BATEAUX
        PRIMARY KEY (nom_bateau)
);

CREATE TABLE PALANQUEES (
    id_palanquee INTEGER,
    type_groupe VARCHAR2(20),
    profondeur_max_metres INTEGER,
    duree_plongee_minutes INTEGER,

    id_sortie INTEGER,
    numero_licence_encadrant INTEGER,

    CONSTRAINT PK_PALANQUEES
        PRIMARY KEY (id_palanquee),

    CONSTRAINT CK_PALANQUEES_TYPE_GRP
        CHECK (type_groupe IN ('autonome', 'encadrée', 'enseignement')),

    CONSTRAINT FK_PALANQUEES_SORTIE
        FOREIGN KEY (id_sortie) REFERENCES SORTIES_PLONGEE (id_sortie),

    CONSTRAINT FK_PALANQUEES_ENCADRANT
        FOREIGN KEY (numero_licence_encadrant) REFERENCES MEMBRES (numero_license)
);

CREATE TABLE SORTIES_PLONGEE (
    id_sortie INTEGER,
    date_sortie DATE,
    heure_debut TIMESTAMP,

    id_site INTEGER,
    nom_bateau VARCHAR2(100),

    numero_licence_directeur INTEGER,
    numero_licence_pilote INTEGER,
    numero_licence_securite INTEGER,

    CONSTRAINT PK_SORTIES_PLONGEE
        PRIMARY KEY (id_sortie),

    CONSTRAINT FK_SORTIES_SITE
        FOREIGN KEY (id_site) REFERENCES SITES_PLONGEE (id_site),

    CONSTRAINT FK_SORTIES_BATEAU
        FOREIGN KEY (nom_bateau) REFERENCES BATEAUX (nom_bateau),

    CONSTRAINT FK_SORTIES_DIRECTEUR
        FOREIGN KEY (numero_licence_directeur) REFERENCES MEMBRES (numero_license),

    CONSTRAINT FK_SORTIES_PILOTE
        FOREIGN KEY (numero_licence_pilote) REFERENCES MEMBRES (numero_license),

    CONSTRAINT FK_SORTIES_SECURITE
        FOREIGN KEY (numero_licence_securite) REFERENCES MEMBRES (numero_license)
);

CREATE TABLE CERTIFICATIONS (
    code_certification VARCHAR2(2),
    type_certification VARCHAR2(20),
    profondeur_max_autonome INTEGER,
    profondeur_max_plongee INTEGER,
    profondeur_max_encadrement INTEGER,

    CONSTRAINT PK_CERTIFICATIONS
        PRIMARY KEY (code_certification),

    CONSTRAINT CK_CERTIF_TYPE
        CHECK (type_certification IN ('plongee', 'encadrement'))
);

CREATE TABLE CATEGORIES_COMPETENCES (
    id_categorie INTEGER,
    nom_categorie VARCHAR2(100),

    code_certification VARCHAR2(2),

    CONSTRAINT PK_CATEGORIES_COMPETENCES
        PRIMARY KEY (id_categorie),

    CONSTRAINT FK_CAT_COMP_CODE_CERT
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS(code_certification)
);

CREATE TABLE COMPETENCES (
    id_competence INTEGER,
    nom_competence VARCHAR(100) NOT NULL,
    est_obligatoire NUMBER(1) DEFAULT 0 NOT NULL,

    id_categorie INTEGER,
    id_competence_parent INTEGER,

    CONSTRAINT PK_COMPETENCES
        PRIMARY KEY (id_competence),

    CONSTRAINT FK_COMPETENCES_CATEGORIE
        FOREIGN KEY (id_categorie) REFERENCES CATEGORIES_COMPETENCES(id_categorie),

    CONSTRAINT FK_COMPETENCES_PARENT
        FOREIGN KEY (id_competence_parent) REFERENCES COMPETENCES(id_competence),

    CONSTRAINT CK_COMPETENCES_OBLIGATOIRE
        CHECK (est_obligatoire IN (0, 1))
);

CREATE TABLE SESSION_FORMATION (
    id_session INTEGER,
    date_session DATE,
    profondeur_metres INTEGER,

    id_palanquee INTEGER,
    code_certification VARCHAR2(2),
    numero_licence_instructeur INTEGER,

    CONSTRAINT PK_SESSION_FORMATION
        PRIMARY KEY (id_session),

    CONSTRAINT FK_SESS_FORM_ID_PALANQ
        FOREIGN KEY (id_palanquee) REFERENCES PALANQUEES(id_palanquee),

    CONSTRAINT FK_SESS_FORM_CODE_CERT
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS(code_certification),

    CONSTRAINT FK_SESS_FORM_INSTRUC
        FOREIGN KEY (numero_licence_instructeur) REFERENCES MEMBRES(numero_license)
);

CREATE TABLE RESULTATS_SESSION_FORMATION (
    id_resultat INTEGER NOT NULL,
    commentaires VARCHAR2(500),

    CONSTRAINT PK_RESULTATS_SESS_FORM
        PRIMARY KEY (id_resultat)
);