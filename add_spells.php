<?php





require_once("db_login.php");
$error_msg = "";
$success = "";

$user='root';
$pass='root';
//create a new PDO connection, and connect to our ssl database
$dbh = new PDO('mysql:host=localhost;dbname=pathfinder;charset=utf8', $user, $pass);
    if (!$dbh) die("Unable to connect to MySQL: " .mysqli_error($conn));

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $stmt=$dbh->prepare("SELECT * FROM spells WHERE LCASE(spell_name) = LCASE(:spell_name) LIMIT 1");
    $stmt->bindParam(':spell_name',$_POST['spell_name']);
    $stmt->execute();

    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    if($result){
        $error_msg = $_POST['spell_name']." already exists!<br />";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !$result) {


    if($_POST['source_text'] != ''){
        $stmt=$dbh->prepare("INSERT INTO sources (source_name) VALUES (:source_name)");
        $stmt->bindParam(':source_name',$_POST['source_text']);
        $stmt->execute();
        $source = $dbh->lastInsertId();s
    } else {
        $source = $_POST['source'];
    }


    $stmt=$dbh->prepare("INSERT INTO spells
        VALUES (DEFAULT,
                :spell_name,
                :school,
                :force,
                :subschool,
                :alchemist_level,
                :antipaladin_level,
                :bard_level,
                :cleric_level,
                :druid_level,
                :inquisitor_level,
                :magus_level,
                :paladin_level,
                :ranger_level,
                :summoner_level,
                :witch_level,
                :wizard_level,
                :casting_time,
                :verbal,
                :somatic,
                :material,
                :focus,
                :divine_focus,
                :component_text,
                :spell_range,
                :duration,
                :dismiss,
                :saving_throw,
                :spell_resistance,
                :targets,
                :shapeable,
                :source,
                :effect,
                :description)");


    if($_POST['force'] != ''){
        $force = $_POST['force'];
    } else {
        $force = NULL;
    }

    if($_POST['casting_time2'] != ''){
        $casting_time = $_POST['casting_time2'];
    } elseif ($_POST['casting_time'] == 0) {
        $casting_time = NULL;
    } else {
        $casting_time = $_POST['casting_time'];
    }

    if($_POST['spell_range_text'] != ''){
        $spell_range = $_POST['spell_range_text'];
    } elseif ($_POST['spell_range'] == 0) {
        $spell_range = NULL;
    } else {
        $spell_range = $_POST['spell_range'];
    }

    if($_POST['duration_text'] != ''){
        $duration = $_POST['duration_text'];
    } elseif ($_POST['duration'] == 0) {
        $duration = NULL;
    } else {
        $duration = $_POST['duration'];
    }

    if($_POST['saving_throw_text'] != ''){
        $saving_throw = $_POST['saving_throw_text'];
    } elseif ($_POST['saving_throw'] == 0) {
        $saving_throw = NULL;
    } else {
        $saving_throw = $_POST['saving_throw'];
    }

    if($_POST['spell_resistance_text'] != ''){
        $spell_resistance = $_POST['spell_resistance_text'];
    } elseif ($_POST['spell_resistance'] == 0) {
        $spell_resistance = NULL;
    } else {
        $spell_resistance = $_POST['spell_resistance'];
    }

    $description = nl2br($_POST['description']);

    if($_POST['effect'] == ''){
        $effect = NULL;
    } else {
        $effect = $_POST['effect'];
    }

    if($_POST['targets'] == ''){
        $targets = NULL;
    } else {
        $targets = $_POST['targets'];
    }

    if($_POST['component_text'] == ''){
        $component_text = NULL;
    } else {
        $component_text = $_POST['component_text'];
    }

    if($_POST['subschool'] == 0){ $subschool = NULL; }  else { $subschool = $_POST['subschool']; }
    if($_POST['school'] == 0){ $school = NULL; }  else { $school = $_POST['school']; }
    if($_POST['alchemist_level'] == 0){ $alchemist_level = NULL; } else { $alchemist_level = $_POST['alchemist_level']; }
    if($_POST['antipaladin_level'] == 0){ $antipaladin_level = NULL; } else { $antipaladin_level = $_POST['antipaladin_level']; }
    if($_POST['bard_level'] == 0){ $bard_level = NULL; } else { $bard_level = $_POST['bard_level']; }
    if($_POST['cleric_level'] == 0){ $cleric_level = NULL; } else { $cleric_level = $_POST['cleric_level']; }
    if($_POST['druid_level'] == 0){ $druid_level = NULL; } else { $druid_level = $_POST['druid_level']; }
    if($_POST['inquisitor_level'] == 0){ $inquisitor_level = NULL; } else { $inquisitor_level = $_POST['inquisitor_level']; }
    if($_POST['magus_level'] == 0){ $magus_level = NULL; } else { $magus_level = $_POST['magus_level']; }
    if($_POST['paladin_level'] == 0){ $paladin_level = NULL; } else { $paladin_level = $_POST['paladin_level']; }
    if($_POST['ranger_level'] == 0){ $ranger_level = NULL; } else { $ranger_level = $_POST['ranger_level']; }
    if($_POST['summoner_level'] == 0){ $summoner_level = NULL; } else { $summoner_level = $_POST['summoner_level']; }
    if($_POST['witch_level'] == 0){ $witch_level = NULL; } else { $witch_level = $_POST['witch_level']; }
    if($_POST['wizard_level'] == 0){ $wizard_level = NULL; } else { $wizard_level = $_POST['wizard_level']; }


    $stmt->bindParam(':spell_name',$_POST['spell_name']);
    $stmt->bindParam(':school',$_POST['school']);
    $stmt->bindParam(':force',$force);
    $stmt->bindParam(':subschool',$subschool);
    $stmt->bindParam(':alchemist_level',$alchemist_level);
    $stmt->bindParam(':antipaladin_level',$antipaladin_level);
    $stmt->bindParam(':bard_level',$bard_level);
    $stmt->bindParam(':cleric_level',$cleric_level);
    $stmt->bindParam(':druid_level',$druid_level);
    $stmt->bindParam(':inquisitor_level',$inquisitor_level);
    $stmt->bindParam(':magus_level',$magus_level);
    $stmt->bindParam(':paladin_level',$paladin_level);
    $stmt->bindParam(':ranger_level',$ranger_level);
    $stmt->bindParam(':summoner_level',$summoner_level);
    $stmt->bindParam(':witch_level',$witch_level);
    $stmt->bindParam(':wizard_level',$wizard_level);
    $stmt->bindParam(':casting_time',$casting_time);
    $stmt->bindParam(':verbal',$_POST['verbal']);
    $stmt->bindParam(':somatic',$_POST['somatic']);
    $stmt->bindParam(':material',$_POST['material']);
    $stmt->bindParam(':focus',$_POST['focus']);
    $stmt->bindParam(':divine_focus',$_POST['divine_focus']);
    $stmt->bindParam(':component_text',$component_text);
    $stmt->bindParam(':spell_range',$spell_range);
    $stmt->bindParam(':duration',$duration);
    $stmt->bindParam(':dismiss',$_POST['dismiss']);
    $stmt->bindParam(':saving_throw',$saving_throw);
    $stmt->bindParam(':spell_resistance',$spell_resistance);
    $stmt->bindParam(':targets',$targets);
    $stmt->bindParam(':shapeable',$_POST['shapeable']);
    $stmt->bindParam(':source',$source);
    $stmt->bindParam(':effect',$effect);
    $stmt->bindParam(':description',$description);

    //execute our MySQL query
    if(!$stmt->execute()){
        $error_msg = serialize($stmt->errorInfo())."<br />";
    }else{
        $success = $_POST['spell_name']." successfully added!<br />";
    }


}

$query = "SELECT * FROM schools ORDER BY school_name";
$stmt=$dbh->prepare($query);
$stmt->execute();

$schools = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $temp = array("id" => $row["id"],
        "school_name" => $row['school_name']);
    array_push($schools, $temp);
}

