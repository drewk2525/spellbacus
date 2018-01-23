# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.33)
# Database: pathfinder
# Generation Time: 2015-01-30 04:45:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ability_modifiers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ability_modifiers`;

CREATE TABLE `ability_modifiers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ability_modifier_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ability_modifiers` WRITE;
/*!40000 ALTER TABLE `ability_modifiers` DISABLE KEYS */;

INSERT INTO `ability_modifiers` (`id`, `ability_modifier_name`)
VALUES
	(1,'Intelligence'),
	(2,'Charisma'),
	(3,'Wisdom');

/*!40000 ALTER TABLE `ability_modifiers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table characters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `characters`;

CREATE TABLE `characters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `level` smallint(2) DEFAULT NULL,
  `class` int(11) unsigned DEFAULT NULL,
  `spell 1` int(11) unsigned DEFAULT NULL,
  `spell 2` int(11) unsigned DEFAULT NULL,
  `spell 3` int(11) unsigned DEFAULT NULL,
  `spell 4` int(11) unsigned DEFAULT NULL,
  `spell 5` int(11) unsigned DEFAULT NULL,
  `spell 6` int(11) unsigned DEFAULT NULL,
  `spell 7` int(11) unsigned DEFAULT NULL,
  `spell 8` int(11) unsigned DEFAULT NULL,
  `spell 9` int(11) unsigned DEFAULT NULL,
  `spell 10` int(11) unsigned DEFAULT NULL,
  `spell 11` int(11) unsigned DEFAULT NULL,
  `spell 12` int(11) unsigned DEFAULT NULL,
  `spell 13` int(11) unsigned DEFAULT NULL,
  `spell 14` int(11) unsigned DEFAULT NULL,
  `spell 15` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `class` (`class`),
  KEY `spell 1` (`spell 1`),
  KEY `spell 2` (`spell 2`),
  KEY `spell 3` (`spell 3`),
  KEY `spell 4` (`spell 4`),
  KEY `spell 5` (`spell 5`),
  KEY `spell 6` (`spell 6`),
  KEY `spell 7` (`spell 7`),
  KEY `spell 8` (`spell 8`),
  KEY `spell 9` (`spell 9`),
  KEY `spell 10` (`spell 10`),
  KEY `spell 11` (`spell 11`),
  KEY `spell 12` (`spell 12`),
  KEY `spell 13` (`spell 13`),
  KEY `spell 14` (`spell 14`),
  KEY `spell 15` (`spell 15`),
  CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  CONSTRAINT `characters_ibfk_10` FOREIGN KEY (`spell 8`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_11` FOREIGN KEY (`spell 9`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_12` FOREIGN KEY (`spell 10`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_13` FOREIGN KEY (`spell 11`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_14` FOREIGN KEY (`spell 12`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_15` FOREIGN KEY (`spell 13`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_16` FOREIGN KEY (`spell 14`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_17` FOREIGN KEY (`spell 15`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`class`) REFERENCES `classes` (`id`),
  CONSTRAINT `characters_ibfk_3` FOREIGN KEY (`spell 1`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_4` FOREIGN KEY (`spell 2`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_5` FOREIGN KEY (`spell 3`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_6` FOREIGN KEY (`spell 4`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_7` FOREIGN KEY (`spell 5`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_8` FOREIGN KEY (`spell 6`) REFERENCES `spells` (`id`),
  CONSTRAINT `characters_ibfk_9` FOREIGN KEY (`spell 7`) REFERENCES `spells` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;

INSERT INTO `characters` (`id`, `user`, `name`, `level`, `class`, `spell 1`, `spell 2`, `spell 3`, `spell 4`, `spell 5`, `spell 6`, `spell 7`, `spell 8`, `spell 9`, `spell 10`, `spell 11`, `spell 12`, `spell 13`, `spell 14`, `spell 15`)
VALUES
	(2,2,'Harry Potter',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(64) DEFAULT NULL,
  `spell_type` int(11) unsigned DEFAULT NULL,
  `ability_modifier` int(11) unsigned DEFAULT NULL,
  `spells_per_day` int(11) DEFAULT NULL,
  `spells_known` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spell_type` (`spell_type`),
  KEY `ability_modifier` (`ability_modifier`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`spell_type`) REFERENCES `spell_types` (`id`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ability_modifier`) REFERENCES `ability_modifiers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;

INSERT INTO `classes` (`id`, `class_name`, `spell_type`, `ability_modifier`, `spells_per_day`, `spells_known`)
VALUES
	(1,'Wizard',1,1,4,4),
	(2,'Bard',1,2,1,2),
	(3,'Cleric',2,3,4,4),
	(4,'Druid',2,3,4,4),
	(5,'Ranger',2,3,3,3);

/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schools`;

CREATE TABLE `schools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `school_name` varchar(64) DEFAULT NULL,
  `source` int(11) unsigned DEFAULT NULL,
  `associated_school` int(11) unsigned DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `source` (`source`),
  KEY `associated_school` (`associated_school`),
  CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`source`) REFERENCES `sources` (`id`),
  CONSTRAINT `schools_ibfk_2` FOREIGN KEY (`associated_school`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;

INSERT INTO `schools` (`id`, `school_name`, `source`, `associated_school`, `description`)
VALUES
	(1,'N/A',NULL,1,'N/A'),
	(2,'Necromancy',1,1,'The dread and feared necromancer commands undead and uses the foul power of unlife against his enemies.\n\nPower over Undead (Su): You receive Command Undead or Turn Undead as a bonus feat.  You can use channel energy a number of time per day equal to 3+ your Intelligence modifier, but only to use the selected feat.  you can take other feats to add to this ability, such as Extra Channel and Improved Channel, but not feats that alter this ability, such as Elemental Channel and Alignment Channel.  The DC to save against these feats is equal to 10 + 1/2 your wizard level + your Charisma modifier.  At 20th level, undead cannot add their channel resistance to the save against this ability.\n\nGrave Touch (Sp): As a standard action, you can make a melee touch attack that causes a living creature to become shaken for a number of rounds equal to 1/2 your wizard level (minimum 1).  If you touch a shaken creature with this ability, it becomes frightened for 1 round if it has fewer Hit Dice than your wizard level.  You can use this ability a number of times per day equal to 3+ your Intelligence modifier.\n\nLife Sight (Su):  At 8th level, you gain blindsight to a range of 10 feet for a number of rounds per day equal to your wizard level.  This ability only allows you to detect living creaturs and undead creatures.  This sight also tells you whether a creature is living or undead.  Constructs and other creatures taht are neither living nor undead cannot be seen with this ability.  The range of this ability increases by 10 feet at 12th level, and by an additional 10 feet for every four levels beyond 12th.  These rounds do not need to be consecutive.'),
	(3,'Undead',2,2,'Replacement Power: The following school power replaces the grace touch power of the necromancy school.\n\nBolster (Sp): As a standard action, you can touch an undead creature and infuse it with negative energy.  It gains a +1 profane bonus on all attack rolls and saving throws, as well as 1 temporary hit point per Hit Die and a +2 bonus to its turn resistance.  The bonus on attack rolls and saving throws incresases by +1 for every 5 wizard levels you possess.  These bonuses last for a number of rounds equal to 1/2 your wizard level (minimum 1 round).  The bonuses and temporary hit points are immediately dispelled if the creature is within the area of aconsecratespell.  You can use this ability a number of times per day equal to 3+ your Intelligence modifier.'),
	(5,'Divination',1,1,'Diviners are masters of remote viewing, prophecies, and using magic to explore the world.\n\nForewarned (Su): You can always act in the surprise round even if you fail to make a Perception roll to notice a foe, but you are still considered flat-footed until you take an action.  In addition, you receive a bonus on initiative checks equal to 1/2 your wizard level (minimum +1).  At 20th level, anytime you roll initiative, assume the roll resulted in a natural 20.\n\nDivinver\'s Fortune (Sp):  When you activate this school power, you can touch any creature as a standard action to give it an insight bonus on all of its attack rolls, skill checks, ability checks, and saving throws equal to 1/2 your wizard level (minimum +1) for 1 round.  You can use this ability a number of times per day equal to 3+ your Intelligence modifier.\n\nScrying Adept (Su):  At 8th level, you are always aware when you are being observed via magic, as if you had a permanent detect scrying.  In addition, whenever you scry on a subject, treat the subject as one step more familiar to you.  Very familiar subjects get a -10 penalty on their save to avoid your scrying attempts.'),
	(6,'Conjutation',1,1,'The conjurer focuses on the study of summoning monsters and magic alike to bend to his will.\nSummoner\'s Charm (Su)\n\nSummoner\'s Charm (Su):  Whenever you cast a conjuration (summoning) spell, increase the duration by a number of rounds equal to 1/2 your wizard level (minimum 1). This increase is not doubled by Extend Spell. At 20th level, you can change the duration of all summon monster spells to permanent. You can have no more than one summon monster spell made permanent in this way at one time. If you designate another summon monster spell as permanent, the previous spell immediately ends.\nAcid Dart (Sp)\n\nAcid Dart (Sp):  As a standard action you can unleash an acid dart targeting any foe within 30 feet as a ranged touch attack. The acid dart deals 1d6 points of acid damage + 1 for every two wizard levels you possess. You can use this ability a number of times per day equal to 3 + your Intelligence modifier. This attack ignores spell resistance.\nDimensional Steps (Sp)\n\nDimensional Steps (Sp):  At 8th level, you can use this ability to teleport up to 30 feet per wizard level per day as a standard action. This teleportation must be used in 5-foot increments and such movement does not provoke an attack of opportunity. You can bring other willing creatures with you, but you must expend an equal amount of distance for each additional creature brought with you.'),
	(7,'Abjuration',1,1,'The abjurer uses magic against itself, and masters the art of defensive and warding magics.\nResistance (Ex)\n\nResistance (Ex):  You gain resistance 5 to an energy type of your choice, chosen when you prepare spells. This resistance can be changed each day. At 11th level, this resistance increases to 10. At 20th level, this resistance changes to immunity to the chosen energy type.\nProtective Ward (Su)\n\nProtective Ward (Su):  As a standard action, you can create a 10-foot-radius field of protective magic centered on you that lasts for a number of rounds equal to your Intelligence modifier. All allies in this area (including you) receive a +1 deflection bonus to their Armor Class. This bonus increases by +1 for every five wizard levels you possess. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nEnergy Absorption (Su)\n\nEnergy Absorption (Su):  At 6th level, you gain an amount of energy absorption equal to 3 times your wizard level per day. Whenever you take energy damage, apply immunity, vulnerability (if any), and resistance first and apply the rest to this absorption, reducing your daily total by that amount. Any damage in excess of your absorption is applied to you normally.'),
	(8,'Banishment',2,7,'Replacement Powers: The following school powers replace the energy absorption power and the protective ward power of the abjuration school.\n\nUnstable Bonds (Su): At 1st level, your touch can disrupt the bonds that hold a summoned or called creature on this plane. As a melee touch attack, you can cause a summoned or called creature to become shaken and staggered for a number of rounds equal to 1/2 your wizard level (minimum 1). You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nAura of Banishment (Su): At 8th level, you can emit a 30-foot aura of banishment for a number of rounds per day equal to your wizard level. Any summoned or called creature in the area must make a Will save each round. Once the creature fails a Will saving throw, it is staggered as long as it remains inside the aura. If it fails a second Will saving throw, it is immediately sent back to its home plane and the spell that summoned it immediately ends. If that spell summoned more than one creature, only the creature that failed its saving throws is affected. These rounds do not need to be consecutive.'),
	(9,'Counterspell',2,7,'Replacement Powers: The following school powers replace the protective ward power and the energy absorption power of the abjuration school.\n\nDisruption (Su): At 1st level, you gain the ability to disrupt spellcasting with a touch. As a melee touch attack, you can place a disruptive field around the target. While the field is in place, the target must make a concentration check to cast any spell or to use a spell-like ability in addition to any other required concentration checks. The DC of this check is equal to 15 + twice the spell?s level. If the check is failed, the target?s spell is wasted. This field lasts for a number of rounds equal to 1/2 your wizard level (minimum 1). You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nCounterspell Mastery (Su): At 6th level, you gain Improved Counterspell as a bonus feat. You may attempt to counterspell an opponent?s spell once per day as an immediate action (instead of a readied action). You must use a spell at least one level higher than the spell being countered to use this ability. You can use this ability once per day at 6th level, plus one additional time per day for every 4 levels beyond 6th.'),
	(10,'Creation',2,6,'Replacement Powers: The following school powers replace the acid dart power and the dimensional steps power of the conjuration school.\n\nCreate Gear (Su): At 1st level, you can create any object that weighs no more than 1 pound per wizard level you possess. Creating an object in this way is a standard action. The Item remains for 1 minute before fading away, although it disappears after one round if it leaves your possession. Creating an Item to an exact specification might require a Craft skill check, subject to GM discretion. The object must be made of simple materials, such as wood, stone, glass, or metal, and cannot contain any moving parts. You could use this ability to create a dagger, but not a vial of alchemist?s fire. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nCreator?s Will (Sp): At 8th level, you can cast minor creation as a spell-like ability. You can have no more than one minor creation active at a time. If you cast the spell again, the previous casting immediately ends. At 12th level, this ability improves to major creation. You can use this ability a number of times per day equal to 1/2 your wizard level.'),
	(11,'Teleportation',2,6,'Replacement Power: The following school power replaces the acid dart power of the conjuration school.\n\nShift (Su): At 1st level, you can teleport to a nearby space as a swift action as if using dimension door. This movement does not provoke an attack of opportunity. You must be able to see the space that you are moving into. You cannot take other creatures with you when you use this ability (except for familiars). You can move 5 feet for every two wizard levels you possess (minimum 5 feet). You can use this ability a number of times per day equal to 3 + your Intelligence modifier.'),
	(12,'Foresight',2,5,'Replacement Powers: The following school powers replace the diviner?s fortune and scrying adept powers of the divination school.\n\nPrescience (Su): At the beginning of your turn, you may, as a free action, roll a single d20. At any point before your next turn, you may use the result of this roll as the result of any d20 roll you are required to make. If you do not use the d20 result before your next turn, it is lost. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nForetell (Su): At 8th level, you can utter a prediction of the immediate future. While your foretelling is in effect, you emit a 30-foot aura of fortune that aids your allies or hinders your enemies, as chosen by you at the time of prediction. If you choose to aid, you and your allies gain a +2 luck bonus on ability checks, attack rolls, caster level checks, saving throws, and skill checks. If you choose to hinder, your enemies take a ?2 penalty on those rolls instead. You can use this ability for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive.'),
	(13,'Scryer',2,5,'Replacement Power: The following school power replaces the diviner?s fortune power of the divination school.\n\nSend Senses (Sp): As a standard action, you place a scrying sensor at a point within medium range (100 feet + 10 feet/wizard level) that you can see and have line of effect to. You can see or hear (not both) through this sensor for number of rounds equal to 1/2 your wizard level (minimum 1). The sensor otherwise functions as a clairaudience/clairvoyance spell with a caster level equal to your wizard level.\n\nYou can use this ability a number of times per day equal to 3 + your Intelligence modifier.'),
	(14,'Enchantment',2,1,'The enchanter uses magic to control and manipulate the minds of his victims.\nEnchanting Smile (Su)\n\nEnchanting Smile (Su):  You gain a +2 enhancement bonus on Bluff, Diplomacy, and Intimidate skill checks. This bonus increases by +1 for every five wizard levels you possess, up to a maximum of +6 at 20th level. At 20th level, whenever you succeed at a saving throw against a spell of the enchantment school, that spell is reflected back at its caster, as per spell turning.\nDazing Touch (Sp)\n\nDazing Touch (Sp): You can cause a living creature to become dazed for 1 round as a melee touch attack. Creatures with more Hit Dice than your wizard level are unaffected. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nAura of Despair (Su)\n\nAura of Despair (Su): At 8th level, you can emit a 30-foot aura of despair for a number of rounds per day equal to your wizard level. Enemies within this aura take a ?2 penalty on ability checks, attack rolls, damage rolls, saving throws, and skill checks. These rounds do not need to be consecutive. This is a mind-affecting effect.'),
	(15,'Controller',2,14,'Replacement Powers: The following school powers replace the enchanting smile and aura of despair powers of the enchantment school.\n\nForce of Will (Su): You can send thoughts and instructions telepathically to any creature within 60 feet that you have charmed or dominated as though you shared a common language. At 11th level, affected creatures can communicate back to you via the telepathic link as well. At 20th level, any creature that succeeds at a saving throw against an enchantment spell you have just cast is still affected for 1 round if the spell has a duration greater than 1 round.\n\nIrresistible Demand (Sp): At 8th level, you can force others to do your bidding. As a standard action, you attempt to dominate a creature as though using the dominate monster spell, except that the creature must have a number of Hit Dice equal to or less than your wizard level. The targeted creature receives a Will saving throw each round to negate the effect. The DC is equal to 10 + 1/2 your wizard level + your Intelligence modifier. You can dominate creatures for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive. You must concentrate as a standard action to maintain control over a dominated creature.'),
	(16,'Manipulator',2,14,'Replacement Powers: The following school powers replace the dazing touch and aura of despair powers of the enchantment school.\n\nBeguiling Touch (Sp): You can charm a living creature by touching it. Creatures with more Hit Dice than your wizard level are unaffected, as are creatures in combat and those with an attitude of hostile toward you. Creatures receive a Will saving throw to negate the effect. The DC of this save is equal to 10 + 1/2 your wizard level + your Intelligence modifier. Creatures that fail their save are affected by charm monster for a number of rounds equal to 1/2 your wizard level (minimum 1). This is a mind-affecting effect. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nShape Emotions (Su): At 8th level, you can emit a 30-foot aura to either ward off or welcome emotional influence for a number of rounds per day equal to your wizard level. If you choose to ward, you and your allies within this aura receive a +4 morale bonus on saves against mind-affecting spells and effects, and any fear effects targeting you or your allies are reduced by one step (shaken has no effect, frightened becomes shaken, and panicked becomes frightened). If you chose to enhance emotional influence, enemies within the aura receive a ?2 penalty on saves against mind-affecting spells and effects. These rounds do not need to be consecutive.'),
	(17,'Evocation',1,1,'Evokers revel in the raw power of magic, and can use it to create and destroy with shocking ease.\nIntense Spells (Su)\n\nIntense Spells (Su):  Whenever you cast an evocation spell that deals hit point damage, add 1/2 your wizard level to the damage (minimum +1). This bonus only applies once to a spell, not once per missile or ray, and cannot be split between multiple missiles or rays. This bonus damage is not increased by Empower Spell or similar effects. This damage is of the same type as the spell. At 20th level, whenever you cast an evocation spell you can roll twice to penetrate a creature\'s spell resistance and take the better result.\nForce Missile (Sp)\n\nForce Missile (Sp): As a standard action you can unleash a force missile that automatically strikes a foe, as magic missile. The force missile deals 1d4 points of damage plus the damage from your intense spells evocation power. This is a force effect. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nElemental Wall (Sp)\n\nElemental Wall (Sp): At 8th level, you can create a wall of energy that lasts for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive. This wall deals acid, cold, electricity, or fire damage, determined when you create it. The elemental wall otherwise functions like wall of fire.'),
	(18,'Admixture',2,17,'Replacement Powers: The following school powers replace the force missile and elemental wall powers of the evocation school.\n\nVersatile Evocation (Su): When you cast an evocation spell that does acid, cold, electricity, or fire damage, you may change the damage dealt to one of the other four energy types. This changes the descriptor of the spell to match the new energy type. Any non-damaging effects remain unchanged unless the new energy type invalidates them (an ice storm that deals fire damage might still provide a penalty on Perception checks due to smoke, but it would not create difficult terrain). Such effects are subject to GM discretion. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nElemental Manipulation (Su): At 8th level, you can emit a 30-foot aura that transforms magical energy. Choose an energy type from acid, cold, electricity, and fire, and a second type to transform it into. Any magical source of energy of this type with a caster level equal to or less than your wizard level is altered to the chosen energy type. This includes supernatural effects from creatures with Hit Dice no greater than your caster level. For example, you could transform a white dragon?s frigid breath weapon (a supernatural ability), but not a fire elemental?s fiery touch (an extraordinary ability). If an effect lies only partially within your aura, only the portions within the aura are transformed. You can use this ability for a number of rounds per day equal to your wizard level. The rounds do not need to be consecutive.'),
	(19,'Generation',2,17,'Replacement Powers: The following school powers replace the intense spells and force missile powers of the evocation school.\n\nLingering Evocations (Su): Any evocation spell you cast with a duration greater than instantaneous lasts an additional number of rounds equal to 1/2 your wizard level (minimum +1). At 20th level, any dispel checks made against your evocation spells must be rolled twice, and your opponent must use the less favorable result.\n\nWind Servant (Sp): As a standard action, you can generate a blast of air that hurls an unattended object (or objects) or an object in your possession up to 30 feet in a straight line. If you have a free hand, you can catch an object hurled toward yourself. You can move objects weighing up to 1 pound per wizard level. Objects are not thrown with enough force to cause damage, although fragile objects like alchemical weapons shatter on contact with a creature or hard surface. To hit a creature with an object, you must succeed at a ranged touch attack. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.'),
	(20,'Illusion',1,1,'Illusionists use magic to weave confounding images, figments, and phantoms to baffle and vex their foes.\nExtended Illusions (Su)\n\nExtended Illusions (Su): Any illusion spell you cast with a duration of ?concentration? lasts a number of additional rounds equal to 1/2 your wizard level after you stop maintaining concentration (minimum +1 round). At 20th level, you can make one illusion spell with a duration of ?concentration? become permanent. You can have no more than one illusion made permanent in this way at one time. If you designate another illusion as permanent, the previous permanent illusion ends.\nBlinding Ray (Sp)\n\nBlinding Ray (Sp): As a standard action you can fire a shimmering ray at any foe within 30 feet as a ranged touch attack. The ray causes creatures to be blinded for 1 round. Creatures with more Hit Dice than your wizard level are dazzled for 1 round instead. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nInvisibility Field (Sp)\n\nInvisibility Field (Sp): At 8th level, you can make yourself Invisible as a swift action for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive. This otherwise functions as greater invisibility.'),
	(21,'Phantasm',2,20,'Replacement Powers: The following school powers replace the blinding ray and invisibility field powers of the illusion school.\n\nTerror (Su): As a standard action, you can make a melee touch attack that causes a creature to be assailed by nightmares only it can see. The creature provokes an attack of opportunity from you or an ally of your choice. Creatures with more Hit Dice than your wizard level are unaffected. This is a mind-affecting fear effect. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nBedeviling Aura (Su): At 8th level, you can emit a 30-foot aura that bedevils your enemies with phantasmal assailants. Enemies within this aura move at half speed, are unable to take attacks of opportunity, and are considered to be flanked. This is a mind-affecting effect. You can use this ability for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive.'),
	(22,'Shadow',2,20,'Replacement Powers: The following school powers replace the blinding ray and invisibility field powers of the illusion school.\n\nBinding Darkness (Sp): As a standard action, you cast a weave of shadows at any foe within 30 feet as a ranged touch attack. The shadows entangle your foe for 1 round plus 1 additional round for every five wizard levels you possess. In conditions of bright light, this duration is halved (minimum 1 round). A creature entangled by your shadows has concealment from those without darkvision or the ability to see in darkness, and other creatures likewise have concealment relative to it. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nShadow Step (Sp): At 8th level, you can use this ability to walk through the Shadow Plane and reappear as a standard action. You can travel up to 30 feet per wizard level per day in this fashion, either in a single round or broken up across multiple shadow steps. This movement must be used in 5-foot increments and does not provoke an attack of opportunity. Travel through the Shadow Plane is imprecise; when you arrive, you re-enter 1 square off target, as per the rules for thrown splash weapons (see page 202 of the Pathfinder RPG Core Rulebook). If this would place you in an occupied square, you instead arrive in the nearest safe location. When you arrive, you are cloaked in shadow and gain concealment as the blur spell for 1 round. You may bring other willing creatures with you, but you must expend an equal amount of distance for each additional creature brought with you. They likewise re-enter off target (roll location for each creature) and are cloaked in shadow for 1 round.'),
	(23,'Life',2,2,'Replacement Powers: The following school powers replace the power over undead and grave touch powers of the necromancy school.\n\nHealing Grace (Su): Whenever you cast a spell that has targets, affects creatures in an area, or requires an attack roll, you may heal creatures affected by the spell a total of 1 point of damage per level of the spell. This healing may be spread out between the targets of the spell in any way you choose. If you assign any of the healing to an undead creature, it instead takes 1 point of damage for each point assigned. At 11th level, the amount of damage cured increases to 2 points of damage per level of the spell. This healing occurs when the spell is cast and has no effect on creatures that enter its area after the spell is in place. At 20th level, the amount of damage cured increases to 3 points of damage per level of the spell.\n\nShare Essence (Sp): As a standard action, you can share your vital energy with a living creature that you touch. You take 1d6 points of nonlethal damage + 1 for every two wizard levels you possess. You cannot take an amount of nonlethal damage equal to or greater than your current hit point total; any excess is prevented. The recipient gains a number of temporary hit points equal to the amount of damage you received (prevented damage is not counted). These temporary hit points disappear 1 hour later. You may not use this ability to grant yourself temporary hit points. You can use this ability a number of times per day equal to 3 + your Intelligence modifier. This ability has no effect if you are immune to nonlethal damage.'),
	(24,'Transmutation',1,1,'Transmuters use magic to change the world around them.\nPhysical Enhancement (Su)\n\nPhysical Enhacement (Su): You gain a +1 enhancement bonus to one physical ability score (Strength, Dexterity, or Constitution). This bonus increases by +1 for every five wizard levels you possess to a maximum of +5 at 20th level. You can change this bonus to a new ability score when you prepare spells. At 20th level, this bonus applies to two physical ability scores of your choice.\nTelekinetic Fist (Sp)\n\nTelekinetic Fist (Sp): As a standard action you can strike with a telekinetic fist, targeting any foe within 30 feet as a ranged touch attack. The telekinetic fist deals 1d4 points of bludgeoning damage + 1 for every two wizard levels you possess. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nChange Shape (Sp)\n\nChange Shape (Sp): At 8th level, you can change your shape for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive. This ability otherwise functions like beast shape II or elemental body I. At 12th level, this ability functions like beast shape III or elemental body II.'),
	(25,'Enhancement',2,24,'Replacement Powers: The following school powers replace the telekinetic fist and change shape powers of the transmutation school.\n\nAugment (Sp): As a standard action, you can touch a creature and grant it either a +2 enhancement bonus to a single ability score of your choice or a +1 bonus to natural armor that stacks with any natural armor the creature might possess. At 10th level, the enhancement bonus to one ability score increases to +4. The natural armor bonus increases by +1 for every five wizard levels you possess, to a maximum of +5 at 20th level. This augmentation lasts a number of rounds equal to 1/2 your wizard level (minimum 1 round). You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\n\nPerfection of Self (Su): At 8th level, as a swift action you can grant yourself an enhancement bonus to a single ability score equal to 1/2 your wizard level (maximum +10) for one round. You may use this ability for a number of times per day equal to your wizard level.'),
	(26,'Shapechange',2,24,'Replacement Power: The following school power replaces the telekinetic fist power of the transmutation school.\n\nBattleshaping (Su): As a swift action, you grow a single natural weapon. The natural weapon lasts for 1 round and has a +1 enhancement bonus on attack and damage rolls for every four wizard levels you possess. You can grow a claw, a bite, or a gore attack. These attacks deal the normal damage for a creature of your size (see page 302 of the Pathfinder RPG Pathfinder Roleplaying Game Bestiary). At 11th level, you can shape two natural weapons. You may not grow additional limbs or a tail with this ability. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.'),
	(27,'Universalist',1,1,'Wizards who do not specialize (known as as universalists) have the most diversity of all arcane spellcasters.\nHand of the Apprentice (Su)\n\nHand of the Apprentice (Su): You cause your melee weapon to fly from your grasp and strike a foe before instantly returning to you. As a standard action, you can make a single attack using a melee weapon at a range of 30 feet. This attack is treated as a ranged attack with a thrown weapon, except that you add your Intelligence modifier on the attack roll instead of your Dexterity modifier (damage still relies on Strength). This ability cannot be used to perform a combat maneuver. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nMetamagic Mastery (Su)\n\nMetamagic Mastery (Su): At 8th level, you can apply any one metamagic feat that you know to a spell you are about to cast. This does not alter the level of the spell or the casting time. You can use this ability once per day at 8th level and one additional time per day for every two wizard levels you possess beyond 8th. Any time you use this ability to apply a metamagic feat that increases the spell level by more than 1, you must use an additional daily usage for each level above 1 that the feat adds to the spell. Even though this ability does not modify the spell\'s actual level, you cannot use this ability to cast a spell whose modified spell level would be above the level of the highest-level spell that you are capable of casting.'),
	(28,'Air',2,1,'The Air elementalist uses the forces of the wind, sky, clouds, and lightning to confuse and destroy his foes, all while flying through the Air with ease.\nAir Supremacy (Su)\n\nAir Supremacy (Su): You gain a +2 enhancement bonus on Fly skill checks. This bonus increases by +1 for every five wizard levels you possess. In addition, you can cast feather fall on yourself at will. At 5th level, you can cast levitate on yourself at will. At 10th level, you can cast fly on yourself at will. At 20th level, whenever you make a Fly skill check, assume the roll resulted in a natural 20.\nLightning Flash (Su)\n\nLightning Flash (Su): As a standard action, you can unleash a flash of electricity. This flash deals 1d6 points of electricity damage + 1 point for every two wizard levels you possess to all creatures within 5 feet of you and dazzles them for 1d4 rounds. A successful Reflex save negates the dazzled effect and halves the damage. The DC of this save is equal to 10 + 1/2 your wizard level + your Intelligence modifier. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nCyclone (Su)\n\nCyclone (Su): At 8th level, you can create a vortex of turbulent wind around yourself as a standard action. This vortex has a radius of up to 10 feet and a maximum height of 10 feet per wizard level you possess. Any ranged attack passing through this vortex automatically misses. Any flying creature moving through the vortex must make a Fly skill check or immediately fall from the sky, taking falling damage (the creature cannot make a Fly check to reduce or negate this damage). Creatures on the ground cannot pass through the vortex without first making a Strength check. The DC of this check is equal to 10 + your caster level. The vortex is faintly visible and can be spotted with a DC 15 Perception skill check. You can use this ability for a number of rounds per day equal to your wizard level. These rounds do not need to be consecutive.\n\nAir Elementalist Spells:\n\n0th?message\n1st?alter winds, feather fall, shocking grasp\n2nd?elemental speech, elemental touch, glide, gust of wind, levitate, resist energy, summon monster II, whispering wind\n3rd?cloak of winds, draconic reservoir, elemental aura, fly, gaseous form, lightning bolt, protection from energy, wind wall\n4th?ball lightning, detonate, dragon\'s breath, elemental body I, river of wind, shout, summon monster IV\n5th?elemental body III, overland flight, planar adaptation, planar binding, lesser, suffocation, summon monster V\n6th?chain lightning, elemental body III, planar binding, sirocco, summon monster VI\n7th?control weather, elemental body IV, fly, mass, planar adaptation, mass, summon monster VII\n8th?planar binding, greater, shout, greater, stormbolts, summon monster VIII\n9th?gate, suffocation, mass, winds of vengeance\n'),
	(29,'Earth',2,1,'The earth elementalist draws power from the stone around him, shaping it, shattering it, and bending it to his will. He can use it to defend himself or cause it to rise up and crush his foes.\nEarth Supremacy (Su)\n\nEarth Supremacy (Su): You gain a +2 enhancement bonus to your CMD to resist bull rush, drag, reposition, trip, and overrun attempts as long as you are touching the ground. This bonus increases by +1 for every five wizard levels you possess. In addition, you gain a +1 insight bonus on melee attack and damage rolls whenever both you and your foe are touching the ground. At 20th level, earth and stone do not block the line of effect of your spells, although they do still block your line of sight.\nAcid Cloud (Su)\n\nAcid Cloud (Su): As a standard action, you can create a 5-foot-radius cloud of acid vapor within 30 feet that lasts for 1 round. This cloud deals 1d6 points of acid damage + 1 point for every two wizard levels you possess to all creatures in the cloud and sickens them for 1 round. A successful Fortitude save negates the sickened effect and halves the damage. The DC of this save is equal to 10 + 1/2 your wizard level + your Intelligence modifier. Creatures that begin their turn inside the cloud can move out that turn without penalty, but those that enter the cloud are affected. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nEarth Glide (Su)\n\nEarth Glide (Su): At 8th level, you gain the ability to move through earth, dirt, and stone for a number of rounds per day equal to your wizard level. You cannot move through worked earth or stone; only natural substances can be traversed. If your total duration expires before you exit the earth, you are flung back to the point where you entered the stone, take 4d6 points of damage, and are stunned for 1 round. Your burrowing does not leave a hole, nor does it give any sign of your presence (although you can be detected by creatures with tremorsense). These rounds do not need to be consecutive.\n\nEarth Elementalist Spells:\n\n0th?acid splash\n1st?expeditious excavation, grease, stone fist\n2nd?acid arrow, create pit, elemental speech, elemental touch, glitterdust, resist energy, shatter, stone call, summon monster II\n3rd?draconic reservoir, elemental aura, protection from energy, shifting sand, spiked pit, stinking cloud\n4th?acid pit, calcific touch, detonate, dragon\'s breath, elemental body I, stone shape, stoneskin, summon monster IV,\n5th?elemental body III, hungry pit, passwall, planar adaptation, planar binding, lesser, summon monster V, transmute mud to rock, transmute rock to mud, wall of stone\n6th?acid fog, elemental body III, flesh to stone, move earth, planar binding, stone to flesh, summon monster VI, wall of iron\n7th?elemental body IV, planar adaptation, mass, rampart, reverse gravity, statue, summon monster VII\n8th?iron body, planar binding, greater, summon monster VIII, wall of lava\n9th?clashing rocks, gate, world wave\n'),
	(30,'Fire',2,1,'The fire elementalist sees a world around him that is made to burn, and he can bring that fire to consume his foes. He has also learned that fire can purify and protect, if properly controlled.\nFire Supremacy (Su)\n\nFire Supremacy (Su): You gain resistance 5 to fire. At 10th level, this resistance increases to 10. At 20th level, you gain immunity to fire damage. In addition, whenever you are within 5 feet of a source of flame at least as large as a campfire, you can draw the fire around you for 1 round as a swift action. Anyone striking you with a melee weapon or unarmed strike takes an amount of fire damage equal to 1/2 your wizard level (minimum 1). Weapons with reach avoid this damage.\nFire Jet (Su)\n\nFire Jet (Su): As a standard action, you can send forth a 20-foot line of fire. Anyone in this line takes 1d6 points of fire damage + 1 point for every two wizard levels you possess. A successful Reflex save halves this damage. The DC of this save is equal to 10 + 1/2 your wizard level + your Intelligence modifier. Creatures that fail their saving throw catch fire and take 1d6 points of fire damage on the following round. Creatures that catch fire can avoid this damage by taking a full-round action to extinguish the flames by making a DC 15 Reflex save. Rolling on the ground gives a +2 circumstance bonus on the save. Dousing the creature with water automatically extinguishes the flame. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nDancing Flame (Su)\n\nDancing Flame (Su): At 8th level, as a standard action, you can sculpt fire to suit your desires. With one use of this ability you can move any nonmagical fire up to 30 feet. Alternatively you can use this ability to alter any fire spell that you cast with a duration of instantaneous by removing any number of squares from its area of affect. If the fire spell has a duration, you can use this ability to reposition the spell, within its original range (treat this as if you had just cast the spell, even though the duration is unchanged). You cannot use this ability on a fire spell that you did not cast. If you move a nonmagical flame, it must have a new source of fuel. If it does not, it is extinguished in one round. You can use this ability a number of times per day equal to 1/2 your wizard level.\n\nFire Elementalist Spells:\n\n0th?spark\n1st?burning hands, dancing lantern\n2nd?burning gaze, elemental speech, elemental touch, fire breath, flaming sphere, pyrotechnics, resist energy, scorching ray, summon monster II\n3rd?campfire wall, draconic reservoir, elemental aura, fireball, flame arrow, protection from energy\n4th?detonate, dragon\'s breath, elemental body I, fire shield, fire trap, firefall, summon monster IV, wall of fire\n5th?elemental body III, fire snake, geyser, planar adaptation, planar binding, lesser, summon monster V\n6th?contagious flame, elemental body III, planar binding, sirocco, summon monster VI\n7th?delayed blast fireball, elemental body IV, firebrand, planar adaptation, mass, summon monster VII\n8th?incendiary cloud, planar binding, greater, summon monster VIII, wall of lava\n9th?fiery body, gate, meteor swarm\n'),
	(31,'Water',2,1,'The water elementalist draws magic from the ocean depths. His power is fluid as well, crushing foes in mighty waves or wearing them down through timeless erosion.\nWater Supremacy (Su)\n\nWater Supremacy (Su): You gain a +2 enhancement bonus on Swim skill checks. This bonus increases by +1 for every five wizard levels you possess. In addition, you can hold your breath for a number of rounds equal to four times your Constitution score before you must start making checks to avoid drowning. At 10th level, you gain a swim speed equal to your base speed. At 20th level, whenever you make a Swim skill check, assume the roll resulted in a natural 20.\nCold Blast (Su)\n\nCold Blast (Su): As a standard action, you can unleash a blast of freezing cold. This blast deals 1d6 points of cold damage + 1 point for every two wizard levels you possess to all creatures within 5 feet of you and staggers them for 1 round. A successful Reflex save negates the staggered effect and halves the damage. The DC of this save is equal to 10 + 1/2 your wizard level + your Intelligence modifier. You can use this ability a number of times per day equal to 3 + your Intelligence modifier.\nWave (Su)\n\nWave (Su): At 8th level, you can create a wave of water that starts at your location and moves 30 feet per round away from you in a direction of your choosing. Creatures struck by the wave might be knocked down and pushed away. Make a caster level check against the CMD of each creature struck. If you succeed, the creature is knocked prone. If your check exceeds the CMD of the creature by 5 or more, it is carried with the wave during the wave?s movement this round. You receive a +5 bonus on this check if the creature shares its space with the wave at the start of your turn (when the wave moves). Creatures carried in this way can move out of the wave on their turn if they succeed on a Strength check (DC = 10 + 1/2 your caster level + your Intelligence modifier), but they cannot breathe while sharing space with the wave. The wave is up to 20 feet high and up to 5 feet long for each wizard level you possess. Nonmagical fires hit by the wave are automatically extinguished. Magical fire effects are unaffected. You can use this ability for a number of rounds per day equal to 1/2 your wizard level.\n\nWater Elementalist Spells:\n\n0th?ray of frost\n1st?hydraulic push, obscuring mist, touch of the sea\n2nd?accelerate poison, elemental speech, elemental touch, fog cloud, resist energy, slipstream, summon monster II\n3rd?aqueous orb, draconic reservoir, elemental aura, hydraulic torrent, protection from energy, sleet storm, water breathing\n4th?detonate, dragon\'s breath, elemental body I, ice storm, solid fog, summon monster IV, wall of ice\n5th?cloudkill, cone of cold, elemental body III, geyser, planar adaptation, planar binding, lesser, summon monster V\n6th?elemental body III, fluid form, freezing sphere, planar binding, summon monster VI\n7th?control weather, elemental body IV, planar adaptation, mass, summon monster VII, vortex\n8th?horrid wilting, planar binding, greater, polar ray, seamantle, summon monster VIII\n9th?gate, tsunami, world wave\n');

/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;

INSERT INTO `sources` (`id`, `source_name`)
VALUES
	(1,'PFRPG Core Rulebook'),
	(2,'Advanced Player\'s Guide'),
	(3,'Ultimate Combat'),
	(4,'GameMastery Guide'),
	(5,'PFRPG Bestiary'),
	(6,'PFRPG Bestiary 2'),
	(7,'PFRPG Bestiary 3'),
	(8,'Ultimate Magic'),
	(9,'d20 PFSRD');

/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spell_count
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spell_count`;

CREATE TABLE `spell_count` (
  `id` int(11) unsigned NOT NULL,
  `char_level` int(11) unsigned NOT NULL DEFAULT '0',
  `0_spells` int(11) DEFAULT NULL,
  `1_spells` int(11) DEFAULT NULL,
  `2_spells` int(11) DEFAULT NULL,
  `3_spells` int(11) DEFAULT NULL,
  `4_spells` int(11) DEFAULT NULL,
  `5_spells` int(11) DEFAULT NULL,
  `6_spells` int(11) DEFAULT NULL,
  `7_spells` int(11) DEFAULT NULL,
  `8_spells` int(11) DEFAULT NULL,
  `9_spells` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`char_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spell_count` WRITE;
/*!40000 ALTER TABLE `spell_count` DISABLE KEYS */;

