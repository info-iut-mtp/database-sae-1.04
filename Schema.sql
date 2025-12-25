-- ============================================================= --
-- 💣 CLEANUP (REVERSE DEPENDENCY ORDER)
-- ============================================================= --

-- Level 6: Most dependent tables
DROP TABLE EVALUATIONS;
DROP TABLE INSCRIPTIONS_SESSION;
DROP TABLE OBTENTION_CERTIF;
DROP TABLE RESULTATS_SESSION_FORMATION;

-- Level 4: Associations
DROP TABLE PREPARATION_CERTIF;
DROP TABLE PAIEMENTS;
DROP TABLE EMPRUNTS;
DROP TABLE COMPOSITION_PALANQUEE;

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
    type_frais VARCHAR2(20) NOT NULL,
    categorie_age VARCHAR2(20) NOT NULL,
    est_etudiant NUMBER(1) DEFAULT 0 NOT NULL,
    est_aidant_accompagnant NUMBER(1) DEFAULT 0 NOT NULL,
    type_accueil VARCHAR2(20) NOT NULL,
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

    CONSTRAINT CK_SORTIES_COHERENCE_PILOT
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

    CONSTRAINT CK_PALANQ_COHERENCE_ENCAD
        CHECK (
            (type_groupe = 'autonome' AND numero_licence_encadrant IS NULL)
            OR
            (type_groupe IN ('encadrée', 'enseignement') AND numero_licence_encadrant IS NOT NULL)
        )
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
    nom_competence VARCHAR2(100) NOT NULL,
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

    numero_licence_membre INTEGER NOT NULL,
    id_session INTEGER NOT NULL,

    CONSTRAINT PK_RESULTATS_SESS_FORM
        PRIMARY KEY (id_resultat),

    CONSTRAINT FK_RESULTATS_SESSIONS
        FOREIGN KEY (id_session) REFERENCES SESSION_FORMATION(id_session),
    CONSTRAINT FK_RESULTATS_MEMBRES
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence)
);

-- ============================================================= --
-- 🏗️ SCHEMA SETUP (BIS)
-- ============================================================= --

CREATE TABLE COMPOSITION_PALANQUEE (
    id_palanquee INTEGER,
    numero_licence_membre INTEGER,

    CONSTRAINT PK_COMPOSITION_PALANQUEE
        PRIMARY KEY (id_palanquee, numero_licence_membre),

    CONSTRAINT FK_COMP_PAL_PALANQUEE
        FOREIGN KEY (id_palanquee) REFERENCES PALANQUEES(id_palanquee),
    CONSTRAINT FK_COMP_PAL_MEMBRE
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence)
);

CREATE TABLE EMPRUNTS (
    numero_licence_membre INTEGER,
    numero_inventaire INTEGER,
    date_debut DATE,
    date_fin DATE,

    CONSTRAINT PK_EMPRUNTS
        PRIMARY KEY (numero_licence_membre, numero_inventaire, date_debut),

    CONSTRAINT FK_EMPRUNTS_MEMBRE
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence),
    CONSTRAINT FK_EMPRUNTS_MATERIEL
        FOREIGN KEY (numero_inventaire) REFERENCES MATERIEL(numero_inventaire),

    CONSTRAINT CK_EMPRUNTS_DATES CHECK (date_fin >= date_debut)
);

CREATE TABLE PAIEMENTS (
    id_paiement INTEGER,
    numero_licence_membre INTEGER NOT NULL,
    id_regle INTEGER NOT NULL,
    date_frais DATE NOT NULL,
    montant_euros NUMBER(10, 2) NOT NULL,
    est_paye NUMBER(1) DEFAULT 0 NOT NULL,

    CONSTRAINT PK_PAIEMENTS
        PRIMARY KEY (id_paiement),

    CONSTRAINT FK_PAIEMENTS_MEMBRES
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence),
    CONSTRAINT FK_PAIEMENTS_REGLES_TARIF
        FOREIGN KEY (id_regle) REFERENCES REGLES_TARIFICATIONS(id_regle),

    CONSTRAINT CK_PAIEMENTS_EST_PAYE
        CHECK (est_paye IN (0, 1)),
    CONSTRAINT CK_PAIEMENTS_MONTANT_POSITIF
        CHECK (montant_euros >= 0)
);

CREATE TABLE PREPARATION_CERTIF (
    numero_licence_membre INTEGER,
    code_certification VARCHAR2(10),
    date_debut_formation DATE NOT NULL,

    CONSTRAINT PK_PREPARATION_CERTIF
        PRIMARY KEY (numero_licence_membre, code_certification),

    CONSTRAINT FK_PREPARATION_MEMBRES
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence),
    CONSTRAINT FK_PREPARATION_CERTIFICATIONS
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS(code_certification)
);