/*  casting time  */

$query = "SELECT * FROM spells WHERE casting_time IS NOT NULL GROUP BY casting_time";
$stmt=$dbh->prepare($query);
$stmt->execute();

$casting_time = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($casting_time, $row['casting_time']);
}

/*  range  */

$query = "SELECT * FROM spells WHERE spell_range IS NOT NULL GROUP BY spell_range";
$stmt=$dbh->prepare($query);
$stmt->execute();

$srange = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($srange, $row['spell_range']);
}

/*  duration  */

$query = "SELECT * FROM spells WHERE duration IS NOT NULL GROUP BY duration";
$stmt=$dbh->prepare($query);
$stmt->execute();

$duration = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($duration, $row['duration']);
}

/*  saving throw  */

$query = "SELECT * FROM spells WHERE saving_throw IS NOT NULL GROUP BY saving_throw";
$stmt=$dbh->prepare($query);
$stmt->execute();

$saving_throw = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($saving_throw, $row['saving_throw']);
}

/*  spell resistance  */

$query = "SELECT * FROM spells WHERE spell_resistance IS NOT NULL GROUP BY spell_resistance";
$stmt=$dbh->prepare($query);
$stmt->execute();

$resistance = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    array_push($resistance, $row['spell_resistance']);
}

/*  sources  */

