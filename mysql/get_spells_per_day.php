 <?php
//header("Access-Control-Allow-Origin: *");
//header("Content-Type: application/json; charset=UTF-8");
$spells = $_GET['spells'];
$level = $_GET['level'];

/*  Local machine credentials
$dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', 'root', 'root');
*/
// Server Credentials
$dbh = new PDO('mysql:host=localhost;dbname=drewk225_pathfinder;charset=utf8', 'drewk225_drew', 'PennyLane35');
$stmt=$dbh->prepare("SELECT * FROM spell_count WHERE id=:spells AND char_level=:level LIMIT 1");
$stmt->bindParam(':spells',$spells);
$stmt->bindParam(':level',$level);
$stmt->execute();
//set results to variable
//$result = $stmt->fetchall(PDO::FETCH_ASSOC);

$outp = "[";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    if ($outp != "[") {
        $outp .= ",";
    }
    foreach($row as $key => $value){
        if($value === NULL){
            $row[$key] = "-";
        }
    }
    $outp .= '{"id":"'  . $row["id"] . '",';
    $outp .= '"char_level":"'   . $row["char_level"]        . '",';
    $outp .= '"0_spells":"'   . $row["0_spells"]        . '",';
    $outp .= '"1_spells":"'   . $row["1_spells"]        . '",';
    $outp .= '"2_spells":"'   . $row["2_spells"]        . '",';
    $outp .= '"3_spells":"'   . $row["3_spells"]        . '",';
    $outp .= '"4_spells":"'   . $row["4_spells"]        . '",';
    $outp .= '"5_spells":"'   . $row["5_spells"]        . '",';
    $outp .= '"6_spells":"'   . $row["6_spells"]        . '",';
    $outp .= '"7_spells":"'   . $row["7_spells"]        . '",';
    $outp .= '"8_spells":"'   . $row["8_spells"]        . '",';
    $outp .= '"9_spells":"'. $row["9_spells"]     . '"}';
}
$outp .="]";


echo($outp);
?>