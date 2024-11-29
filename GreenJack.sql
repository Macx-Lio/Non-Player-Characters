-- ######################################################--
-- EXCHANGE - 999004
-- ######################################################--
SET
@Entry      := 999004,
@Model      := 2299, -- Greedy Kobold
@Name       := "Green Jack",
@Title      := "Herbs",
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
(@Entry, 2447, 0), -- Peacebloom
(@Entry, 765, 1), -- Silverleaf
(@Entry, 2449, 2), -- Earthroot
(@Entry, 785, 3), -- Mageroyal
(@Entry, 2450, 4), -- Briarthorn
(@Entry, 2453, 5), -- Bruisweed
(@Entry, 3355, 6), -- Wild Steelbloom
(@Entry, 3356, 7), -- Kingsblood
(@Entry, 3818, 8), -- Fadeleaf
(@Entry, 3358, 9), -- Khadgar's Whisker
(@Entry, 4625, 10), -- Firebloom
(@Entry, 8838, 11), -- Sungrass
(@Entry, 8846, 12), -- Gromsleaf
(@Entry, 13463, 13), -- Dreamleaf
(@Entry, 13466, 14), -- Pestbloom
(@Entry, 13467, 15), -- Icecap
(@Entry, 22793, 16), -- Mana Thistle
(@Entry, 22794, 17), -- Fel Lotus
(@Entry, 36904, 18), -- Tiger Lily
(@Entry, 36907, 19), -- Talandra's Rose
(@Entry, 36903, 20), -- Adder's Tongue
(@Entry, 36905, 21), -- Lichbloom
(@Entry, 36906, 22); -- Icethron
