-- ######################################################--
-- EXCHANGE - 999009
-- ######################################################--
SET
@Entry      := 999009,
@Model      := 2299, -- Greedy Kobold
@Name       := "Eternal Jerrik",
@Title      := "Essences",
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
(@Entry, 22452, 0), -- Primal Earth
(@Entry, 22457, 1), -- Primal Mana
(@Entry, 21884, 2), -- Primal Fire
(@Entry, 23572, 3), -- Primal Nether
(@Entry, 35623, 4), -- Eternal Air
(@Entry, 35624, 5), -- Eternal Earth
(@Entry, 36860, 6), -- Eternal Fire
(@Entry, 35625, 7), -- Eternal Life
(@Entry, 35627, 8), -- Eternal Shadow
(@Entry, 35622, 9); -- Eternal Water
