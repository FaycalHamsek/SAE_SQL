--voir la liste des enseignants
CREATE VIEW Enseignants_View AS 
SELECT id_enseignant, nom_enseignant, prénom_enseignant
FROM Enseignant;

 -- voir les notes du groupe G1
CREATE VIEW Notes_Groupe_View AS 
SELECT Etudiant.nom_etudiant, Etudiant.prénom_etudiant, Evaluation.note
FROM Etudiant 
JOIN Evaluation ON CAST(Etudiant.id_etudiant AS VARCHAR) = Evaluation.id_etudiant
WHERE Etudiant.groupe = 'G1';

-- voir les etudiants des groupes
CREATE VIEW Etudiant_Groupe_View AS 
SELECT Etudiant.id_etudiant, Etudiant.nom_etudiant, Etudiant.prénom_etudiant, Groupe.nom_groupe, Groupe.filière
FROM Etudiant
INNER JOIN Groupe ON Etudiant.groupe = Groupe.nom_groupe;
