-- Création de la table Ressource
CREATE TABLE Ressource (
    id_ressource VARCHAR(200) PRIMARY KEY, 
    nom_ressource VARCHAR(200), 
    Coef DECIMAL
);

-- Création de la table SAE
CREATE TABLE SAE (
    id_sae VARCHAR(200) PRIMARY KEY,
    nom_SAE VARCHAR(200), 
    id_ressource VARCHAR(200), 
    note DOUBLE PRECISION,
    FOREIGN KEY (id_ressource) REFERENCES Ressource(id_ressource)
);

-- Création de la table Module
CREATE TABLE Module1 (
    id_module VARCHAR(200) PRIMARY KEY, 
    nom_module VARCHAR(200), 
    moyenne DECIMAL, 
    id_ressource VARCHAR(200), 
    id_sae VARCHAR(200),
    FOREIGN KEY (id_ressource) REFERENCES Ressource(id_ressource), 
    FOREIGN KEY (id_sae) REFERENCES SAE(id_sae)
);

-- Création de la table Semestre
CREATE TABLE Semestre (
    id_semestre INT PRIMARY KEY, 
    date_debut DATE, 
    date_fin DATE,
    id_module VARCHAR(200),
    FOREIGN KEY (id_module) REFERENCES Module1(id_module)
);

-- Création de la table Groupe
CREATE TABLE Groupe (
    id_groupe INT PRIMARY KEY, 
    nom_groupe VARCHAR(200),
    eleves INT
);

-- Création de la table Enseignant
CREATE TABLE Enseignant (
    id_enseignant SERIAL PRIMARY KEY, 
    nom_enseignant VARCHAR(200), 
    prénom_enseignant VARCHAR(200),
    id_ressource VARCHAR(200), 
    semestre INT,
    FOREIGN KEY (id_ressource) REFERENCES Ressource(id_ressource)
);

-- Création de la table Etudiant
CREATE TABLE Etudiant (
    id_etudiant SERIAL PRIMARY KEY, 
    nom_etudiant VARCHAR(200), 
    prénom_etudiant VARCHAR(200), 
    groupe VARCHAR(200), 
    filière VARCHAR(200), 
    id_semestre INT,
    FOREIGN KEY (id_semestre) REFERENCES Semestre(id_semestre)
);


-- Création de la table Controle
CREATE TABLE Controle (
    id_controle VARCHAR(200) PRIMARY KEY,
    id_module VARCHAR(200),
    date_controle DATE,
    FOREIGN KEY (id_module) REFERENCES Module1(id_module)
);

-- Création de la table Evaluation
CREATE TABLE Evaluation (
    id_evaluation VARCHAR(200) PRIMARY KEY,
    id_controle VARCHAR(200),
    id_etudiant VARCHAR(200),
    coef DECIMAL,
    note DECIMAL
);
