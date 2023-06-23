-- retirer une note
CREATE OR REPLACE PROCEDURE retirer_note(
    p_id_evaluation VARCHAR
)
AS $$
BEGIN
    DELETE FROM Evaluation
    WHERE id_evaluation = p_id_evaluation;
END;
$$ LANGUAGE plpgsql;

--ajouter une SAE
CREATE OR REPLACE PROCEDURE ajouter_sae(
    p_id_sae VARCHAR,
    p_nom_sae VARCHAR,
    p_id_ressource VARCHAR,
    p_note DOUBLE PRECISION
)
AS $$
BEGIN
    INSERT INTO SAE (id_sae, nom_sae, id_ressource, note)
    VALUES (p_id_sae, p_nom_sae, p_id_ressource, p_note);
END;
$$ LANGUAGE plpgsql;


-- ajouter une note a un groupe 
CREATE OR REPLACE FUNCTION ajouter_note_groupe(
    id_groupe INT, 
    id_evaluation VARCHAR(200), 
    id_controle VARCHAR(200), 
    id_etudiant VARCHAR(200), 
    coef DECIMAL, 
    note DECIMAL
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Evaluation(id_evaluation, id_controle, id_etudiant, coef, note)
    VALUES(id_evaluation, id_controle, id_etudiant, coef, note);

    UPDATE Etudiant 
    SET moyenne = (
        SELECT AVG(note * coef)
        FROM Evaluation
        WHERE Evaluation.id_etudiant = Etudiant.id_etudiant
    )
    WHERE Etudiant.id_groupe = id_groupe;
END;
$$ LANGUAGE plpgsql;