CREATE TABLE OBTENTION_CERTIF (
    numero_licence_membre INTEGER,
    code_certification VARCHAR2(10),
    date_obtention DATE,

    CONSTRAINT PK_OBTENTION_CERTIF
        PRIMARY KEY (numero_licence_membre, code_certification),

    CONSTRAINT FK_OBTENTIONS_MEMBRES
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES (numero_licence),
    CONSTRAINT FK_OBTENTIONS_CERTIFICATIONS
        FOREIGN KEY (code_certification) REFERENCES CERTIFICATIONS (code_certification)
);

CREATE TABLE INSCRIPTIONS_SESSION (
    id_session INTEGER,
    numero_licence_membre INTEGER,

    CONSTRAINT PK_INSCRIPTIONS
        PRIMARY KEY (id_session, numero_licence_membre),

    CONSTRAINT FK_INSCRIPTIONS_SESSIONS
        FOREIGN KEY (id_session) REFERENCES SESSION_FORMATION(id_session),
    CONSTRAINT FK_INSCRIPTIONS_MEMBRES
        FOREIGN KEY (numero_licence_membre) REFERENCES MEMBRES(numero_licence)
);

CREATE TABLE EVALUATIONS (
    id_resultat INTEGER,
    id_competence INTEGER,
    statut_competence VARCHAR2(50) NOT NULL,

    CONSTRAINT PK_EVALUATIONS
        PRIMARY KEY (id_resultat, id_competence),

    CONSTRAINT FK_EVAL_RESULTAT
        FOREIGN KEY (id_resultat) REFERENCES RESULTATS_SESSION_FORMATION(id_resultat),
    CONSTRAINT FK_EVAL_COMPETENCE
        FOREIGN KEY (id_competence) REFERENCES COMPETENCES(id_competence),

    CONSTRAINT CK_EVAL_STATUT
        CHECK (statut_competence IN ('acquis', 'en_cours', 'non_acquis'))
);

-- ============================================================= --
-- ⚡ PERFORMANCE INDEXES
-- ============================================================= --

-- 🌊 Dive Operations (Sorties & Palanquées)
CREATE INDEX IDX_SORTIES_SITE ON SORTIES_PLONGEE(id_site);
CREATE INDEX IDX_SORTIES_BATEAU ON SORTIES_PLONGEE(id_bateau);
CREATE INDEX IDX_SORTIES_DIR ON SORTIES_PLONGEE(numero_licence_directeur);
CREATE INDEX IDX_SORTIES_PILOTE ON SORTIES_PLONGEE(numero_licence_pilote);
CREATE INDEX IDX_SORTIES_SEC ON SORTIES_PLONGEE(numero_licence_securite);

CREATE INDEX IDX_PALANQUEES_SORTIE ON PALANQUEES(id_sortie);
CREATE INDEX IDX_PALANQ_ENCADRANT ON PALANQUEES(numero_licence_encadrant);

CREATE INDEX IDX_COMP_PAL_MEMBRE ON COMPOSITION_PALANQUEE(numero_licence_membre);

-- 🎓 Training & Certifications
CREATE INDEX IDX_CAT_COMP_CERTIF ON CATEGORIES_COMPETENCES(code_certification);

CREATE INDEX IDX_COMP_CATEGORIE ON COMPETENCES(id_categorie);
CREATE INDEX IDX_COMP_PARENT ON COMPETENCES(id_competence_parent);

CREATE INDEX IDX_SESS_FORM_PALANQUEE ON SESSION_FORMATION(id_palanquee);
CREATE INDEX IDX_SESS_FORM_CERTIF ON SESSION_FORMATION(code_certification);
CREATE INDEX IDX_SESS_FORM_INSTR ON SESSION_FORMATION(numero_licence_instructeur);

CREATE INDEX IDX_RESULTATS_MEMBRE ON RESULTATS_SESSION_FORMATION(numero_licence_membre);
CREATE INDEX IDX_RESULTATS_SESSION ON RESULTATS_SESSION_FORMATION(id_session);

CREATE INDEX IDX_INSCRIPTIONS_MEMBRE ON INSCRIPTIONS_SESSION(numero_licence_membre);

CREATE INDEX IDX_EVALUATIONS_COMPETENCE ON EVALUATIONS(id_competence);

CREATE INDEX IDX_PREP_CERTIF_CODE ON PREPARATION_CERTIF(code_certification);
CREATE INDEX IDX_OBTENTION_CERTIF_CODE ON OBTENTION_CERTIF(code_certification);

-- 🛠️ Equipment Management
CREATE INDEX IDX_EMPRUNTS_MATERIEL ON EMPRUNTS(numero_inventaire);
CREATE INDEX IDX_EMPRUNTS_DATES ON EMPRUNTS(date_debut, date_fin);

-- 💰 Financial Management
CREATE INDEX IDX_PAIEMENTS_MEMBRE ON PAIEMENTS(numero_licence_membre);
CREATE INDEX IDX_PAIEMENTS_REGLE ON PAIEMENTS(id_regle);
CREATE INDEX IDX_PAIEMENTS_EST_PAYE ON PAIEMENTS(est_paye);