--un enseignant peut supprimer une note d'un module dont il est responsable
CREATE OR REPLACE FUNCTION supprimer_note_responsable(p_enseignant_id INTEGER, p_module_id VARCHAR(200), p_etudiant_id VARCHAR(200), p_evaluation_id VARCHAR(200))
RETURNS VOID
AS $$
BEGIN
    DELETE FROM Evaluation e
    USING Controle c 
    INNER JOIN Module m ON c.id_module = m.id_module
    INNER JOIN Ressource r ON m.id_ressource = r.id_ressource
    WHERE e.id_evaluation = p_evaluation_id 
        AND e.id_etudiant = p_etudiant_id 
        AND c.id_module = p_module_id 
        AND r.id_ressource = ANY (
            SELECT id_ressource
            FROM Enseignant
            WHERE id_enseignant = p_enseignant_id
        );
END;
$$ LANGUAGE plpgsql;

-- une étudiant ne peut pas modifier les notes
CREATE FUNCTION update_evaluation_forbidden() RETURNS trigger AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        RAISE EXCEPTION 'Vous n''êtes pas autorisé à modifier les notes';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 -- il lui faut son trigger
 CREATE TRIGGER evaluation_update_forbidden
BEFORE UPDATE ON Evaluation
FOR EACH ROW
EXECUTE FUNCTION update_evaluation_forbidden();

-- un enseignent ne peut consulter que les notes de la ressource dont il est responsable
CREATE FUNCTION get_notes_responsable(p_enseignant_id INTEGER)
RETURNS TABLE (id_evaluation VARCHAR(200), id_controle VARCHAR(200), id_etudiant VARCHAR(200), coef DECIMAL, note DECIMAL)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.id_evaluation, e.id_controle, e.id_etudiant, e.coef, e.note
    FROM Evaluation e
    INNER JOIN Controle c ON e.id_controle = c.id_controle
    INNER JOIN Module m ON c.id_module = m.id_module
    INNER JOIN Ressource r ON m.id_ressource = r.id_ressource
    WHERE r.id_ressource = ANY (
        SELECT id_ressource
        FROM Enseignant
        WHERE id = p_enseignant_id
    );
END;
$$ LANGUAGE plpgsql;