INSERT INTO `spell_count` (`id`, `char_level`, `0_spells`, `1_spells`, `2_spells`, `3_spells`, `4_spells`, `5_spells`, `6_spells`, `7_spells`, `8_spells`, `9_spells`)
VALUES
	(0,0,0,0,0,0,0,0,0,0,0,0),
	(0,1,0,1,0,0,0,0,0,0,0,0),
	(0,2,0,1,1,0,0,0,0,0,0,0),
	(0,3,0,1,1,1,0,0,0,0,0,0),
	(0,4,0,1,1,1,1,0,0,0,0,0),
	(0,5,0,2,1,1,1,1,0,0,0,0),
	(0,6,0,2,2,1,1,1,1,0,0,0),
	(0,7,0,2,2,2,1,1,1,1,0,0),
	(0,8,0,2,2,2,2,1,1,1,1,0),
	(0,9,0,3,2,2,2,2,1,1,1,1),
	(0,10,0,3,3,2,2,2,2,1,1,1),
	(0,11,0,3,3,3,2,2,2,2,1,1),
	(0,12,0,3,3,3,3,2,2,2,2,1),
	(0,13,0,4,3,3,3,3,2,2,2,2),
	(0,14,0,4,4,3,3,3,3,2,2,2),
	(0,15,0,4,4,4,3,3,3,3,2,2),
	(0,16,0,4,4,4,4,3,3,3,3,2),
	(0,17,0,5,4,4,4,4,3,3,3,3),
	(1,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,2,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,3,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,4,NULL,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,5,NULL,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,6,NULL,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,7,NULL,4,3,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,8,NULL,4,4,2,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,9,NULL,5,4,3,NULL,NULL,NULL,NULL,NULL,NULL),
	(1,10,NULL,5,4,3,1,NULL,NULL,NULL,NULL,NULL),
	(1,11,NULL,5,4,4,2,NULL,NULL,NULL,NULL,NULL),
	(1,12,NULL,5,5,4,3,NULL,NULL,NULL,NULL,NULL),
	(1,13,NULL,5,5,4,3,1,NULL,NULL,NULL,NULL),
	(1,14,NULL,5,5,4,4,2,NULL,NULL,NULL,NULL),
	(1,15,NULL,5,5,5,4,3,NULL,NULL,NULL,NULL),
	(1,16,NULL,5,5,5,4,3,1,NULL,NULL,NULL),
	(1,17,NULL,5,5,5,4,4,2,NULL,NULL,NULL),
	(1,18,NULL,5,5,5,5,4,3,NULL,NULL,NULL),
	(1,19,NULL,5,5,5,5,5,4,NULL,NULL,NULL),
	(1,20,NULL,5,5,5,5,5,5,NULL,NULL,NULL),
	(2,1,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,5,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,3,6,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,4,6,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,5,6,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,6,6,4,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,7,6,5,4,2,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,8,6,5,4,3,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,9,6,5,4,4,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,10,6,5,5,4,2,NULL,NULL,NULL,NULL,NULL),
	(2,11,6,6,5,4,3,NULL,NULL,NULL,NULL,NULL),
	(2,12,6,6,5,4,4,NULL,NULL,NULL,NULL,NULL),
	(2,13,6,6,5,5,4,2,NULL,NULL,NULL,NULL),
	(2,14,6,6,6,5,4,3,NULL,NULL,NULL,NULL),
	(2,15,6,6,6,5,4,4,NULL,NULL,NULL,NULL),
	(2,16,6,6,6,5,5,4,2,NULL,NULL,NULL),
	(2,17,6,6,6,6,5,4,3,NULL,NULL,NULL),
	(2,18,6,6,6,6,5,4,4,NULL,NULL,NULL),
	(2,19,6,6,6,6,5,5,4,NULL,NULL,NULL),
	(2,20,6,6,6,6,5,5,5,NULL,NULL,NULL),
	(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,4,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,5,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,6,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,7,NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,8,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,9,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,10,NULL,2,1,0,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,11,NULL,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,12,NULL,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,13,NULL,3,2,1,0,NULL,NULL,NULL,NULL,NULL),
	(3,14,NULL,3,2,1,1,NULL,NULL,NULL,NULL,NULL),
	(3,15,NULL,3,2,2,1,NULL,NULL,NULL,NULL,NULL),
	(3,16,NULL,3,3,2,1,NULL,NULL,NULL,NULL,NULL),
	(3,17,NULL,4,3,2,1,NULL,NULL,NULL,NULL,NULL),
	(3,18,NULL,4,3,2,2,NULL,NULL,NULL,NULL,NULL),
	(3,19,NULL,4,3,3,2,NULL,NULL,NULL,NULL,NULL),
	(3,20,NULL,4,4,3,3,NULL,NULL,NULL,NULL,NULL),
	(4,1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,2,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,3,4,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,4,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,5,4,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,6,4,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,7,4,4,3,2,1,NULL,NULL,NULL,NULL,NULL),
	(4,8,4,4,3,3,2,NULL,NULL,NULL,NULL,NULL),
	(4,9,4,4,4,3,2,1,NULL,NULL,NULL,NULL),
	(4,10,4,4,4,3,3,2,NULL,NULL,NULL,NULL),
	(4,11,4,4,4,4,3,2,1,NULL,NULL,NULL),
	(4,12,4,4,4,4,3,3,2,NULL,NULL,NULL),
	(4,13,4,4,4,4,4,3,2,1,NULL,NULL),
	(4,14,4,4,4,4,4,3,3,2,NULL,NULL),
	(4,15,4,4,4,4,4,4,3,2,1,NULL),
	(4,16,4,4,4,4,4,4,3,3,2,NULL),
	(4,17,4,4,4,4,4,4,4,3,2,1),
	(4,18,4,4,4,4,4,4,4,3,3,2),
	(4,19,4,4,4,4,4,4,4,4,3,3),
	(4,20,4,4,4,4,4,4,4,4,4,4);

