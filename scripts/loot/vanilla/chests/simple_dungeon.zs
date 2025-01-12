#modloaded loottweaker

import loottweaker.vanilla.loot.LootTables;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

# variables
  val tool_dam = Functions.setDamage(0.5, 1.0);
  val tool_ench = Functions.parse({"levels": 30, "treasure": true, "function": "enchant_with_levels", "conditions": [{"condition": "random_chance", "chance": 0.2}] } as crafttweaker.data.IData);
  val major_tool_dam = Functions.setDamage(0.01, 0.25);
  val major_tool_ench = Functions.parse({"levels": 39, "treasure": true, "function": "enchant_with_levels"} as crafttweaker.data.IData);
  val cap_funct = Functions.parse({"function": "enderio:set_capacitor"} as crafttweaker.data.IData);
  val steadfast = Functions.parse({"function": "minecraft:set_species_nbt", "speciesUid": "forestry.speciesSteadfast"} as crafttweaker.data.IData);
  val ancient_tome = Functions.parse({"function": "quark:enchant_tome"} as crafttweaker.data.IData);
  val eio_tool1 = Functions.parse({"function": "enderio:set_random_dark_upgrade"} as crafttweaker.data.IData);
  val eio_tool2 = Functions.parse({"function": "enderio:set_random_energy"} as crafttweaker.data.IData);

  val dungeon = LootTables.getTable("minecraft:chests/simple_dungeon");

  ######################
  ### Simple Dungeon ###
  ######################  
