-- ######################################################--
-- EXCHANGE - 999003
-- ######################################################--
SET
@Entry      := 999003,
@Model      := 2299, -- Greedy Kobold
@Name       := "Tricky John",
@Title      := "Exchange",
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
@AIName     := "",
@Script     := "";

-- NPC
DELETE FROM `creature_template` WHERE `entry` = @Entry;
INSERT INTO `creature_template` (`entry`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `unit_class`, `unit_flags`, `type`, `type_flags`, `RegenHealth`, `flags_extra`, `AiName`, `ScriptName`) VALUES
(@Entry, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, 1, @Rank, 1, 2, @Type, @TypeFlags, 1, @FlagsExtra, @AIName, @Script);

DELETE FROM `creature_template_model` WHERE `CreatureID` = @Entry;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`) VALUES
(@Entry, 0, @Model, @Scale, 1);

-- NPC ITEMS
UPDATE item_template SET `BuyCount`= 10 WHERE entry = 49426;
UPDATE item_template SET `BuyCount`= 30 WHERE entry = 43228;

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (`entry`, `item`, `slot`, `extendedcost`) VALUES 
(@Entry, 40752, 0, 2589), -- Emblem of Herosim
(@Entry, 40753, 1, 2637), -- Emblem of Valor
(@Entry, 45624, 2, 2707), -- Emblem of Conquest
(@Entry, 47241, 3, 2743), -- Emblem of Triumph
(@Entry, 49426, 4, 2546), -- Emblem of Frost
(@Entry, 43228, 5, 2484); -- Stone Keepers Shard
