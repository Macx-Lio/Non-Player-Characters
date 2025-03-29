-- ######################################################--
-- EXCHANGE - 999006
-- ######################################################--
SET
@Entry      := 999006,
@Model      := 2299, -- Greedy Kobold
@Name       := "Creapy Jaden",
@Title      := "Skins",
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

-- ITEM PRICES
UPDATE item_template SET BuyPrice = 1000 WHERE entry = 2318;

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (`entry`, `item`, `slot`) VALUES 
(@Entry, 2934, 0), -- Ruined Leather Scraps
(@Entry, 2318, 1), -- Light Leather
(@Entry, 2319, 2), -- Medium Leather
(@Entry, 4236, 3), -- Heavy Hide
(@Entry, 4234, 4), -- Heavy Leather
(@Entry, 4304, 5), -- Thick Leather
(@Entry, 8170, 6), -- Rugged Leather
(@Entry, 21887, 7), -- Knothide Leather
(@Entry, 33568, 8); -- Borean Leather
