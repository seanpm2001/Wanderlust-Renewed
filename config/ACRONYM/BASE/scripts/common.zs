import com.acronym.base.IMaterialType;

    var abyssalnite = mods.base.Materials.getOrRegister("abyssalnite",  1,  8324199, false);
    var adamantine  = mods.base.Materials.getOrRegister("adamantine",   2,  9845820, false);
    var aluminum    = mods.base.Materials.getOrRegister("aluminum",     3, 11383485, false);
    var aquarium    = mods.base.Materials.getOrRegister("aquarium",     4,  3305205, false);
    var ardite      = mods.base.Materials.getOrRegister("ardite",       5, 16739840, false);
    var brass       = mods.base.Materials.getOrRegister("brass",        6, 11904578, false);
    var bronze      = mods.base.Materials.getOrRegister("bronze",       7, 13467442, false);
    var cobalt      = mods.base.Materials.getOrRegister("cobalt",       8,    18347, false);
    var coldiron    = mods.base.Materials.getOrRegister("coldiron",     9, 13421823, false);
    var copper      = mods.base.Materials.getOrRegister("copper",      10, 13137203, false);
    var coralium    = mods.base.Materials.getOrRegister("coralium",    11,   683580, false);
    var cupronickel = mods.base.Materials.getOrRegister("cupronickel", 12, 14129986, false);
    var dilithium   = mods.base.Materials.getOrRegister("dilithium",   13, 16751515, false);
    var dreadium    = mods.base.Materials.getOrRegister("dreadium",    14,  8847360, false);
    var electrum    = mods.base.Materials.getOrRegister("electrum",    15,  9602857, false);
    var gold        = mods.base.Materials.getOrRegister("gold",        16, 16766720, false);
    var invar       = mods.base.Materials.getOrRegister("invar",       17, 13421708, false);
    var iridium     = mods.base.Materials.getOrRegister("iridium",     18, 16777185, false);
    var iron        = mods.base.Materials.getOrRegister("iron",        19, 15132648, false);
    var lead        = mods.base.Materials.getOrRegister("lead",        20,  3947580, false);
    var mithril     = mods.base.Materials.getOrRegister("mithril",     21, 10079487, false);
    var nickel      = mods.base.Materials.getOrRegister("nickel",      22, 12105910, false);
    var platinum    = mods.base.Materials.getOrRegister("platinum",    23, 15066338, false);
    var silver      = mods.base.Materials.getOrRegister("silver",      24, 12632256, false);
    var starsteel   = mods.base.Materials.getOrRegister("starsteel",   25,  3289650,  true);
    var steel       = mods.base.Materials.getOrRegister("steel",       26,  4408907, false);
    var tin         = mods.base.Materials.getOrRegister("tin",         27,  8355711, false);
    var titanium    = mods.base.Materials.getOrRegister("titanium",    28, 11972521, false);
    var uranium     = mods.base.Materials.getOrRegister("uranium",     29,  7772956, false);
    var zinc        = mods.base.Materials.getOrRegister("zinc",        30, 12240072, false);

var metal_list = [abyssalnite, adamantine, aluminum, aquarium, ardite, brass, bronze, cobalt, coldiron,
    copper, coralium, cupronickel, dilithium, dreadium, electrum, gold, invar, iridium, iron, lead,
    mithril, nickel, platinum, silver, starsteel, steel, tin, titanium, uranium, zinc];

# Register dusts
    for i, metal in metal_list {
        metal.registerDust();
    }