/*
    Modify the "simple dungeon" loot table to contain 2-4 types of metal ingots, 1-3 treasure, 1 tool, 1-3 
    mundane items (such as seeds, heart jars, duct tape), and a chance at a miners backpack, steadfast bee,
    magic capacitor, condensed blood, wand upgrade, and a box of eternal closure.
*/
  dungeon.clear();

  # Add 2 to 4 types of ingots
  val dungeon_metal = dungeon.addPool("metal", 2, 4, 0, 0);
  dungeon_metal.addItemEntryHelper(<materialpart:zinc:ingot>,     100, 0, [Functions.setCount(1, 3)], []); # Tin
  dungeon_metal.addItemEntryHelper(<materialpart:tin:ingot>,      100, 0, [Functions.setCount(1, 3)], []); # Zinc
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal>,  100, 0, [Functions.setCount(2, 5)], []); # Copper
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal:0>, 60, 0, [Functions.setCount(1, 5)], []); # copper
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal:1>, 40, 0, [Functions.setCount(1, 3)], []); # aluminum
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal:2>, 20, 0, [Functions.setCount(1, 3)], []); # lead
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal:3>, 30, 0, [Functions.setCount(2, 6)], []); # silver
  dungeon_metal.addItemEntryHelper(<immersiveengineering:metal:4>, 10, 0, [Functions.setCount(2, 6)], []); # nickel
  dungeon_metal.addItemEntryHelper(<minecraft:gold_ingot>,         30, 0, [Functions.setCount(1, 3)], []); # gold
  dungeon_metal.addItemEntryHelper(<minecraft:diamond>,            10, 0, [Functions.setCount(1, 3)], []); # diamond
  dungeon_metal.addItemEntryHelper(<minecraft:emerald>,            20, 0, [Functions.setCount(1, 3)], []); # emerald
  dungeon_metal.addItemEntryHelper(<materialpart:tin:ingot>,       50, 0, [Functions.setCount(1, 3)], []); # tin
  dungeon_metal.addItemEntryHelper(<materialpart:zinc:ingot>,      50, 0, [Functions.setCount(1, 3)], []); # zinc
  dungeon_metal.addItemEntryHelper(<minecraft:redstone>,           50, 0, [Functions.setCount(4, 9)], []); # redstone
  dungeon_metal.addItemEntryHelper(<minecraft:dye:4>,              50, 0, [Functions.setCount(4, 9)], []); # lapis
  dungeon_metal.addItemEntryHelper(<minecraft:coal>,              150, 0, [Functions.setCount(3, 8)], []); # coal
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot>,     15, 0, [Functions.setCount(1, 3)], []); # electrical steel
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot:1>,    5, 0, [Functions.setCount(1, 3)], []); # energetic alloy
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot:2>,    2, 0, [Functions.setCount(1, 3)], []); # vibrant alloy
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot:3>,   20, 0, [Functions.setCount(1, 3)], []); # redstone alloy
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot:4>,   15, 0, [Functions.setCount(1, 3)], []); # conductive iron
  dungeon_metal.addItemEntryHelper(<enderio:item_alloy_ingot:5>,   10, 0, [Functions.setCount(1, 3)], []); # pulsating iron

  # Add 1 to 3 "treasure"
  val dungeon_treasure = dungeon.addPool("treasure", 1, 3, 0, 0);
  dungeon_treasure.addItemEntryHelper(<minecraft:saddle>,             20, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:golden_apple>,       30, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:golden_apple:1>,      4, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:record_13>,          15, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:record_cat>,         15, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:name_tag>,           40, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:golden_horse_armor>, 10, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:iron_horse_armor>,   15, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:diamond_horse_armor>, 5, 0, [], []);
  dungeon_treasure.addItemEntryHelper(<minecraft:book>,               30, 0, [Functions.enchantWithLevels(15, 30, true)], []);
  dungeon_treasure.addItemEntryHelper(<quark:rune>,                   40, 0, [Functions.setMetadata(0,15)], []);
  dungeon_treasure.addItemEntryHelper(<quark:ancient_tome>,           16, 2, [ancient_tome], []);
  dungeon_treasure.addItemEntryHelper(<erebus:silk>,                   6, 0, [Functions.setCount(1, 6)], []);
  dungeon_treasure.addItemEntry(<forestry:broken_bronze_pickaxe>,     20, 0);
  dungeon_treasure.addItemEntry(<forestry:broken_bronze_shovel>,      40, 0);
  dungeon_treasure.addItemEntry(<forestry:kit_pickaxe>,               10, 0);
  dungeon_treasure.addItemEntry(<forestry:kit_shovel>,                20, 0);
  dungeon_treasure.addItemEntry(<randomthings:spectrecoil_number>,     5, 0);
  dungeon_treasure.addItemEntry(<randomthings:timeinabottle>,          5, 0);
  dungeon_treasure.addItemEntry(<randomthings:weatheregg>,             5, 0);
  dungeon_treasure.addItemEntry(<randomthings:weatheregg:1>,           5, 0);
  dungeon_treasure.addItemEntry(<randomthings:weatheregg:2>,           5, 0);
  dungeon_treasure.addItemEntry(<randomthings:magichood>,              5, 0);
  dungeon_treasure.addItemEntry(<randomthings:escaperope>,             5, 0);
  dungeon_treasure.addItemEntry(<pyrotech:sawmill_blade_gold>.withTag({Unbreakable:1, display:{Name:"Philosopher's Gold Sawblade"}}), 2, 0);
  dungeon_treasure.addItemEntry(<pyrotech:cog_gold>.withTag({Unbreakable:1, display:{Name:"Philosopher's Gold Cog"}}), 15, 0);

  # Add 1 "tool"
  val dungeon_tool = dungeon.addPool("tool", 1, 1, 0, 0);
  dungeon_tool.addItemEntryHelper(<pyrotech:flint_sword>,              400, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<pyrotech:flint_pickaxe>,               400, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<pyrotech:flint_axe>,            400, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<pyrotech:flint_hoe>,                320, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<pyrotech:flint_shovel>,              800, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<artisanworktables:artisans_handsaw_flint>,        400, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:diamond_knife>,                     20, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_shovel>,                         20, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_axe>,                            20, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_hoe>,                            20, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_pickaxe>,                        40, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<artisanworktables:artisans_handsaw_diamond>,       20, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<appliedenergistics2:nether_quartz_cutting_knife>, 160, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<appliedenergistics2:nether_quartz_spade>,         160, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<appliedenergistics2:nether_quartz_axe>,           160, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<appliedenergistics2:nether_quartz_hoe>,           120, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<appliedenergistics2:nether_quartz_pickaxe>,       320, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<artisanworktables:artisans_handsaw_copper>,       240, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<artisanworktables:artisans_handsaw_iron>,         160, 0, [tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:fishing_rod>,                           700, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_helmet>,                   30, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_chestplate>,               30, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_leggings>,                 30, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<minecraft:diamond_boots>,                    30, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:golden_ring>,                       40, 0, [tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_hammer_leap>,                10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_hammer_smash>,               10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_cutlass_riposte>,            10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_cutlass_pierce>,             10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_knife_multistrike>,          10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_knife_smokebomb>,            10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_cestus_roar>,                10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:master_cestus_pummel>,              10, 0, [major_tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:high_striker>,                      10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:wackerjab>,                         10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:taser>,                             10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:claws>,                             10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:lithen_scythe>,                     10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:pirate_hook>,                       10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:coin_cannon>,                       10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:backfire_cannon>,                   10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:hot_potatoe>,                       10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<dungeontactics:boots_of_blinding_speed>,           10, 0, [major_tool_dam, tool_ench], []);
  dungeon_tool.addItemEntry(<dungeontactics:fire_water>,          10, 0);
  dungeon_tool.addItemEntry(<dungeontactics:icarus_ring>,         10, 0);
  dungeon_tool.addItemEntry(<minecraft:bucket>,                  700, 0);
  dungeon_tool.addItemEntry(<randomthings:enderbucket>,          120, 0);
  dungeon_tool.addItemEntry(<randomthings:reinforcedenderbucket>, 40, 0);
  dungeon_tool.addItemEntry(<minecraft:flint_and_steel>,         700, 0);
  dungeon_tool.addItemEntry(<enderio:item_yeta_wrench>,          300, 0);
  dungeon_tool.addItemEntry(<enderio:item_conduit_probe>,        200, 0);
  dungeon_tool.addItemEntry(<ebwizardry:magic_wand>,             400, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_earth_wand>,       100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_fire_wand>,        100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_healing_wand>,     100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_ice_wand>,         100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_lightning_wand>,   100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_necromancy_wand>,  100, 0);
  dungeon_tool.addItemEntry(<ebwizardry:novice_sorcery_wand>,     100, 0);
  dungeon_tool.addItemEntry(<evilcraft:blood_extractor>,         400, 0);
  dungeon_tool.addItemEntry(<evilcraft:blood_extractor>.withTag({"capacity": 144000}), 150, 0);
  dungeon_tool.addItemEntry(<thaumcraft:scribing_tools>,         400, 0);
  dungeon_tool.addItemEntry(<evilcraft:veined_scribing_tools>,   100, 0);
  dungeon_tool.addItemEntry(<naturescompass:naturescompass>,     800, 0);
  dungeon_tool.addItemEntry(<botania:sextant>,                   400, 0);
  dungeon_tool.addItemEntry(<chisel:chisel_iron>,                700, 0);
  dungeon_tool.addItemEntry(<chisel:chisel_diamond>,             200, 0);
  dungeon_tool.addItemEntry(<chisel:chisel_hitech>,               60, 0);
  dungeon_tool.addItemEntryHelper(<enderio:item_dark_steel_sword>, 4, 0, [eio_tool1, eio_tool2, tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<enderio:item_dark_steel_boots>, 5, 0, [eio_tool1, eio_tool2, tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<enderio:item_dark_steel_axe>,   5, 0, [eio_tool1, eio_tool2, tool_dam, tool_ench], []);
  dungeon_tool.addItemEntryHelper(<enderio:item_dark_steel_bow>,   2, 0, [eio_tool1, eio_tool2, tool_dam, tool_ench], []);

  # Add 1 to 3 mundane items
  val dungeon_mundane = dungeon.addPool("mundane", 1, 3, 0, 0);
    dungeon_mundane.addItemEntryHelper(<minecraft:bone>,          10, 0, [Functions.setCount(1, 8)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:gunpowder>,     10, 0, [Functions.setCount(1, 8)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:rotten_flesh>,  10, 0, [Functions.setCount(1, 8)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:string>,        10, 0, [Functions.setCount(1, 8)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:ender_pearl>,    5, 0, [Functions.setCount(1, 2)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:melon_seeds>,   10, 0, [Functions.setCount(2, 4)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:pumpkin_seeds>, 10, 0, [Functions.setCount(2, 4)], []);
    dungeon_mundane.addItemEntryHelper(<minecraft:beetroot_seeds>,10, 0, [Functions.setCount(2, 4)], []);
    dungeon_mundane.addItemEntry(<dungeontactics:ducttape>,        3, 0);
    dungeon_mundane.addItemEntry(<dungeontactics:magic_tether>,    3, 0);
    dungeon_mundane.addItemEntryHelper(<dungeontactics:heart_jar>, 3, 0, [Functions.setCount(2, 4)], []);
    dungeon_mundane.addItemEntryHelper(<randomthings:beans>,       8, 0, [Functions.setCount(3, 8)], []);

  val dungeon_upgrade = dungeon.addPool("upgrade", 1, 1, 0, 0);
  dungeon_upgrade.addConditionsHelper([Conditions.randomChance(0.25)]);
    dungeon_upgrade.addItemEntry(<ebwizardry:armour_upgrade>,     10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:attunement_upgrade>, 10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:blast_upgrade>,      10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:condenser_upgrade>,  10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:cooldown_upgrade>,   10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:duration_upgrade>,   10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:range_upgrade>,      10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:siphon_upgrade>,     10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:storage_upgrade>,    10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:arcane_tome:1>,      10, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:arcane_tome:2>,       3, 0);
    dungeon_upgrade.addItemEntry(<ebwizardry:arcane_tome:3>,       1, 0);

  # Add a chance to get various materials.
  dungeon.addPool("lava_charm", 1, 1, 0, 0).addItemEntryHelper(<randomthings:lavacharm>, 1, 0, [], [Conditions.randomChance(0.01)]);
  dungeon.addPool("water_walking", 1, 1, 0, 0).addItemEntryHelper(<randomthings:waterwalkingboots>, 1, 0, [], [Conditions.randomChance(0.01)]);
  dungeon.addPool("forestry_bag", 1, 1, 0, 0).addItemEntryHelper(<forestry:miner_bag>, 1, 0, [], [Conditions.randomChance(0.05)]);
  dungeon.addPool("forestry_bee", 1, 1, 0, 0).addItemEntryHelper(<forestry:bee_drone_ge>, 1, 0, [steadfast], [Conditions.randomChance(0.10)]);
  dungeon.addPool("capacitor", 1, 3, 0, 0).addItemEntryHelper(<enderio:item_basic_capacitor>, 1, 0, [Functions.setMetadata(3, 4), cap_funct], [Conditions.randomChance(0.25)]);
  dungeon.addPool("blood", 1, 1, 0, 0).addItemEntryHelper(<evilcraft:condensed_blood>, 1, 0, [Functions.setCount(1, 32)], [Conditions.randomChance(0.25)]);
  dungeon.addPool("closure_box", 1, 1, 0, 0).addLootTableEntry("evilcraft:inject/chests/box_of_eternal_closure", 1);
  dungeon.addPool("overgrowth", 1, 1, 0, 0).addItemEntryHelper(<botania:overgrowthseed>, 1, 0, [], [Conditions.randomChance(0.05)]);
  dungeon.addPool("lotus", 1, 1, 0, 0).addItemEntryHelper(<botania:blacklotus>, 1, 0, [], [Conditions.randomChance(0.35)]);
  dungeon.addPool("astral_dia", 1, 1, 0, 0).addItemEntryHelper(<ebwizardry:astral_diamond>, 1, 0, [], [Conditions.randomChance(0.02)]);
