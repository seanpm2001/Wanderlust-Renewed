#modloaded loottweaker twilightforest

import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

# variables
  val tool_dam = Functions.setDamage(0.5, 1.0);
  val tool_ench = Functions.parse({"levels": 30, "treasure": true, "function": "enchant_with_levels"} as crafttweaker.data.IData);
  val steadfast = Functions.parse({"function": "minecraft:set_species_nbt", "speciesUid": "forestry.speciesSteadfast"} as crafttweaker.data.IData);
  val ancient_tome = Functions.parse({"function": "quark:enchant_tome"} as crafttweaker.data.IData);
  val eb_any = Functions.parse({"function": "ebwizardry:random_spell"} as crafttweaker.data.IData);
#  val eb_h_any = Functions.parse({"function": "ebwizardry:random_spell", "elements":["healing"]} as crafttweaker.data.IData);
  val eb_novice = Functions.parse({"function": "ebwizardry:random_spell", "tiers":["novice"]} as crafttweaker.data.IData);
  val eb_apprentice = Functions.parse({"function": "ebwizardry:random_spell", "tiers":["apprentice"]} as crafttweaker.data.IData);
  val eb_advanced = Functions.parse({"function": "ebwizardry:random_spell", "tiers":["advanced"]} as crafttweaker.data.IData);
  val eb_master = Functions.parse({"function": "ebwizardry:random_spell", "tiers":["master"]} as crafttweaker.data.IData);
#  val eb_h_novice = Functions.parse({"function": "ebwizardry:random_spell", "elements":["healing"], "tiers":["novice"]} as crafttweaker.data.IData);
#  val eb_h_apprentice = Functions.parse({"function": "ebwizardry:random_spell", "elements":["healing"], "tiers":["apprentice"]} as crafttweaker.data.IData);
#  val eb_h_advanced = Functions.parse({"function": "ebwizardry:random_spell", "elements":["healing"], "tiers":["advanced"]} as crafttweaker.data.IData);
#  val eb_h_master = Functions.parse({"function": "ebwizardry:random_spell", "elements":["healing"], "tiers":["master"]} as crafttweaker.data.IData);

  val tf_aurora_cache = LootTables.getTable("twilightforest:structures/aurora_cache/aurora_cache");

  ############################################
  ### Twilight Forest: Aurora Palace Cache ###
  ############################################
/*
    Modify the twilight forest aurora cache table to contain...
*/
  tf_aurora_cache.clear();

  val tf_common = tf_aurora_cache.addPool("common", 3, 7, 0, 0);
  tf_common.addItemEntryHelper(<minecraft:gunpowder>,               30, 0, [Functions.setCount(1, 4)], []);
  tf_common.addItemEntryHelper(<minecraft:coal>,                    30, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<minecraft:ice>,                     30, 0, [Functions.setCount(1, 6)], []);
  tf_common.addItemEntryHelper(<minecraft:packed_ice>,              30, 0, [Functions.setCount(1, 6)], []);
  tf_common.addItemEntryHelper(<minecraft:redstone>,                30, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<minecraft:glowstone_dust>,          30, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<materialpart:brass:ingot>,          30, 0, [Functions.setCount(1, 9)], []);
  tf_common.addItemEntryHelper(<materialpart:bronze:ingot>,         30, 0, [Functions.setCount(1, 9)], []);
  tf_common.addItemEntryHelper(<materialpart:tin:ingot>,            30, 0, [Functions.setCount(1, 9)], []);
  tf_common.addItemEntryHelper(<materialpart:zinc:ingot>,           30, 0, [Functions.setCount(1, 9)], []);
  tf_common.addItemEntryHelper(<immersiveengineering:metal:0>,      30, 0, [Functions.setCount(1, 6)], []); # Copper
  tf_common.addItemEntryHelper(<immersiveengineering:metal:3>,      30, 0, [Functions.setCount(1, 6)], []); # Silver
  tf_common.addItemEntryHelper(<twilightforest:maze_wafer>,         30, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<twilightforest:ironwood_ingot>,     30, 0, [Functions.setCount(1, 9)], []);
  // tf_common.addItemEntryHelper(<primal:arrow_ironwood>,             30, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<ebwizardry:identification_scroll>,  30, 0, [Functions.setCount(1, 4)], []);
  tf_common.addItemEntryHelper(<ebwizardry:scroll>,                 30, 0, [eb_any], []);
#  tf_common.addItemEntryHelper(<ebwizardry:scroll>,                 30, 0, [eb_h_any], []);

  val tf_uncommon = tf_aurora_cache.addPool("uncommon", 2, 4, 0, 0);
  tf_common.addItemEntryHelper(<twilightforest:aurora_block>,          300, 0, [Functions.setCount(1,12)], []);
  tf_common.addItemEntryHelper(<twilightforest:firefly>,               300, 0, [Functions.setCount(1, 6)], []);
  tf_common.addItemEntryHelper(<twilightforest:charm_of_keeping_1>,    300, 0, [Functions.setCount(1, 3)], []);
  tf_common.addItemEntryHelper(<twilightforest:ironwood_ingot>,        300, 0, [Functions.setCount(1, 6)], []);
  tf_common.addItemEntryHelper(<twilightforest:arctic_fur>,            300, 0, [Functions.setCount(1, 3)], []);
  tf_uncommon.addItemEntryHelper(<ebwizardry:spell_book>,              180, 0, [eb_novice], []);     # 15 novice spells
  tf_uncommon.addItemEntryHelper(<ebwizardry:spell_book>,               90, 0, [eb_apprentice], []); # 45 apprentice spells
  tf_uncommon.addItemEntryHelper(<ebwizardry:spell_book>,               30, 0, [eb_advanced], []);   # 55 advanced spells
