-- ============================================================= --
-- 💣 CLEANUP
-- ============================================================= --

DROP TABLE resultats_session_formation;
DROP TABLE session_formation;
DROP TABLE competences;
DROP TABLE categories_competences;
DROP TABLE certifications;
DROP TABLE sorties_plongee;
DROP TABLE palanquees;
DROP TABLE bateaux;
DROP TABLE sites_plongee;
DROP TABLE materiel;
DROP TABLE regles_tarifications;
DROP TABLE membres;

-- ============================================================= --
-- 🏗️ SCHEMA SETUP (ENTITIES)
-- ============================================================= --

CREATE TABLE membres (
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

    CONSTRAINT pk_membres PRIMARY KEY (numero_license),

    CONSTRAINT ck_enum_groupe_sanguin CHECK (groupe_sanguin IN (
        'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
    ))
);

CREATE TABLE regles_tarifications (
    id_regle INTEGER,
    type_frais VARCHAR(20),
    categorie_age VARCHAR2(20),
    est_etudiant NUMBER(1) DEFAULT 0 NOT NULL,
    est_aidant_accompagnant NUMBER(1) DEFAULT 0 NOT NULL,
    type_accueil VARCHAR(20),
    montant_euros NUMBER(10, 2),

    CONSTRAINT pk_regles_tarifications PRIMARY KEY (id_regle),

    CONSTRAINT ck_bool_est_etudiant CHECK (est_etudiant IN (0, 1)),
    CONSTRAINT ck_bool_est_aidant CHECK (est_aidant_accompagnant IN (0, 1)),

    CONSTRAINT ck_enum_categorie_age CHECK (categorie_age IN ('moins_12_ans, moins_16_ans, adulte')),
    CONSTRAINT ck_enum_type_frais CHECK (type_frais IN ('licence', 'cotisation', 'plongee', 'formation')),
    CONSTRAINT ck_enum_type_accueil CHECK (type_accueil IN ('adherent', 'federal'))
);

CREATE TABLE materiel (
    numero_inventaire INTEGER,
    type_materiel VARCHAR2(100),
    marque VARCHAR2(100),
    modele VARCHAR2(100),
    taille VARCHAR2(2),
    date_achat DATE,
    date_derniere_revision DATE,

    CONSTRAINT pk_materiel PRIMARY KEY (numero_inventaire),

    CONSTRAINT ck_enum_taille CHECK (taille IN ('XS', 'S', 'M', 'L', 'XL'))
);

CREATE TABLE sites_plongee (
    id_site INTEGER,
    nom_site VARCHAR2(100),
    milieu VARCHAR2(20),
    latitude NUMBER(10,8),
    longitude NUMBER(11,8),
    profondeur_max_metres INTEGER,
    description VARCHAR2(4000),
    url_photo VARCHAR2(500),
    url_plan_site VARCHAR2(500),

    CONSTRAINT pk_site_plongee PRIMARY KEY (id_site),

    CONSTRAINT ck_enum_milieu CHECK (milieu IN ('artificiel', 'naturel'))
);

CREATE TABLE bateaux (
    nom_bateau VARCHAR2(100),
    capacite_places INTEGER NOT NULL,

    CONSTRAINT pk_bateaux PRIMARY KEY (nom_bateau)
);

CREATE TABLE palanquees (
    id_palanquee INTEGER,
    type_groupe VARCHAR2(20),
    profondeur_max_metres INTEGER,
    duree_plongee_minutes INTEGER,

    CONSTRAINT pk_palanquees PRIMARY KEY (id_palanquee),

    CONSTRAINT ck_enum_type_groupe CHECK (type_groupe IN ('autonome, encadrée, enseignement'))
);

CREATE TABLE sorties_plongee (
    id_sortie INTEGER,
    date_sortie DATE,
    heure_debut TIMESTAMP,

    CONSTRAINT pk_sorties_plongee PRIMARY KEY (id_sortie)
);

CREATE TABLE certifications (
    code_certification VARCHAR2(2),
    type_certification VARCHAR2(20),
    profondeur_max_autonome INTEGER,
    profondeur_max_plongee INTEGER,
    profondeur_max_encadrement INTEGER,

    CONSTRAINT pk_certifications PRIMARY KEY (code_certification),

    CONSTRAINT ck_enum_type_certification CHECK (type_certification IN ('plongee', 'encadrement'))
);

CREATE TABLE categories_competences (
    id_categorie INTEGER,
    nom_categorie VARCHAR2(100),

    CONSTRAINT pk_categories_competences PRIMARY KEY (id_categorie)
);

CREATE TABLE competences (
    id_competence INTEGER,
    nom_competence VARCHAR(100) NOT NULL,
    est_obligatoire NUMBER(1) DEFAULT 0 NOT NULL,

    id_categorie INTEGER,
    id_competence_parent INTEGER,

    CONSTRAINT pk_competences PRIMARY KEY (id_competence),

    CONSTRAINT ck_bool_est_obligatoire CHECK (est_obligatoire IN (0, 1))
);

CREATE TABLE session_formation (
    id_session INTEGER,
    date_session DATE,
    profondeur_metres INTEGER,

    CONSTRAINT pk_session_formation PRIMARY KEY (id_session)
);

CREATE TABLE resultats_session_formation (
    id_resultat INTEGER NOT NULL,
    commentaires VARCHAR2(500),

    CONSTRAINT pk_resultats_session_formation PRIMARY KEY (id_resultat)
);

-- ============================================================= --
-- 🏗️ SCHEMA SETUP (ASSOCIATIONS)
-- ============================================================= --