/*!40000 ALTER TABLE `spell_count` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spell_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spell_types`;

CREATE TABLE `spell_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `spell_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spell_types` WRITE;
/*!40000 ALTER TABLE `spell_types` DISABLE KEYS */;

INSERT INTO `spell_types` (`id`, `spell_type`)
VALUES
	(1,'Arcane'),
	(2,'Divine');

/*!40000 ALTER TABLE `spell_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table spells
# ------------------------------------------------------------

DROP TABLE IF EXISTS `spells`;

CREATE TABLE `spells` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `spell_name` varchar(64) DEFAULT NULL,
  `school` int(11) unsigned DEFAULT NULL,
  `subschool` int(11) unsigned DEFAULT NULL,
  `bard_level` smallint(2) DEFAULT NULL,
  `cleric_level` smallint(2) DEFAULT NULL,
  `druid_level` smallint(2) DEFAULT NULL,
  `ranger_level` smallint(2) DEFAULT NULL,
  `wizard_level` smallint(2) DEFAULT NULL,
  `casting_time` varchar(64) DEFAULT NULL,
  `verbal` tinyint(1) DEFAULT NULL,
  `somatic` tinyint(1) DEFAULT NULL,
  `material` tinyint(1) DEFAULT NULL,
  `range` varchar(64) DEFAULT NULL,
  `duration` varchar(64) DEFAULT NULL,
  `saving_throw` varchar(64) DEFAULT NULL,
  `spell_resistance` varchar(64) DEFAULT NULL,
  `targets` varchar(64) DEFAULT NULL,
  `source` int(11) unsigned DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `school` (`school`),
  KEY `subschool` (`subschool`),
  KEY `source` (`source`),
  CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`school`) REFERENCES `schools` (`id`),
  CONSTRAINT `spells_ibfk_2` FOREIGN KEY (`subschool`) REFERENCES `schools` (`id`),
  CONSTRAINT `spells_ibfk_3` FOREIGN KEY (`source`) REFERENCES `sources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `spells` WRITE;
/*!40000 ALTER TABLE `spells` DISABLE KEYS */;

