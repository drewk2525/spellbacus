 <?php
//header("Access-Control-Allow-Origin: *");
//header("Content-Type: application/json; charset=UTF-8");

/* Local Machine Credentials
$dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', 'root', 'root');
*/
// Server Credentials
$dbh = new PDO('mysql:host=localhost;dbname=drewk225_pathfinder;charset=utf8', 'drewk225_drew', 'PennyLane35');
$stmt=$dbh->prepare("SELECT c.*, st.spell_type AS spell_type,
                            am.ability_modifier_name AS ability_modifier
                    FROM classes AS c
                    LEFT JOIN spell_types AS st ON c.spell_type = st.id
                    LEFT JOIN ability_modifiers AS am ON c.ability_modifier = am.id
                    ORDER BY c.class_name");
$stmt->execute();
//set results to variable
//$result = $stmt->fetchall(PDO::FETCH_ASSOC);

$outp = "[";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    if ($outp != "[") {
        $outp .= ",";
    }
    $outp .= '{"id":"'  . $row["id"] . '",';
    $outp .= '"class_name":"'   . $row["class_name"]        . '",';
    $outp .= '"spell_type":"'   . $row["spell_type"]        . '",';
    $outp .= '"ability_modifier":"'. $row["ability_modifier"]     . '",';
    $outp .= '"spells_per_day":"'. $row["spells_per_day"]     . '",';
    $outp .= '"spells_known":"'. $row["spells_known"]     . '"}';
}
$outp .="]";


echo($outp);
?>