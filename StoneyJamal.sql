-- ######################################################--
-- EXCHANGE - 999007
-- ######################################################--
SET
@Entry      := 999007,
@Model      := 2299, -- Greedy Kobold
@Name       := "Stoney Jamal",
@Title      := "Ore",
@Icon       := "Buy",
@GossipMenu := 0, -- Does not need any Gossip
@MinLevel   := 80,
@MaxLevel   := 80,
@Faction    := 35,
@NPCFlag    := 128,
@Scale      := 1.0,
@Rank       := 0,
@Type       := 7,
@TypeFlags  := 0,
@FlagsExtra := 2,
@AIName     := "SmartAI",
@Script     := "";

-- NPC
DELETE FROM `creature_template` WHERE `entry` = @Entry;
INSERT INTO `creature_template` (`entry`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`, `RegenHealth`, `flags_extra`, `AiName`, `ScriptName`) VALUES
(@Entry, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, 1, @Rank, 1, 2, @Type, @TypeFlags, 1, @FlagsExtra, @AIName, @Script);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @Entry;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(@Entry, 0, @Model, @Scale, 1);

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (`entry`, `item`, `slot`) VALUES 
(@Entry, 2770, 0), -- Copper Ore
(@Entry, 2771, 1), -- Tin Ore
(@Entry, 2775, 2), -- Silver Ore
(@Entry, 2772, 3), -- Iron Ore
(@Entry, 2776, 4), -- Gold Ore
(@Entry, 3858, 5), -- Mithril Ore
(@Entry, 7911, 6), -- Truesilver Ore
(@Entry, 10620, 7), -- Thorium Ore
(@Entry, 23424, 8), -- Fel Iron Ore
(@Entry, 23425, 9), -- Adamantite Ore
(@Entry, 36909, 10), -- Cobalt Ore
(@Entry, 36912, 11), -- Saronite Ore
(@Entry, 2835, 12), -- Rough Stone
(@Entry, 2836, 13), -- Coarse Stone
(@Entry, 2838, 14), -- Heavy Stone
(@Entry, 7912, 15); -- Solid Stone
