INSERT INTO Ressource (id_ressource, nom_ressource, coef)
VALUES 
('RES-001', 'Livre Algorithmique', 1.5),
('RES-002', 'Code du travail', 2),
('RES-003', 'Data science', 2.5);

INSERT INTO SAE (id_sae, nom_sae, id_ressource, note)
VALUES 
('SAE-001', 'Projet Algorithmique', 'RES-001', 12.5),
('SAE-002', 'Projet Droit du travail', 'RES-002', 13.75),
('SAE-003', 'Projet Statistiques', 'RES-003', 16.25);

INSERT INTO Module1 (id_module, nom_module, moyenne, id_ressource, id_sae)
VALUES 
('MOD-001', 'Algorithmique', 14.5, 'RES-001', 'SAE-001'),
('MOD-002', 'Droit du travail', 12.75, 'RES-002', 'SAE-002'),
('MOD-003', 'Statistiques', 15.25, 'RES-003', 'SAE-003');

INSERT INTO Groupe (id_groupe, nom_groupe, eleves)
VALUES 
(1, 'G1', 25),
(2, 'G2', 30),
(3, 'G3', 20);

INSERT INTO Semestre (id_semestre, date_debut, date_fin, id_module)
VALUES 
(1, '2022-09-01', '2022-12-31', 'MOD-001'),
(2, '2023-01-01', '2023-04-30', 'MOD-002'),
(3, '2023-05-01', '2023-08-31', 'MOD-003');

INSERT INTO Enseignant (id_enseignant, nom_enseignant, prénom_enseignant, id_ressource, semestre)
VALUES 
(1, 'Durand', 'Jean', 'RES-001', 2),
(2, 'Martin', 'Sophie', 'RES-002', 1),
(3, 'Garcia', 'Pierre', 'RES-003', 3);

INSERT INTO Etudiant (nom, prénom, groupe, filière, id_semestre)
VALUES 
(1, 'Dupont', 'Marc', 'G1', 'Informatique', 1),
(2, 'Leclerc', 'Emma', 'G1', 'Génie civil', 2),
(3, 'Nguyen', 'Sophie', 'G2', 'Mathématiques', 1);


INSERT INTO Controle (id_controle, date_controle, id_module) VALUES ('C1', '2023-05-01', 'MOD-001');
INSERT INTO Controle (id_controle, date_controle, id_module) VALUES ('C2', '2023-06-15', 'MOD-002');
INSERT INTO Controle (id_controle, date_controle, id_module) VALUES ('C3', '2023-07-20', 'MOD-003');

INSERT INTO Evaluation (id_evaluation, id_controle, id_etudiant, coef, note)
VALUES 
('EVA-001', 'CTR-001', 1, 0.5, 13.75),
('EVA-002', 'CTR-002', 2, 0.8, 15.25),
('EVA-003', 'CTR-003', 3, 1, 16.5);
