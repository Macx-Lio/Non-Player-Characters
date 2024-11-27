-- ######################################################--
-- EXCHANGE - 999008
-- ######################################################--
SET
@Entry      := 999008,
@Model      := 2299, -- Greedy Kobold
@Name       := "Glittery Jason",
@Title      := "Gems",
@Icon       := "Trade",
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
(@Entry, 818, 0), -- Tigerseye
(@Entry, 1210, 1), -- Shadowgem
(@Entry, 1206, 2), -- Moss Agate
(@Entry, 3864, 3), -- Citrine
(@Entry, 7909, 4), -- Aquamarine
(@Entry, 7910, 5), -- Star Ruby
(@Entry, 12799, 6), -- Large Opal
(@Entry, 12800, 7), -- Azerothian Diamond
(@Entry, 12364, 8), -- Huge Emerald
(@Entry, 23077, 9), -- Blood Granat
(@Entry, 21929, 10), -- Flame Spessarite
(@Entry, 23112, 11), -- Golden Draenite
(@Entry, 23079, 12), -- Deep Peridote
(@Entry, 23117, 13), -- Azure Moonstone
(@Entry, 23107, 14), -- Shadow Draenite
(@Entry, 36917, 15), -- Bloodstone
(@Entry, 36929, 16), -- Huge Citrine
(@Entry, 36920, 17), -- Sun Crystal
(@Entry, 36932, 18), -- Dark Jade
(@Entry, 36923, 19), -- Chalcedony
(@Entry, 36926, 20), -- Shadow Crystal
(@Entry, 41334, 21), -- Earthsiege Diamond
(@Entry, 41266, 22); -- Skyflare Diamond
