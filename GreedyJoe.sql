-- ######################################################--
-- BACKPACKS - 999001
-- ######################################################--
SET
@Entry      := 999001,
@Model      := 2299, -- Greedy Kobold
@Name       := "Greedy Joe",
@Title      := "Backpacks",
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

-- NPC PRICES
UPDATE item_template SET BuyPrice = 160000, SellPrice = 40000 WHERE entry = 21841; -- (16) -- Netherweave Bag
UPDATE item_template SET BuyPrice = 250000, SellPrice = 62500 WHERE entry = 41599; -- (20) -- Frostweave Bag
UPDATE item_template SET BuyPrice = 360000, SellPrice = 90000 WHERE entry = 51809; -- (24) -- Portable Hole
UPDATE item_template SET BuyPrice = 320000, SellPrice = 80000 WHERE entry = 38347; -- (32) -- Mammoth Mining Bag
UPDATE item_template SET BuyPrice = 320000, SellPrice = 80000 WHERE entry = 45773; -- (32) -- Emerald Bag
UPDATE item_template SET BuyPrice = 320000, SellPrice = 80000 WHERE entry = 44446; -- (32) -- Pack of Endless Pockets
UPDATE item_template SET BuyPrice = 320000, SellPrice = 80000 WHERE entry = 41598; -- (32) -- Mysterious Bag
UPDATE item_template SET BuyPrice = 320000, SellPrice = 90000 WHERE entry = 41597; -- (32) -- Abyssal Bag
UPDATE item_template SET BuyPrice = 320000, SellPrice = 90000 WHERE entry = 23775; -- (32) -- Titanium Toolbox
UPDATE item_template SET BuyPrice = 320000, SellPrice = 90000 WHERE entry = 38399; -- (32) -- Trapper's Traveling Pack

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item, slot) VALUES 
(@Entry, 21841, 0), -- (16) -- Netherweave Bag
(@Entry, 41599, 1), -- (20) -- Frostweave Bag
(@Entry, 51809, 2), -- (24) -- Portable Hole
(@Entry, 38347, 3), -- (32) -- Mammoth Mining Bag
(@Entry, 45773, 4), -- (32) -- Emerald Bag
(@Entry, 44446, 5), -- (32) -- Pack of Endless Pockets
(@Entry, 41598, 6), -- (32) -- Mysterious Bag
(@Entry, 41597, 7), -- (32) -- Abyssal Bag
(@Entry, 23775, 8), -- (32) -- Titanium Toolbox
(@Entry, 38399, 9); -- (32) -- Trapper's Traveling Pack
