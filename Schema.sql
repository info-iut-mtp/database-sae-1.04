-- ============================================================= --
-- 💣 CLEANUP (REVERSE DEPENDENCY ORDER)
-- ============================================================= --

-- Level 4: Disconnected tables
DROP TABLE RESULTATS_SESSION_FORMATION;

-- Level 3: Tables with FKs to Level 2 or 1
DROP TABLE SESSION_FORMATION;
DROP TABLE COMPETENCES;
DROP TABLE PALANQUEES;

-- Level 2: Tables with FKs to Level 1
DROP TABLE SORTIES_PLONGEE;
DROP TABLE CATEGORIES_COMPETENCES;

-- Level 1: Independent / Parent Tables
DROP TABLE CERTIFICATIONS;
DROP TABLE MEMBRES;
DROP TABLE BATEAUX;
DROP TABLE SITES_PLONGEE;
DROP TABLE MATERIEL;
DROP TABLE REGLES_TARIFICATIONS;

-- ============================================================= --
-- 🏗️ SCHEMA SETUP
-- ============================================================= --

CREATE TABLE MEMBRES (
    numero_licence INTEGER,
    nom VARCHAR2(100) NOT NULL,
    prenom VARCHAR2(100) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR2(255),
    telephone VARCHAR2(20),
    email VARCHAR2(150),
    groupe_sanguin VARCHAR2(5),
    date_delivrance_licence DATE,
    date_certificat_medical DATE,
    url_photo VARCHAR2(500),

    CONSTRAINT PK_MEMBRES
        PRIMARY KEY (numero_licence),

    CONSTRAINT CK_MEMBRES_GRP_SANGUIN
        CHECK (groupe_sanguin IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'))
);

CREATE TABLE REGLES_TARIFICATIONS (
    id_regle INTEGER,
    type_frais VARCHAR(20) NOT NULL,
    categorie_age VARCHAR2(20) NOT NULL,
    est_etudiant NUMBER(1) DEFAULT 0 NOT NULL,
    est_aidant_accompagnant NUMBER(1) DEFAULT 0 NOT NULL,
    type_accueil VARCHAR(20) NOT NULL,
    montant_euros NUMBER(10, 2) NOT NULL,

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
    type_materiel VARCHAR2(100) NOT NULL,
    marque VARCHAR2(100) NOT NULL,
    modele VARCHAR2(100) NOT NULL,
    taille VARCHAR2(3),
    date_achat DATE,
    date_derniere_revision DATE,

    CONSTRAINT PK_MATERIEL
        PRIMARY KEY (numero_inventaire),

    CONSTRAINT CK_MATERIEL_TAILLE
        CHECK (taille IN ('2XS', 'XS', 'S', 'M', 'L', 'XL', '2XL'))
);

CREATE TABLE SITES_PLONGEE (
    id_site INTEGER,
    nom_site VARCHAR2(100) NOT NULL,
    milieu VARCHAR2(20) NOT NULL,
    latitude NUMBER(10,8) NOT NULL,
    longitude NUMBER(11,8) NOT NULL,
    profondeur_max_metres INTEGER NOT NULL,
    description VARCHAR2(4000),
    url_photo VARCHAR2(500),
    url_plan_site VARCHAR2(500),

    CONSTRAINT PK_SITES_PLONGEE
        PRIMARY KEY (id_site),

    CONSTRAINT CK_SITES_MILIEU
        CHECK (milieu IN ('artificiel', 'naturel'))
);

CREATE TABLE BATEAUX (
    id_bateau INTEGER,
    nom_bateau VARCHAR2(100) NOT NULL,
    capacite_places INTEGER NOT NULL,

    CONSTRAINT PK_BATEAUX
        PRIMARY KEY (id_bateau)
);

CREATE TABLE SORTIES_PLONGEE (
    id_sortie INTEGER,
    date_heure_debut DATE NOT NULL,

    id_site INTEGER NOT NULL,
    id_bateau INTEGER,

    numero_licence_directeur INTEGER NOT NULL,
    numero_licence_pilote INTEGER,
    numero_licence_securite INTEGER,

    CONSTRAINT PK_SORTIES_PLONGEE
        PRIMARY KEY (id_sortie),

    CONSTRAINT FK_SORTIES_SITE
        FOREIGN KEY (id_site) REFERENCES SITES_PLONGEE (id_site),
    CONSTRAINT FK_SORTIES_BATEAU
        FOREIGN KEY (id_bateau) REFERENCES BATEAUX (id_bateau),
    CONSTRAINT FK_SORTIES_DIRECTEUR
        FOREIGN KEY (numero_licence_directeur) REFERENCES MEMBRES (numero_licence),
    CONSTRAINT FK_SORTIES_PILOTE
        FOREIGN KEY (numero_licence_pilote) REFERENCES MEMBRES (numero_licence),
    CONSTRAINT FK_SORTIES_SECURITE
        FOREIGN KEY (numero_licence_securite) REFERENCES MEMBRES (numero_licence),

    -- Enforce that if a boat is used, a pilot is required.
    -- Conversely, if no boat is used, no pilot should be listed.
    CONSTRAINT CK_SORTIES_COHERENCE_PILOTE
        CHECK (
            (id_bateau IS NULL AND numero_licence_pilote IS NULL)
            OR
            (id_bateau IS NOT NULL AND numero_licence_pilote IS NOT NULL)
        )
);

CREATE TABLE PALANQUEES (
    id_palanquee INTEGER,
    type_groupe VARCHAR2(20) NOT NULL,
    profondeur_max_metres INTEGER NOT NULL,
    duree_plongee_minutes INTEGER NOT NULL,

    id_sortie INTEGER NOT NULL,
    numero_licence_encadrant INTEGER,

    CONSTRAINT PK_PALANQUEES
        PRIMARY KEY (id_palanquee),

    CONSTRAINT FK_PALANQUEES_SORTIE
        FOREIGN KEY (id_sortie) REFERENCES SORTIES_PLONGEE (id_sortie),
    CONSTRAINT FK_PALANQUEES_ENCADRANT
        FOREIGN KEY (numero_licence_encadrant) REFERENCES MEMBRES (numero_licence),

    CONSTRAINT CK_PALANQUEES_TYPE_GRP
        CHECK (type_groupe IN ('autonome', 'encadrée', 'enseignement')),

    -- Enforce that if the group is autonomous, they cannot have a guide.
    -- Conversely, if the group is guided or in training, a guide is required.
    CONSTRAINT CK_PALANQUEES_COHERENCE_ENCADRANT
        CHECK (
            (type_groupe = 'autonome' AND numero_licence_encadrant IS NULL)
            OR
            (type_groupe IN ('encadrée', 'enseignement') AND numero_licence_encadrant IS NOT NULL)
        )
);

CREATE TABLE CERTIFICATIONS (
    code_certification VARCHAR2(10),
    type_certification VARCHAR2(20) NOT NULL,
    profondeur_max_autonome INTEGER NOT NULL,
    profondeur_max_plongee INTEGER NOT NULL,
    profondeur_max_encadrement INTEGER NOT NULL,

    CONSTRAINT PK_CERTIFICATIONS
        PRIMARY KEY (code_certification),

    CONSTRAINT CK_CERTIF_TYPE
        CHECK (type_certification IN ('plongee', 'encadrement'))
);

CREATE TABLE CATEGORIES_COMPETENCES (
    id_categorie INTEGER,
    nom_categorie VARCHAR2(100) NOT NULL,

    code_certification VARCHAR2(10) NOT NULL,

    CONSTRAINT PK_CATEGORIES_COMPETENCES
        PRIMARY KEY (id_categorie),

    CONSTRAINT FK_CAT_COMP_CODE_CERT
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS(code_certification)
);

CREATE TABLE COMPETENCES (
    id_competence INTEGER,
    nom_competence VARCHAR(100) NOT NULL,
    est_obligatoire NUMBER(1) DEFAULT 0 NOT NULL,

    id_categorie INTEGER NOT NULL,
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
    date_session DATE NOT NULL,
    profondeur_metres INTEGER NOT NULL,

    id_palanquee INTEGER NOT NULL,
    code_certification VARCHAR2(10) NOT NULL,
    numero_licence_instructeur INTEGER NOT NULL,

    CONSTRAINT PK_SESSION_FORMATION
        PRIMARY KEY (id_session),

    CONSTRAINT FK_SESS_FORM_ID_PALANQ
        FOREIGN KEY (id_palanquee) REFERENCES PALANQUEES(id_palanquee),
    CONSTRAINT FK_SESS_FORM_CODE_CERT
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS(code_certification),
    CONSTRAINT FK_SESS_FORM_INSTRUC
        FOREIGN KEY (numero_licence_instructeur) REFERENCES MEMBRES(numero_licence)
);

CREATE TABLE RESULTATS_SESSION_FORMATION (
    id_resultat INTEGER,
    commentaires VARCHAR2(500),

    CONSTRAINT PK_RESULTATS_SESS_FORM
        PRIMARY KEY (id_resultat)
);

-- ============================================================= --
-- ⚡ PERFORMANCE INDEXES
--
-- Create FK indexes to avoid table-level locking during parent
-- updates and to optimize JOIN performance on read queries.
-- ============================================================= --

CREATE INDEX IDX_SORTIES_SITE ON SORTIES_PLONGEE(id_site);
CREATE INDEX IDX_SORTIES_BATEAU ON SORTIES_PLONGEE(id_bateau);
CREATE INDEX IDX_SORTIES_DIR ON SORTIES_PLONGEE(numero_licence_directeur);
CREATE INDEX IDX_SORTIES_PILOTE ON SORTIES_PLONGEE(numero_licence_pilote);
CREATE INDEX IDX_SORTIES_SEC ON SORTIES_PLONGEE(numero_licence_securite);