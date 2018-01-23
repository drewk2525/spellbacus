 <?php
//header("Access-Control-Allow-Origin: *");
//header("Content-Type: application/json; charset=UTF-8");


$level = $_GET['level'];
$char_class = $_GET['class'];
if($char_class == 'Sorcerer'){
    $char_class = 'wizard';
}
if($char_class == 'Oracle'){
    $char_class = 'cleric';
}
$class_string = strtolower($char_class)."_level";

$query = "SELECT spells.*, schools.school_name AS school,
                 subschools.school_name AS subschool, sources.source_name AS source
                 FROM spells
                 LEFT JOIN schools ON spells.school = schools.id
                 LEFT JOIN schools AS subschools ON spells.subschool = subschools.id
                 LEFT JOIN sources ON spells.source = sources.id
                 WHERE spells.".$class_string." = '".$level."'
                 ORDER BY spells.spell_name";
/*  Local Machine Credentials
$dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', 'root', 'root');
*/
// Server Credentials
$dbh = new PDO('mysql:host=localhost;dbname=drewk225_pathfinder;charset=utf8', 'drewk225_drew', 'PennyLane35');
$stmt=$dbh->prepare($query);


$stmt->execute();
//set results to variable
/*
*/
//$result = $stmt->fetchall(PDO::FETCH_ASSOC);


$outp = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $outp[] = array("id" => $row["id"],
    "spell_name" => $row["spell_name"],
    "school" => $row["school"],
    "force" => $row["force"],
    "subschool" => $row["subschool"],
    "alchemist_level" => $row["alchemist_level"],
    "antipaladin_level" => $row["antipaladin_level"],
    "bard_level" => $row["bard_level"],
    "cleric_level" => $row["cleric_level"],
    "druid_level" => $row["druid_level"],
    "inquisitor_level" => $row["inquisitor_level"],
    "magus_level" => $row["magus_level"],
    "paladin_level" => $row["paladin_level"],
    "ranger_level" => $row["ranger_level"],
    "summoner_level" => $row["summoner_level"],
    "witch_level" => $row["witch_level"],
    "wizard_level" => $row["wizard_level"],
    "casting_time" => $row["casting_time"],
    "verbal" => $row["verbal"],
    "somatic" => $row["somatic"],
    "material" => $row["material"],
    "focus" => $row["focus"],
    "divine_focus" => $row["divine_focus"],
    "component_text" => $row["component_text"],
    "spell_range" => $row["spell_range"],
    "duration" => $row["duration"],
    "dismiss" => $row["dismiss"],
    "saving_throw" => $row["saving_throw"],
    "spell_resistance" => $row["spell_resistance"],
    "targets" => $row["targets"],
    "shapeable" => $row["shapeable"],
    "source" => $row["source"],
    "description" => $row["description"]);
}
$outp = json_encode($outp);

echo($outp);
?>