INSERT INTO `spells` (`id`, `spell_name`, `school`, `subschool`, `bard_level`, `cleric_level`, `druid_level`, `ranger_level`, `wizard_level`, `casting_time`, `verbal`, `somatic`, `material`, `range`, `duration`, `saving_throw`, `spell_resistance`, `targets`, `source`, `description`)
VALUES
	(1,'Bleed',2,NULL,NULL,0,NULL,NULL,0,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)','instantaneous','Will negates','yes','one living creature',1,'You cause a living creature that is below 0 hit points but stabilized to resume dying.  Upon casting this spell, you target a living creature that has -1 or fewer hit points.  That creature begins dying, taking 1 point of damage per round.  The creature can be stabilized later normally.  This spell causes a creature that is dying to take 1 point of damage.'),
	(2,'Dancing Lights',17,NULL,0,NULL,NULL,NULL,0,'1 standard action',1,1,NULL,'medium (100 ft. + 10 ft./level)','1 minute (D)','none','no',NULL,1,'Depending on the version selected, you create up to four lights that resemble lanterns or torches (and cast that amount of light), or up to four glowing spheres of light (which look like will-o\'-wisps), or one faintly glowing, vaguely humanoid shape. The dancing lights must stay within a 10-foot-radius area in relation to each other but otherwise move as you desire (no concentration required): forward or back, up or down, straight or turning corners, or the like. The lights can move up to 100 feet per round. A light winks out if the distance between you and it exceeds the spell\'s range.\n\nYou can only have one dancing lights spell active at any one time. If you cast this spell while another casting is still in effect, the previous casting is dispelled. If you make this spell permanent, it does not count against this limit.\n\nDancing lights can be made permanent with a permanency spell.'),
	(3,'Detect Magic',5,NULL,0,0,0,NULL,0,'1 standard action',1,1,NULL,'60 ft.','concentration, up to 1 min./level (D)','none','no','Area: cone-shaped emanation',1,'You detect magical auras. The amount of information revealed depends on how long you study a particular area or subject.\n\n1st Round: Presence or absence of magical auras.\n\n2nd Round: Number of different magical auras and the power of the most potent aura.\n\n3rd Round: The strength and location of each aura. If the items or creatures bearing the auras are in line of sight, you can make Knowledge (arcana) skill checks to determine the school of magic involved in each. (Make one check per aura: DC 15 + spell level, or 15 + 1/2 caster level for a nonspell effect.) If the aura emanates from a magic item, you can attempt to identify its properties (see Spellcraft).\n'),
	(4,'Abundant Ammunition',6,NULL,1,1,NULL,1,1,'1 standard action',1,1,1,'N/A','1 minute/level','none','no','one container touched',3,'When cast on a container such as a quiver or a pouch that contains nonmagical ammunition or shuriken (including masterwork ammunition or shuriken), at the start of each round this spell replaces any ammunition taken from the container the round before. The ammunition taken from the container the round before vanishes. If, after casting this spell, you cast a spell that enhances projectiles, such as align weapon or greater magic weapon, on the same container, all projectiles this spell conjures are affected by that spell.'),
	(5,'Adjuring Step',7,NULL,1,NULL,NULL,NULL,1,'1 standard action',1,1,1,'personal','1 round/level (D)','none','no','you',3,'This spell creates a subtle and complicated force effect that is most effective when used by a still or slow-moving spellcaster or formula user. While you are subject to this spell, you can take two 5-foot steps each round and still cast spells and use spell-like abilities without provoke attacks of opportunity. This spell automatically discharges as soon as you make an attack, cast a harmful spell against another creature, or move more than 5 feet with a single move action. If the action that discharges the spell also provokes attacks of opportunity, that action still provokes attacks of opportunity as normal.'),
	(6,'Acute Senses',24,NULL,2,NULL,NULL,2,NULL,'1 standard action',1,1,1,'touch','1 minute/level','Will negates (harmless)','yes','creature touched',8,'The target gains a +10 enhancement bonus on Perception checks. The bonus increases to +20 at caster level 8th, and +30 (the maximum) at caster level 16th.'),
	(7,'Flare',17,NULL,0,NULL,0,NULL,0,'1 standard action',1,NULL,0,'close (25 ft. + 5 ft./2 levels)','instantaneous','Fortitude negates','yes',NULL,1,'This cantrip creates a burst of light. If you cause the light to burst in front of a single creature, that creature is dazzled for 1 minute unless it makes a successful Fortitude save. Sightless creatures, as well as creatures already dazzled, are not affected by flare.'),
	(8,'Ghost Sound',20,NULL,0,NULL,NULL,NULL,0,'1 standard action',1,1,1,'close (25 ft. + 5 ft./2 levels)','1 round/level (D)','Will disbelief','no',NULL,1,'host sound allows you to create a volume of sound that rises, recedes, approaches, or remains at a fixed place. You choose what type of sound ghost sound creates when casting it and cannot thereafter change the sound\'s basic character.\n\nThe volume of sound created depends on your level. You can produce as much noise as four normal humans per caster level (maximum 40 humans). Thus, talking, singing, shouting, walking, marching, or running sounds can be created. The noise a ghost sound spell produces can be virtually any type of sound within the volume limit. A horde of rats running and squeaking is about the same volume as eight humans running and shouting. A roaring lion is equal to the noise from 16 humans, while a roaring dragon is equal to the noise from 32 humans. Anyone who hears a ghost sound receives a Will save to disbelieve.\n\nGhost sound can enhance the effectiveness of a silent image spell.\n\nGhost sound can be made permanent with a permanency spell.'),
	(9,'Light',17,NULL,0,0,0,NULL,0,'1 standard action',1,NULL,1,'touch','10 min./level','none','no','object touched',1,'This spell causes a touched object to glow like a torch, shedding normal light in a 20-foot radius from the point touched, and increasing the light level for an additional 20 feet by one step, up to normal light (darkness becomes dim light, and dim light becomes normal light). In an area of normal or bright light, this spell has no effect. The effect is immobile, but it can be cast on a movable object.\n\nYou can only have one light spell active at any one time. If you cast this spell while another casting is still in effect, the previous casting is dispelled. If you make this spell permanent (through permanency or a similar effect), it does not count against this limit. Light can be used to counter or dispel any darkness spell of equal or lower spell level.'),
	(10,'Mage Hand',24,NULL,0,NULL,NULL,NULL,0,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)',NULL,'none','no','one nonmagical, unattended object weighing up to 5 lbs.',1,'You point your finger at an object and can lift it and move it at will from a distance. As a move action, you can propel the object as far as 15 feet in any direction, though the spell ends if the distance between you and the object ever exceeds the spell\'s range.'),
	(11,'Read Magic',5,NULL,0,0,0,1,0,'1 standard action',1,1,NULL,'personal','10 min./level',NULL,NULL,'you',1,'You can decipher magical inscriptions on objects - books, scrolls, weapons, and the like - that would otherwise be unintelligible. This deciphering does not normally invoke the magic contained in the writing, although it may do so in the case of a cursed or trapped scroll. Furthermore, once the spell is cast and you have read the magical inscription, you are thereafter able to read that particular writing without recourse to the use of read magic. You can read at the rate of one page (250 words) per minute. The spell allows you to identify a glyph of warding with a DC 13 Spellcraft check, a greater glyph of warding with a DC 16 Spellcraft check, or any symbol spell with a Spellcraft check (DC 10 + spell level).\n\nRead magic can be made permanent with a permanency spell.'),
	(12,'Adoration',24,NULL,1,NULL,NULL,NULL,2,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)',NULL,'Will negates (harmless)','yes','one creature',3,'The target of this spell is the subject of adoration by those whom it tries to affect with Diplomacy or during performance combat. If the target is out of combat, it receives a +2 morale bonus on all Diplomacy checks it makes to influence creatures. If the creature is engaged in performance combat the target gains a +2 morale bonus on all performance combat checks.'),
	(13,'Cause Fear',2,NULL,1,1,NULL,NULL,1,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)','1d4 round or 1 round; see text','Will partial','yes','one living creature with 5 or fewer HD',1,'The affected creature becomes frightened. If the subject succeeds on a Will save, it is shaken for 1 round. Creatures with 6 or more HD are immune to this effect. Cause fear counters and dispels remove fear.'),
	(14,'Beguiling Gift',14,NULL,1,NULL,NULL,NULL,NULL,'1 standard action',1,1,NULL,'5 ft.','1 round','Will negates','yes','one creature',2,'You offer an object to an adjacent creature, and entice it into using or consuming the proffered item. If the target fails its Will save, it immediately takes the offered object, dropping an already held object if necessary. On its next turn, it consumes or dons the object, as appropriate for the item in question. For example, an apple would be eaten, a potion consumed, a ring put on a finger, and a sword wielded in a free hand. If the target is physically unable to accept the object, the spell fails. The subject is under no obligation to continue consuming or using the item once the spell\'s duration has expired, although it may find a cursed item difficult to be rid of.'),
	(15,'Borrow Skill',24,NULL,1,NULL,NULL,NULL,NULL,'1 standard action',NULL,1,NULL,'touch','up to 1 round/level (see description)','Will negates (harmless)','yes (harmless)','creature touched',2,'You borrow one of the target\'s known skills. After touching the subject, you can make a single check with the chosen skill using the subject\'s skill ranks, but modified by your own key ability.\n\nIf you take longer than the spell\'s duration to make the check or the check requires more time, then it fails and you must use your own skill ranks (if any). If the borrowed skill is a class skill for you, you gain the +3 bonus on checks using that skill.'),
	(16,'Charm Person',14,NULL,1,NULL,NULL,NULL,1,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)','1 hour/level','Will negates','yes','one humanoid creature',1,'This charm makes a humanoid creature regard you as its trusted friend and ally (treat the target\'s attitude as friendly). If the creature is currently being threatened or attacked by you or your allies, however, it receives a +5 bonus on its saving throw.\n\nThe spell does not enable you to control the charmed person as if it were an automaton, but it perceives your words and actions in the most favorable way. You can try to give the subject orders, but you must win an opposed Charisma check to convince it to do anything it wouldn\'t ordinarily do. (Retries are not allowed.) An affected creature never obeys suicidal or obviously harmful orders, but it might be convinced that something very dangerous is worth doing. Any act by you or your apparent allies that threatens the charmed person breaks the spell. You must speak the person\'s language to communicate your commands, or else be good at pantomiming.'),
	(17,'Comprehend Languages',5,NULL,1,1,NULL,NULL,1,'1 standard action',1,1,1,'personal','10 min./level',NULL,NULL,'you',1,'You can understand the spoken words of creatures or read otherwise incomprehensible written messages. The ability to read does not necessarily impart insight into the material, merely its literal meaning. The spell enables you to understand or read an unknown language, not speak or write it.\n\nWritten material can be read at the rate of one page (250 words) per minute. Magical writing cannot be read, though the spell reveals that it is magical. This spell can be foiled by certain warding magic (such as the secret page and illusory script spells). It does not decipher codes or reveal messages concealed in otherwise normal text.\n\nComprehend languages can be made permanent with a permanency spell.'),
	(18,'Cure Light Wounds',6,NULL,1,1,1,2,NULL,'1 standard action',1,1,NULL,'touch','instantaneous','Will half (harmless); see text','yes (harmless); see text','creature touched',1,'When laying your hand upon a living creature, you channel positive energy that cures 1d8 points of damage +1 point per caster level (maximum +5). Since undead are powered by negative energy, this spell deals damage to them instead of curing their wounds. An undead creature can apply Spell Resistance, and can attempt a Will save to take half damage.'),
	(19,'Sleep',14,NULL,1,NULL,NULL,NULL,1,'1 round',1,1,1,'medium (100 ft. + 10 ft./level)','1 min./level','Will negates','yes','Area: one or more living creatures within a 10-ft. radius burst',1,'A sleep spell causes a magical slumber to come upon 4 HD of creatures. Creatures with the fewest HD are affected first. Among creatures with equal HD, those who are closest to the spell\'s point of origin are affected first. HD that are not sufficient to affect a creature are wasted. Sleeping creatures are helpless. Slapping or wounding awakens an affected creature, but normal noise does not. Awakening a creature is a standard action (an application of the aid another action). Sleep does not target unconscious creatures, constructs, or undead creatures.'),
	(20,'Cure Moderate Wounds',6,NULL,2,2,3,3,NULL,'1 standard action',1,1,NULL,'touch','instantaneous','Will half (harmless); see text','yes (harmless); see text','creature touched',1,'The damage cured increases to 4d8 points of damage + 2 points per caster level (maximum +20). The spell cures up to 2 points of ability damage if the target is a living creature. The target chooses what types of ability damage are cured.'),
	(21,'Alter Self',24,NULL,2,NULL,NULL,NULL,2,'1 standard action',1,1,1,'personal','1 min./level (D)',NULL,NULL,'you',1,'When you cast this spell, you can assume the form of any Small or Medium creature of the humanoid type. If the form you assume has any of the following abilities, you gain the listed ability: darkvision 60 feet, low-light vision, scent, and swim 30 feet.\n\nSmall creature: If the form you take is that of a Small humanoid, you gain a +2 size bonus to your Dexterity.\n\nMedium creature: If the form you take is that of a Medium humanoid, you gain a +2 size bonus to your Strength.'),
	(22,'Alarm',24,NULL,1,NULL,NULL,1,1,'1 standard action',1,1,NULL,'close (25 ft. + 5 ft./2 levels)','2 hours/level (D)','none','no','Area: 20-ft. radius emanation centered on a point in space',1,'Alarm creates a subtle ward on an area you select. Once the spell effect is in place, it thereafter sounds a mental or audible alarm each time a creature of Tiny or larger size enters the warded area or touches it. A creature that speaks the password (determined by you at the time of casting) does not set off the alarm. You decide at the time of casting whether the alarm will be mental or audible in nature.\n\nMental Alarm: A mental alarm alerts you (and only you) so long as you remain within 1 mile of the warded area. You note a single mental \"ping\" that awakens you from normal sleep but does not otherwise disturb concentration. A silence spell has no effect on a mental alarm.\n\nAudible Alarm: An audible alarm produces the sound of a hand bell, and anyone within 60 feet of the warded area can hear it clearly. Reduce the distance by 10 feet for each interposing closed door and by 20 feet for each substantial interposing wall.\n\nIn quiet conditions, the ringing can be heard faintly as far as 180 feet away. The sound lasts for 1 round. Creatures within a silence spell cannot hear the ringing.\n\nEthereal or astral creatures do not trigger the alarm.\n\nAlarm can be made permanent with a permanency spell.'),
	(23,'Delay Poison',6,NULL,2,2,NULL,1,NULL,'1 standard action',1,1,NULL,'touch','1 hour/level','Fortitude negates (harmless)','yes (harmless)','creature touched',1,'The subject becomes temporarily immune to poison. Any poison in its system or any poison to which it is exposed during the spell\'s duration does not affect the subject until the spell\'s duration has expired. Delay poison does not cure any damage that poison may have already done.'),
	(24,'Dream Feast',6,NULL,NULL,1,1,1,NULL,'1 standard action',1,1,NULL,'touch','instantaneous','Will negates (harmless)','yes (harmless)','creature touched',NULL,'The next time the target sleeps (within the next 8 hours), she dreams of a rich feast with her favorite foods and drinks. When she awakens, she is sated as if she had eaten a nutritious meal, regardless of what she dreamed she ate. The target must sleep for at least 1 hour to gain the benefits of this spell. Being awakened during this period interrupts the spell and cancels its effects.\n\nIf you sleep with this spell prepared, you may automatically expend it while you sleep to gain the spell\'s benefit. This expenditure does not count as spellcasting for the purpose of determining available spell slots (you could go to sleep at midnight, expend this spell during an 8-hour period of sleep, and still prepare your full allotment of spells in the morning).'),
	(25,'Longshot',24,NULL,NULL,NULL,NULL,1,1,'1 standard action',1,1,1,'personal','1 min./level',NULL,NULL,'you',3,'This spell reduces the effect of range, granting a +10-foot bonus to the range increment of any weapon used by the subject.'),
	(26,'Animal Aspect',24,NULL,NULL,NULL,2,2,2,'1 standard action',1,1,1,'personal','1 min./level (D)','none','yes (harmless)','you',3,'You gain some of the beneficial qualities of an animal. Your base form is largely unchanged and your size is unaltered, but some of your body parts are altered. Armor or gear you are wearing adjusts to your new shape for the duration of the spell. When you cast animal aspect, choose one of the following animals to gain the associated benefits. You can only have one animal aspect or greater animal aspect spell active on you at a time.\n\n    Frog: Your legs become elongated and muscular. You gain a +4 competence bonus on Acrobatics checks, and you always jump as if you had a running start.\n\n    Gorilla: Your arms become long, flexible, and strong like those of a great ape. Your unarmed damage die type increases by one step, and you gain a +4 competence bonus on combat maneuver checks when making the grapple or reposition combat maneuver.\n\n    Monkey: Your hands and arms become dexterous like those of a simian. You gain a +4 competence bonus on Climb checks, and you can throw objects as if you had the Throw Anything feat.\n\n    Otter: Your hands and feet gain webbing, and your lungs gain capacity, allowing you to move through the water with ease. You gain a Swim speed equal to half your speed, and all the benefits of having a swim speed. Additionally, you can hold your breath for 4 rounds per point of Constitution before being forced to make Constitution checks to keep holding your breath.\n\n    Raccoon: Your hands become extremely dexterous, and your feet become padded. You gain a +2 competence bonus on Disable Device, Sleight of Hand, and Stealth checks.\n\n    Raptor: Your legs become built for running speed, like those of a deinonychus. You gain a enhancement bonus of +20 feet to your base speed.\n\n    Tree Lizard: Your hands and feet gain climbing claws and climbing pads. You gain a climb speed equal to half your normal speed and all the benefits of having a natural climb speed.\n');

/*!40000 ALTER TABLE `spells` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `salt`)
VALUES
	(2,'drewbert','901ac0b77bf9eb266afd928db054040e1a20e161e1566f50d0cf16a3bd762329','7de'),
	(31,'drewk2525','1ed2a999a58a19702989f93caa38c44b1718fb96953acc7df846854056f98703','a3e'),
	(32,'drewk125','536eb597a499b6c8c2796a2a78dc710e3c01fef6bd157bb8c31b6163f3224f16','00f');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