#  tf_uncommon.addItemEntryHelper(<ebwizardry:spell_book>,              180, 0, [eb_h_novice], []);
#  tf_uncommon.addItemEntryHelper(<ebwizardry:spell_book>,               90, 0, [eb_h_apprentice], []);

  val tf_rare = tf_aurora_cache.addPool("rare", 1, 1, 0, 0);
  tf_rare.addItemEntryHelper(<twilightforest:charm_of_life_1>, 32, 0, [Functions.setCount(1, 2)], []);
  tf_rare.addItemEntryHelper(<twilightforest:arctic_fur>,      32, 0, [Functions.setCount(1, 8)], []);
  tf_rare.addItemEntryHelper(<twilightforest:ice_bow>,         32, 0, [tool_dam, tool_ench], []);
  tf_rare.addItemEntryHelper(<twilightforest:ender_bow>,       32, 0, [tool_dam, tool_ench], []);
  tf_rare.addItemEntryHelper(<twilightforest:ice_sword>,       32, 0, [tool_dam, tool_ench], []);
  tf_rare.addItemEntry(<ebwizardry:arcane_tome:2>,             12, 0);
  tf_rare.addItemEntry(<ebwizardry:arcane_tome:3>,              1, 0);

  ### If you adjust the weights or add items, increase the weight of the empty entry. ###
  ### The goal is to keep the chance of an ultrarare item at 25%                      ###
  val tf_ultrarare = tf_aurora_cache.addPool("ultrarare", 1, 1, 0, 0);
  tf_rare.addItemEntry(<ebwizardry:attunement_upgrade>,         4, 0);
  tf_rare.addItemEntry(<ebwizardry:blast_upgrade>,              4, 0);
  tf_rare.addItemEntry(<ebwizardry:condenser_upgrade>,          4, 0);
  tf_rare.addItemEntry(<ebwizardry:cooldown_upgrade>,           4, 0);
  tf_rare.addItemEntry(<ebwizardry:duration_upgrade>,           4, 0);
  tf_rare.addItemEntry(<ebwizardry:range_upgrade>,              4, 0);
  tf_rare.addItemEntry(<ebwizardry:siphon_upgrade>,             4, 0);
  tf_rare.addItemEntry(<ebwizardry:storage_upgrade>,            4, 0);
  tf_ultrarare.addItemEntryHelper(<minecraft:enchanted_book>,   5, 0,
    [Functions.setNBT(<enchantment:minecraft:power>.makeEnchantment(5).makeTag())], []);
  tf_ultrarare.addItemEntryHelper(<minecraft:enchanted_book>,   5, 0,
    [Functions.setNBT(<enchantment:minecraft:sharpness>.makeEnchantment(5).makeTag())], []);
  tf_ultrarare.addItemEntryHelper(<minecraft:enchanted_book>,   5, 0,
    [Functions.setNBT(<enchantment:minecraft:punch>.makeEnchantment(2).makeTag())], []);
  tf_ultrarare.addItemEntryHelper(<minecraft:enchanted_book>,   5, 0,
    [Functions.setNBT(<enchantment:minecraft:unbreaking>.makeEnchantment(3).makeTag())], []);
  tf_ultrarare.addItemEntryHelper(<minecraft:enchanted_book>,   5, 0,
    [Functions.setNBT(<enchantment:minecraft:infinity>.makeEnchantment(1).makeTag())], []);
  tf_ultrarare.addItemEntry(<ebwizardry:armour_upgrade>,        1, 0);
  tf_ultrarare.addItemEntryHelper(<ebwizardry:spell_book>,      1, 0, [eb_master], []);
#  tf_ultrarare.addItemEntryHelper(<ebwizardry:spell_book>,      1, 0, [eb_h_advanced], []);
  tf_ultrarare.addEmptyEntry(561, 0);

  # Add a chance to get various materials. These used to never spawn in the TF.
  tf_aurora_cache.addPool("forestry_bag", 1, 1, 0, 0).addItemEntryHelper(<forestry:adventurer_bag>, 1, 0, [], [Conditions.randomChance(0.05)]);
  tf_aurora_cache.addPool("forestry_bee", 1, 1, 0, 0).addItemEntryHelper(<forestry:bee_drone_ge>, 1, 0, [steadfast], [Conditions.randomChance(0.10)]);
  tf_aurora_cache.addPool("blood", 1, 1, 0, 0).addItemEntryHelper(<evilcraft:condensed_blood>, 1, 0, [Functions.setCount(1, 32)], [Conditions.randomChance(0.25)]);
  tf_aurora_cache.addPool("closure_box", 1, 1, 0, 0).addLootTableEntry("evilcraft:inject/chests/box_of_eternal_closure", 1);
  tf_aurora_cache.addPool("overgrowth", 1, 1, 0, 0).addItemEntryHelper(<botania:overgrowthseed>, 1, 0, [], [Conditions.randomChance(0.05)]);
  tf_aurora_cache.addPool("lotus", 1, 1, 0, 0).addItemEntryHelper(<botania:blacklotus>, 1, 0, [], [Conditions.randomChance(0.35)]);
  tf_aurora_cache.addPool("tome", 1, 1, 0, 0).addItemEntryHelper(<quark:ancient_tome>, 1, 0, [ancient_tome], [Conditions.randomChance(0.05)]);
