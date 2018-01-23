<form class='character'>
    <input type='text' name='name' placeholder='Character Name' class='character_details' data-ng-model="char_name" />
    <select class='character_details'
        data-ng-change="calc_spells_per_day(char_class, char_level, char_ability_score, true)"
        data-ng-model="char_class"
        data-ng-init="char_class = options[0].value"
        data-ng-options="class.class_name for class in classes">
            <option style="display:none;" value="">Select Class</option>
    </select>
    <select class='character_details' data-ng-model="char_level"
        data-ng-change="calc_spells_per_day(char_class, char_level, char_ability_score)">
        <option style="display:none;" value="">Select Level</option>
        <?php
        $a = '';
        for($x=1; $x < 21 ; $x++){
        if($x == 20) $a = "+";
            echo"<option value='".$x."'>Level ".$x.$a."</option>";
        }
        ?>
    </select><br />
    <h1>
        <span data-ng-bind="char_name">{{ char_name }}</span>
        <span data-ng-show="char_name !=''">-</span>
        <span data-ng-show="char_level !=''"> Level {{ char_level }}: </span>
        <span>{{ char_class.class_name }}</span>
    </h1>
    <h2>
        <span data-ng-show="char_class.ability_modifier != null">{{char_class.ability_modifier}}:
        <input type='text' name='ability_mod' placeholder='Value' class='character_details' data-ng-model="char_ability_score"
         data-ng-change="calc_spells_per_day(char_class, char_level, char_ability_score)"
         style='width:50px;'/>
        </span>
        <span data-ng-show="show_ability_mod(ability_mod) == true">Modifier:
        <span data-ng-show="ability_mod > 0">+</span>{{ability_mod}}
    </h2>
    <h2>
        <span data-ng-show="char_class.spell_type != null">Spell Type: {{char_class.spell_type}}</span>
    </h2>
    <table class='spell'>
        <tr>
            <th>Level</th>
            <?php
            for($x=0; $x < 10 ; $x++){
                echo"<th>".$x."</th>";
            }
            ?>
        </tr>
        <tr data-ng-show='char_class.id == 2 || char_class.id == 10 || char_class.id == 11 || char_class.id == 13'>
            <td>Spells Known</td>
            <?php
            for($x=0; $x < 10; $x++){
                $str = $x."_spells";
                echo("<td>{{ spells_known[0]['$str']}}</td>");
            }
            ?>
        </tr>
        <tr  data-ng-show='char_class.id == 2 || char_class.id == 10 || char_class.id == 11 || char_class.id == 13'>
            <td>Spells Per Day</td>
            <?php
            for($x=0; $x < 10; $x++){
                $str = $x."_spells";
                echo("<td>{{ addition(spells_per_day[0]['$str'], ability_mod_bonus[0]['$str']) }}</td>");
            }
            ?>
        </tr>
        <tr data-ng-show='char_class.id != 2 && char_class.id != 10 && char_class.id != 11 && char_class.id != 13'>
            <td>Spells Per Day</td>
            <?php
            for($x=0; $x < 10; $x++){
                $str = $x."_spells";
                echo("<td>{{spells_per_day[0]['$str']}}</td>");
            }
            ?>
        </tr>
        <tr>
            <td>Spells Save DC</td>
            <?php
            for($x=0; $x < 10; $x++){
                $str = $x."_spells";
                echo("<td><span data-ng-show=\"show_ability_mod(spell_dc['$str']) == true\">{{spell_dc['$str']}}</span></td>
                ");
            }
            ?>
        </tr>
    </table>
    <div id="spell_list">
    <?php
        for($x=0; $x < 10; $x++){
        $str = $x."_spells";
        echo('
            <fieldset data-ng-show="addition(spells_known[0][\''.$str.'\'], ability_mod_bonus[0][\''.$str.'\']) != \'\'
            && addition(spells_known[0][\''.$str.'\'], ability_mod_bonus[0][\''.$str.'\']) != \'-\'"><legend>Select '.$x.' Level Spells</legend>
                <div class="repeat"
                ng-repeat="i in getNumber(addition(spells_known[0][\''.$str.'\'], ability_mod_bonus[0][\''.$str.'\'])) track by $index"
                data-ng-show="addition(spells_known[0][\''.$str.'\'], ability_mod_bonus[0][\''.$str.'\']) != \'\'
                && addition(spells_known[0][\''.$str.'\'], ability_mod_bonus[0][\''.$str.'\']) != \'-\'">
                    <select class="spell_list spell_list'.$x.'"
                        data-ng-model="spell'.$x.'"
                        data-ng-init="spell'.$x.' = options[0].value"
                        data-ng-options="spell.spell_name for spell in spells['.$x.']">
                            <option style="display:none;" value="">Select Spell</option>
                    </select><br />
                    <p class="spell_description" data-ng-show="spell'.$x.'.spell_name != null">
                        <span><em>{{ spell'.$x.'.spell_name }}</em></span>
                        <span data-ng-show="spell'.$x.'.school != null"><em>School: </em>{{ spell'.$x.'.school }}
                            <span data-ng-show="spell'.$x.'.force != null"> [force]</span>
                        </span>
                        <span data-ng-show="spell'.$x.'.subschool != null"><em>Sub-school: </em>{{ spell'.$x.'.subschool }}</span>
                        <span>
                            <span data-ng-show="spell'.$x.'.alchemist_level != null" class="caster_level">
                                <em>Alchemist Level: </em>{{ spell'.$x.'.alchemist_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.antipaladin_level != null" class="caster_level">
                                <em>Antipaladin Level: </em>{{ spell'.$x.'.antipaladin_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.bard_level != null" class="caster_level">
                                <em>Bard Level: </em>{{ spell'.$x.'.bard_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.cleric_level != null" class="caster_level">
                                <em>Cleric/Oracle Level: </em>{{ spell'.$x.'.cleric_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.druid_level != null" class="caster_level">
                                <em>Druid Level: </em>{{ spell'.$x.'.druid_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.inquisitor_level != null" class="caster_level">
                                <em>Inquisitor Level: </em>{{ spell'.$x.'.inquisitor_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.magus_level != null" class="caster_level">
                                <em>Magus Level: </em>{{ spell'.$x.'.magus_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.paladin_level != null" class="caster_level">
                                <em>Paladin Level: </em>{{ spell'.$x.'.paladin_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.ranger_level != null" class="caster_level">
                                <em>Ranger Level: </em>{{ spell'.$x.'.ranger_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.summoner_level != null" class="caster_level">
                                <em>Summoner Level: </em>{{ spell'.$x.'.summoner_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.witch_level != null" class="caster_level">
                                <em>Witch Level: </em>{{ spell'.$x.'.witch_level }}
                            </span>
                            <span data-ng-show="spell'.$x.'.wizard_level != null" class="caster_level">
                                <em>Wizard/Sorcerer Level: </em>{{ spell'.$x.'.wizard_level }}
                            </span>
                        </span>
                        <span data-ng-show="spell'.$x.'.casting_time != null"><em>Casting Time: </em>{{ spell'.$x.'.casting_time }}</span>
                        <span><em>Components: </em>
                            <span data-ng-show="spell'.$x.'.verbal != null">V</span>
                            <span data-ng-show="spell'.$x.'.somatic != null">S</span>
                            <span data-ng-show="spell'.$x.'.material != null">M</span>
                            <span data-ng-show="spell'.$x.'.focus != null">F</span>
                            <span data-ng-show="spell'.$x.'.divine_focus != null">DF</span>
                            <span data-ng-show="spell'.$x.'.component_text != null">({{ spell'.$x.'.component_text }})</span>
                        </span>
                        <span data-ng-show="spell'.$x.'.spell_range != null"><em>Range: </em>{{ spell'.$x.'.spell_range }}</span>
                        <span data-ng-show="spell'.$x.'.effect != null">Effect: {{ spell'.$x.'.effect }}</span>
                        <span data-ng-show="spell'.$x.'.duration != null"><em>Duration: </em>{{ spell'.$x.'.duration}}
                            <span data-ng-show="spell'.$x.'.dismiss != null"> (D)</span>
                        </span>
                        <span data-ng-show="spell'.$x.'.saving_throw != null"><em>Saving Throw: </em>{{ spell'.$x.'.saving_throw }}</span>
                        <span data-ng-show="spell'.$x.'.spell_resistance != null"><em>Spell Resistance: </em>{{ spell'.$x.'.spell_resistance }}</span>
                        <span data-ng-show="spell'.$x.'.targets != null"><em>Targets: </em>{{ spell'.$x.'.targets }}
                            <span data-ng-show="spell'.$x.'.shapeable != null"> (S)</span>
                        </span>
                        <span data-ng-show="spell'.$x.'.source != null"><em>Source: </em>{{ spell'.$x.'.source }}</span>
                        <span data-ng-bind-html="spell_html_display(spell'.$x.'.description)"></span>
                    </p>
                </div>
            </fieldset>
            ');
        }
    ?>
    </div>
</form>