$query = "SELECT * FROM sources ORDER BY id = 1 desc, source_name";
$stmt=$dbh->prepare($query);
$stmt->execute();

$sources = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $temp = array("id" => $row["id"],
        "source_name" => $row['source_name']);
    array_push($sources, $temp);
}


require_once('header.php');
?>
<form action='add_spells.php' method='POST' class='spells'>
    <span style='color:#a88;'><?php echo($error_msg); ?></span>
    <span style='color:#8a8;'><?php echo($success); ?></span>

    <input type='text' name='spell_name' placeholder='Spell Name' /><br />
    <select name='school'>
        <option value='0'>School</option>
    <?php
        foreach($schools as $value){
            echo("<option value='".$value['id']."'>".$value['school_name']."</option>
            ");
        }
    ?>
    </select><br />
    <select name='subschool'>
        <option value="0">Sub School</option>
        <?php
            foreach($schools as $value){
                echo("<option value='".$value['id']."'>".$value['school_name']."</option>
                ");
            }
        ?>
    </select><br />
    <input type='text' name='force' placeholder='[type]' /><br />
    <label>Alchemist Level: </label><input type='number' name='alchemist_level' />
    <label>Antipaladin Level: </label><input type='number' name='antipaladin_level' />
    <label>Bard Level: </label><input type='number' name='bard_level' />
    <label>Cleric Level: </label><input type='number' name='cleric_level' /><br />
    <label>Druid Level: </label><input type='number' name='druid_level' />
    <label>Inquisitor Level: </label><input type='number' name='inquisitor_level' />
    <label>Magus Level: </label><input type='number' name='magus_level' />
    <label>Paladin Level: </label><input type='number' name='paladin_level' /><br />
    <label>Ranger Level: </label><input type='number' name='ranger_level' />
    <label>Summoner Level: </label><input type='number' name='summoner_level' />
    <label>Witch Level: </label><input type='number' name='witch_level' />
    <label>Wizard Level: </label><input type='number' name='wizard_level' /><br />
    <select name='casting_time'>
    <option value='0'>Casting Time</option>
    <?php
        foreach($casting_time as $value){
            echo("<option value='$value'>$value</option>
            ");
        }
    ?>
    </select>
    <input type='text' name='casting_time2' placeholder='Casting Time' /><br />
    <input type="checkbox" name="verbal" value="1"> Verbal
    <input type="checkbox" name="somatic" value="1"> Somatic
    <input type="checkbox" name="material" value="1"> Material
    <input type="checkbox" name="focus" value="1"> Focus
    <input type="checkbox" name="divine_focus" value="1"> Divine Focus<br />
    <input type='text' name='component_text' placeholder='Component Text' /><br />
    <select name='spell_range'>
        <option value='0'>Range</option>
    <?php
        foreach($srange as $value){
            echo("<option value='$value'>$value</option>
            ");
        }
    ?>
    </select>
    <input type='text' name='spell_range_text' placeholder='Range Text' /><br />
    <input type='text' name='targets' placeholder='Targets' /><input type="checkbox" name="shapeable" value="1"> Shapeable<br />
    <select name='duration'>
        <option value='0'>Duration</option>
    <?php
        foreach($duration as $value){
            echo("<option value='$value'>$value</option>
            ");
        }
    ?>
    </select>
    <input type='text' name='duration_text' placeholder='Duration Text' /><br />
    <input type="checkbox" name="dismiss" value="1"> Dismissable<br />
    <select name='saving_throw'>
        <option value='0'>Saving Throw</option>
    <?php
        foreach($saving_throw as $value){
            echo("<option value='$value'>$value</option>
            ");
        }
    ?>
    </select>
    <input type='text' name='saving_throw_text' placeholder='Saving Throw' /><br />
    <select name='spell_resistance'>
        <option value='0'>Spell Resistance</option>
    <?php
        foreach($resistance as $value){
            echo("<option value='$value'>$value</option>
            ");
        }
    ?>
    </select>
    <input type='text' name='spell_resistance_text' placeholder='Spell Resistance' /><br />
    <select name='source'>
        <option value='0'>Source</option>
    <?php
        foreach($sources as $value){
            echo("<option value='".$value['id']."'>".$value['source_name']."</option>
            ");
        }
    ?>
    </select><input type='text' name='source_text' placeholder='New Source' /><br />
    <input type='text' name='effect' placeholder='Effect' /><br />
    <textarea name='description' placeholder='Description'></textarea><br />
    <input type='submit' value='Submit' />
</form>

<?php
require_once('footer.php');
?>


