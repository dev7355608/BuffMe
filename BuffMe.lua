local UnitExists = UnitExists
local GetUnitName = GetUnitName
local UnitInRaid = UnitInRaid
local UnitIsPlayer = UnitIsPlayer
local UnitIsUnit = UnitIsUnit
local UnitBuff = UnitBuff
local UnitClass = UnitClass
local UnitCanAssist = UnitCanAssist
local GetTime = GetTime
local GetRaidRosterInfo = GetRaidRosterInfo
local GetNormalizedRealmName = GetNormalizedRealmName
local GetSpellInfo = GetSpellInfo
local Ambiguate = Ambiguate
local C_Timer = C_Timer
local C_ChatInfo = C_ChatInfo
local format = format
local strlower = strlower
local strtrim = strtrim
local strsplit = strsplit
local strmatch = strmatch
local gsub = gsub
local tinsert = tinsert
local tremove = tremove
local tContains = tContains
local wipe = wipe
local sort = sort
local unpack = unpack
local max = max

local ChatTypeInfo = ChatTypeInfo
local GROUP_NUMBER = GROUP_NUMBER
local TOOLTIP_TALENT_RANK_CURRENT_ONLY = TOOLTIP_TALENT_RANK_CURRENT_ONLY
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local LibGetFrame = LibStub("LibGetFrame-1.0")
local LibCustomGlow = LibStub("LibCustomGlow-1.0")
local LibClassicDurations

local NAMES = {
    [11549] = "Battle Shout",
    [27681] = "Prayer of Spirit",
    [6066] = "Power Word: Shield",
    [10595] = "Nature Resistance Totem",
    [6074] = "Renew",
    [6076] = "Renew",
    [6078] = "Renew",
    [10611] = "Windfury Totem Effect",
    [27841] = "Divine Spirit",
    [10627] = "Grace of Air Totem",
    [8146] = "Tremor Totem Effect",
    [10156] = "Arcane Intellect",
    [5599] = "Blessing of Protection",
    [8156] = "Stoneskin",
    [8160] = "Strength of Earth Totem",
    [8162] = "Strength of Earth",
    [8166] = "Poison Cleansing Totem",
    [8168] = "Poison Cleansing Totem Effect",
    [8170] = "Disease Cleansing Totem",
    [8178] = "Grounding Totem Effect",
    [20911] = "Blessing of Sanctuary",
    [8184] = "Fire Resistance Totem",
    [643] = "Devotion Aura",
    [1032] = "Devotion Aura",
    [19977] = "Blessing of Light",
    [6673] = "Battle Shout",
    [774] = "Rejuvenation",
    [19506] = "Trueshot Aura",
    [10292] = "Devotion Aura",
    [10300] = "Retribution Aura",
    [5675] = "Mana Spring Totem",
    [5677] = "Mana Spring",
    [6192] = "Battle Shout",
    [131] = "Water Breathing",
    [1044] = "Blessing of Freedom",
    [25782] = "Greater Blessing of Might",
    [5697] = "Unending Breath",
    [8835] = "Grace of Air Totem",
    [2090] = "Rejuvenation",
    [2091] = "Rejuvenation",
    [20217] = "Blessing of Kings",
    [3627] = "Rejuvenation",
    [20752] = "Create Soulstone (Lesser)",
    [25359] = "Grace of Air Totem",
    [19746] = "Concentration Aura",
    [782] = "Thorns",
    [25894] = "Greater Blessing of Wisdom",
    [10927] = "Renew",
    [25918] = "Greater Blessing of Wisdom",
    [19834] = "Blessing of Might",
    [19850] = "Blessing of Wisdom",
    [1058] = "Rejuvenation",
    [5242] = "Battle Shout",
    [8939] = "Regrowth",
    [10476] = "Frost Resistance",
    [17359] = "Mana Tide Totem",
    [10496] = "Mana Spring Totem",
    [23028] = "Arcane Brilliance",
    [15111] = "Windwall Totem",
    [19978] = "Blessing of Light",
    [11550] = "Battle Shout",
    [27683] = "Prayer of Shadow Protection",
    [8512] = "Windfury Totem",
    [1075] = "Thorns",
    [10600] = "Nature Resistance Totem",
    [17] = "Power Word: Shield",
    [6346] = "Fear Ward",
    [20729] = "Blessing of Sacrifice",
    [25360] = "Grace of Air",
    [14752] = "Divine Spirit",
    [10157] = "Arcane Intellect",
    [10169] = "Amplify Magic",
    [10173] = "Dampen Magic",
    [19835] = "Blessing of Might",
    [465] = "Devotion Aura",
    [20905] = "Trueshot Aura",
    [20913] = "Blessing of Sanctuary",
    [19899] = "Fire Resistance Aura",
    [17360] = "Mana Tide",
    [11766] = "Blood Pact",
    [19979] = "Blessing of Light",
    [467] = "Thorns",
    [10293] = "Devotion Aura",
    [10301] = "Retribution Aura",
    [139] = "Renew",
    [3747] = "Power Word: Shield",
    [25289] = "Battle Shout",
    [9858] = "Regrowth",
    [10900] = "Power Word: Shield",
    [25361] = "Strength of Earth Totem",
    [24858] = "Moonkin Form",
    [10405] = "Stoneskin",
    [10928] = "Renew",
    [9910] = "Thorns",
    [15036] = "Flametongue Totem Effect",
    [10441] = "Strength of Earth",
    [19836] = "Blessing of Might",
    [19852] = "Blessing of Wisdom",
    [10461] = "Healing Stream",
    [19876] = "Shadow Resistance Aura",
    [8936] = "Regrowth",
    [8940] = "Regrowth",
    [10477] = "Frost Resistance",
    [10493] = "Mana Spring",
    [10497] = "Mana Spring Totem",
    [8071] = "Stoneskin Totem",
    [16387] = "Flametongue Totem",
    [15112] = "Windwall Totem",
    [10521] = "Flametongue Totem Effect",
    [11551] = "Battle Shout",
    [10537] = "Fire Resistance Totem",
    [16190] = "Mana Tide Totem",
    [6065] = "Power Word: Shield",
    [6075] = "Renew",
    [6077] = "Renew",
    [10613] = "Windfury Totem",
    [25290] = "Blessing of Wisdom",
    [2791] = "Power Word: Fortitude",
    [20707] = "Soulstone Resurrection",
    [8143] = "Tremor Totem",
    [25362] = "Strength of Earth",
    [8155] = "Stoneskin Totem",
    [8157] = "Stoneskin",
    [10170] = "Amplify Magic",
    [10174] = "Dampen Magic",
    [8163] = "Strength of Earth",
    [19837] = "Blessing of Might",
    [8171] = "Disease Cleansing Totem Effect",
    [19853] = "Blessing of Wisdom",
    [8177] = "Grounding Totem",
    [11743] = "Detect Greater Invisibility",
    [8181] = "Frost Resistance Totem",
    [8185] = "Fire Resistance",
    [17354] = "Mana Tide Totem",
    [11767] = "Blood Pact",
    [8230] = "Flametongue Totem Effect",
    [10278] = "Blessing of Protection",
    [10290] = "Devotion Aura",
    [8250] = "Flametongue Totem Effect",
    [10298] = "Retribution Aura",
    [5672] = "Healing Stream",
    [9839] = "Rejuvenation",
    [25291] = "Blessing of Might",
    [25299] = "Rejuvenation",
    [1430] = "Rejuvenation",
    [25315] = "Renew",
    [10901] = "Power Word: Shield",
    [20756] = "Create Soulstone (Greater)",
    [19742] = "Blessing of Wisdom",
    [25890] = "Greater Blessing of Light",
    [25898] = "Greater Blessing of Kings",
    [10929] = "Renew",
    [10937] = "Power Word: Fortitude",
    [592] = "Power Word: Shield",
    [976] = "Shadow Protection",
    [19838] = "Blessing of Might",
    [19854] = "Blessing of Wisdom",
    [10462] = "Healing Stream Totem",
    [8941] = "Regrowth",
    [10478] = "Frost Resistance Totem",
    [7804] = "Blood Pact",
    [8450] = "Dampen Magic",
    [15109] = "Windwall",
    [10526] = "Flametongue Totem",
    [10534] = "Fire Resistance",
    [10538] = "Fire Resistance Totem",
    [6307] = "Blood Pact",
    [600] = "Power Word: Shield",
    [16191] = "Mana Tide",
    [10598] = "Nature Resistance",
    [1459] = "Arcane Intellect",
    [1460] = "Arcane Intellect",
    [10614] = "Windfury Totem",
    [1461] = "Arcane Intellect",
    [604] = "Dampen Magic",
    [10626] = "Grace of Air",
    [20757] = "Create Soulstone (Major)",
    [20765] = "Soulstone Resurrection",
    [25899] = "Greater Blessing of Sanctuary",
    [6371] = "Healing Stream",
    [6375] = "Healing Stream Totem",
    [6377] = "Healing Stream Totem",
    [8514] = "Windfury Totem Effect",
    [19900] = "Fire Resistance Aura",
    [1022] = "Blessing of Protection",
    [6372] = "Healing Stream",
    [10599] = "Nature Resistance",
    [20906] = "Trueshot Aura",
    [19898] = "Frost Resistance Aura",
    [7805] = "Blood Pact",
    [14818] = "Divine Spirit",
    [10495] = "Mana Spring Totem",
    [5394] = "Healing Stream Totem",
    [1038] = "Blessing of Salvation",
    [10460] = "Healing Stream",
    [9750] = "Regrowth",
    [15107] = "Windwall Totem",
    [10535] = "Fire Resistance",
    [20755] = "Create Soulstone",
    [8938] = "Regrowth",
    [10601] = "Nature Resistance Totem",
    [132] = "Detect Lesser Invisibility",
    [9756] = "Thorns",
    [8227] = "Flametongue Totem",
    [25895] = "Greater Blessing of Salvation",
    [20762] = "Soulstone Resurrection",
    [8836] = "Grace of Air",
    [6940] = "Blessing of Sacrifice",
    [10291] = "Devotion Aura",
    [8182] = "Frost Resistance",
    [10299] = "Retribution Aura",
    [24907] = "Moonkin Aura",
    [15108] = "Windwall",
    [10404] = "Stoneskin",
    [2970] = "Detect Invisibility",
    [9857] = "Regrowth",
    [10494] = "Mana Spring",
    [10607] = "Windfury Totem Effect",
    [19891] = "Fire Resistance Aura",
    [19895] = "Shadow Resistance Aura",
    [10596] = "Nature Resistance",
    [8914] = "Thorns",
    [20763] = "Soulstone Resurrection",
    [9840] = "Rejuvenation",
    [25909] = "Tranquil Air",
    [20764] = "Soulstone Resurrection",
    [1008] = "Amplify Magic",
    [9856] = "Regrowth",
    [17355] = "Mana Tide",
    [10406] = "Stoneskin Totem",
    [10408] = "Stoneskin Totem",
    [19740] = "Blessing of Might",
    [10898] = "Power Word: Shield",
    [20912] = "Blessing of Sanctuary",
    [25908] = "Tranquil Air Totem",
    [20914] = "Blessing of Sanctuary",
    [10403] = "Stoneskin",
    [10407] = "Stoneskin Totem",
    [10442] = "Strength of Earth Totem",
    [1244] = "Power Word: Fortitude",
    [25916] = "Greater Blessing of Might",
    [1245] = "Power Word: Fortitude",
    [10938] = "Power Word: Fortitude",
    [693] = "Create Soulstone (Minor)",
    [7294] = "Retribution Aura",
    [14819] = "Divine Spirit",
    [8910] = "Rejuvenation",
    [10958] = "Shadow Protection",
    [19897] = "Frost Resistance Aura",
    [10899] = "Power Word: Shield",
    [8075] = "Strength of Earth Totem",
    [10463] = "Healing Stream Totem",
    [8249] = "Flametongue Totem",
    [19888] = "Frost Resistance Aura",
    [19896] = "Shadow Resistance Aura",
    [10479] = "Frost Resistance Totem",
    [1243] = "Power Word: Fortitude",
    [8154] = "Stoneskin Totem",
    [10491] = "Mana Spring",
    [8451] = "Dampen Magic",
    [8455] = "Amplify Magic",
    [9841] = "Rejuvenation",
    [8072] = "Stoneskin",
    [15110] = "Windwall",
    [8076] = "Strength of Earth",
    [8161] = "Strength of Earth Totem",
    [10957] = "Shadow Protection"
}

local BUFFS = {
    {
        {
            6673,
            6673
        },
        {
            6192,
            6192
        },
        {
            11549,
            11549
        },
        {
            5242,
            5242
        },
        {
            25289,
            25289
        },
        {
            11551,
            11551
        },
        {
            11550,
            11550
        }
    },
    {
        {
            131,
            131
        }
    },
    {
        {
            2970,
            2970
        },
        {
            11743,
            11743
        },
        {
            132,
            132
        }
    },
    {
        {
            6307,
            6307
        },
        {
            7804,
            7804
        },
        {
            11766,
            11766
        },
        {
            11767,
            11767
        },
        {
            7805,
            7805
        }
    },
    {
        {
            10613,
            10607
        },
        {
            10614,
            10611
        },
        {
            8512,
            8514
        }
    },
    {
        {
            10407,
            10404
        },
        {
            8155,
            8157
        },
        {
            10408,
            10405
        },
        {
            10406,
            10403
        },
        {
            8071,
            8072
        },
        {
            8154,
            8156
        }
    },
    {
        {
            8166,
            8168
        }
    },
    {
        {
            10479,
            10477
        },
        {
            10478,
            10476
        },
        {
            8181,
            8182
        }
    },
    {
        {
            20755,
            20763
        },
        {
            20757,
            20764
        },
        {
            20756,
            20707
        },
        {
            693,
            20765
        },
        {
            20752,
            20762
        }
    },
    {
        {
            15112,
            15110
        },
        {
            15111,
            15109
        },
        {
            15107,
            15108
        }
    },
    {
        {
            10278,
            10278
        },
        {
            1022,
            1022
        },
        {
            5599,
            5599
        }
    },
    {
        {
            19896,
            19896
        },
        {
            19876,
            19876
        },
        {
            19895,
            19895
        }
    },
    {
        {
            10958,
            10958
        },
        {
            10957,
            10957
        },
        {
            976,
            976
        },
        {
            27683,
            27683
        }
    },
    {
        {
            1044,
            1044
        }
    },
    {
        {
            1038,
            1038
        },
        {
            25895,
            25895
        }
    },
    {
        {
            8835,
            8836
        },
        {
            10627,
            10626
        },
        {
            25359,
            25360
        }
    },
    {
        {
            1245,
            1245
        },
        {
            1243,
            1243
        },
        {
            10938,
            10938
        },
        {
            10937,
            10937
        },
        {
            1244,
            1244
        },
        {
            2791,
            2791
        }
    },
    {
        {
            19835,
            19835
        },
        {
            19834,
            19834
        },
        {
            19740,
            19740
        },
        {
            19837,
            19837
        },
        {
            25291,
            25291
        },
        {
            19836,
            19836
        },
        {
            19838,
            19838
        },
        {
            25916,
            25916
        },
        {
            25782,
            25782
        }
    },
    {
        {
            19899,
            19899
        },
        {
            19900,
            19900
        },
        {
            19891,
            19891
        }
    },
    {
        {
            8177,
            8178
        }
    },
    {
        {
            8455,
            8455
        },
        {
            10169,
            10169
        },
        {
            1008,
            1008
        },
        {
            10170,
            10170
        }
    },
    {
        {
            8143,
            8146
        }
    },
    {
        {
            10156,
            10156
        },
        {
            1461,
            1461
        },
        {
            1460,
            1460
        },
        {
            1459,
            1459
        },
        {
            10157,
            10157
        },
        {
            23028,
            23028
        }
    },
    {
        {
            8939,
            8939
        },
        {
            8940,
            8940
        },
        {
            8936,
            8936
        },
        {
            8941,
            8941
        },
        {
            9858,
            9858
        },
        {
            8938,
            8938
        },
        {
            9750,
            9750
        },
        {
            9857,
            9857
        },
        {
            9856,
            9856
        }
    },
    {
        {
            19506,
            19506
        },
        {
            20905,
            20905
        },
        {
            20906,
            20906
        }
    },
    {
        {
            8170,
            8170
        }
    },
    {
        {
            19742,
            19742
        },
        {
            19853,
            19853
        },
        {
            19854,
            19854
        },
        {
            25290,
            25290
        },
        {
            19850,
            19850
        },
        {
            19852,
            19852
        },
        {
            25894,
            25894
        },
        {
            25918,
            25918
        }
    },
    {
        {
            10442,
            10441
        },
        {
            8161,
            8163
        },
        {
            25361,
            25362
        },
        {
            8160,
            8162
        },
        {
            8075,
            8076
        }
    },
    {
        {
            20217,
            20217
        },
        {
            25898,
            25898
        }
    },
    {
        {
            6346,
            6346
        }
    },
    {
        {
            6377,
            6372
        },
        {
            10462,
            10460
        },
        {
            5394,
            5672
        },
        {
            6375,
            6371
        },
        {
            10463,
            10461
        }
    },
    {
        {
            8249,
            8250
        },
        {
            16387,
            15036
        },
        {
            10526,
            10521
        },
        {
            8227,
            8230
        }
    },
    {
        {
            25908,
            25909
        }
    },
    {
        {
            19897,
            19897
        },
        {
            19888,
            19888
        },
        {
            19898,
            19898
        }
    },
    {
        {
            8184,
            8185
        },
        {
            10538,
            10535
        },
        {
            10537,
            10534
        }
    },
    {
        {
            5697,
            5697
        }
    },
    {
        {
            6940,
            6940
        },
        {
            20729,
            20729
        }
    },
    {
        {
            643,
            643
        },
        {
            10290,
            10290
        },
        {
            10293,
            10293
        },
        {
            1032,
            1032
        },
        {
            10292,
            10292
        },
        {
            465,
            465
        },
        {
            10291,
            10291
        }
    },
    {
        {
            10174,
            10174
        },
        {
            10173,
            10173
        },
        {
            604,
            604
        },
        {
            8450,
            8450
        },
        {
            8451,
            8451
        }
    },
    {
        {
            20913,
            20913
        },
        {
            20912,
            20912
        },
        {
            20914,
            20914
        },
        {
            20911,
            20911
        },
        {
            25899,
            25899
        }
    },
    {
        {
            14819,
            14819
        },
        {
            27841,
            27841
        },
        {
            14752,
            14752
        },
        {
            14818,
            14818
        },
        {
            27681,
            27681
        }
    },
    {
        {
            24858,
            24907
        }
    },
    {
        {
            10497,
            10494
        },
        {
            10495,
            10491
        },
        {
            10496,
            10493
        },
        {
            5675,
            5677
        }
    },
    {
        {
            19978,
            19978
        },
        {
            19977,
            19977
        },
        {
            19979,
            19979
        },
        {
            25890,
            25890
        }
    },
    {
        {
            139,
            139
        },
        {
            6077,
            6077
        },
        {
            6078,
            6078
        },
        {
            6074,
            6074
        },
        {
            10927,
            10927
        },
        {
            6076,
            6076
        },
        {
            25315,
            25315
        },
        {
            6075,
            6075
        },
        {
            10928,
            10928
        },
        {
            10929,
            10929
        }
    },
    {
        {
            19746,
            19746
        }
    },
    {
        {
            10898,
            10898
        },
        {
            6065,
            6065
        },
        {
            6066,
            6066
        },
        {
            592,
            592
        },
        {
            600,
            600
        },
        {
            3747,
            3747
        },
        {
            10900,
            10900
        },
        {
            10901,
            10901
        },
        {
            10899,
            10899
        },
        {
            17,
            17
        }
    },
    {
        {
            10298,
            10298
        },
        {
            10301,
            10301
        },
        {
            10300,
            10300
        },
        {
            10299,
            10299
        },
        {
            7294,
            7294
        }
    },
    {
        {
            10595,
            10596
        },
        {
            10600,
            10598
        },
        {
            10601,
            10599
        }
    },
    {
        {
            8910,
            8910
        },
        {
            9839,
            9839
        },
        {
            25299,
            25299
        },
        {
            774,
            774
        },
        {
            1430,
            1430
        },
        {
            2091,
            2091
        },
        {
            2090,
            2090
        },
        {
            3627,
            3627
        },
        {
            9840,
            9840
        },
        {
            9841,
            9841
        },
        {
            1058,
            1058
        }
    },
    {
        {
            16190,
            16191
        },
        {
            17359,
            17360
        },
        {
            17354,
            17355
        }
    },
    {
        {
            9910,
            9910
        },
        {
            9756,
            9756
        },
        {
            1075,
            1075
        },
        {
            467,
            467
        },
        {
            8914,
            8914
        },
        {
            782,
            782
        }
    }
}

local DatabaseMetatable = {
    __newindex = function(t, k, v)
        return rawset(t, tonumber(k) or type(k) == "string" and strlower(strtrim(k)) or k, v)
    end,
    __index = function(t, k)
        return rawget(t, tonumber(k) or type(k) == "string" and strlower(strtrim(k)) or k)
    end,
    __metatable = true
}

local BuffFamily = {}
BuffFamily.prototype = {}
BuffFamily.metatable = {
    __index = BuffFamily.prototype,
    __metatable = true
}
BuffFamily.database = setmetatable({}, DatabaseMetatable)

local function slugify(name)
    return strlower(gsub(gsub(strtrim(name), "[^%a ]+", ""), "[ ]+", "-"))
end

function BuffFamily:Create(...)
    local buffFamily = setmetatable({}, self.metatable)
    buffFamily.buff = select(1, ...)
    buffFamily.buffs = {}

    if self.database[buffFamily:GetID()] then
        return self.database[buffFamily:GetID()]
    end

    self.database[buffFamily:GetID()] = buffFamily

    for i = 1, select("#", ...) do
        local buff = select(i, ...)
        buffFamily:AddBuff(buff)
    end

    return buffFamily
end

function BuffFamily:Get(key)
    return self.database[key]
end

function BuffFamily.prototype:GetID()
    if not self.id then
        self.id = slugify(self:GetName(true))
    end

    return self.id
end

function BuffFamily.prototype:GetName(enUS)
    return self.buff:GetAuraName(enUS)
end

function BuffFamily.prototype:AddBuff(buff)
    BuffFamily.database[buff] = self
    BuffFamily.database[buff:GetSpellID()] = self
    BuffFamily.database[buff:GetSpellName()] = self
    BuffFamily.database[buff:GetSpellNameWithSubtext()] = self
    BuffFamily.database[buff:GetAuraID()] = self
    BuffFamily.database[buff:GetAuraName()] = self
    BuffFamily.database[buff:GetAuraNameWithSubtext()] = self

    tinsert(self.buffs, buff)
    sort(
        self.buffs,
        function(a, b)
            return a:GetSpellID() < b:GetSpellID()
        end
    )
end

function BuffFamily.prototype:GetBuff(index)
    return self.buffs[index]
end

function BuffFamily.prototype:GetNumBuffs()
    return #self.buffs
end

function BuffFamily.prototype:GetBuffs()
    return self.buffs
end

function BuffFamily.prototype:ContainsBuff(buff)
    return tContains(self.buffs, buff)
end

local Buff = {}
Buff.prototype = {}
Buff.metatable = {
    __index = Buff.prototype,
    __metatable = true
}
Buff.database = setmetatable({}, DatabaseMetatable)

local function extract(data)
    return {
        id = data:GetSpellID(),
        name = data:GetSpellName(),
        rank = tonumber(strmatch(data:GetSpellSubtext(), gsub(TOOLTIP_TALENT_RANK_CURRENT_ONLY, "%%d", "(%%d)")))
    }
end

function Buff:Create(spellData, auraData)
    local buff = setmetatable({}, self.metatable)

    buff.spell = extract(spellData)
    buff.aura = extract(auraData)

    self.database[buff] = buff

    if self.database[buff:GetSpellID()] or self.database[buff:GetAuraID()] then
        assert(self.database[buff:GetSpellID()] == self.database[buff:GetAuraID()])
        return self.database[buff:GetSpellID()]
    end

    self.database[buff:GetSpellID()] = buff

    if not self.database[buff:GetSpellName()] or self.database[buff:GetSpellName()]:GetSpellRank() <= buff:GetSpellRank() or buff:GetAuraRank() and self.database[buff:GetSpellName()]:GetAuraRank() <= buff:GetAuraRank() then
        self.database[buff:GetSpellName()] = buff
    end

    self.database[buff:GetSpellNameWithSubtext()] = buff
    self.database[buff:GetAuraID()] = buff

    if not self.database[buff:GetAuraName()] or buff:GetSpellRank() and self.database[buff:GetAuraName()]:GetSpellRank() <= buff:GetSpellRank() or buff:GetAuraRank() and self.database[buff:GetAuraName()]:GetAuraRank() <= buff:GetAuraRank() then
        self.database[buff:GetAuraName()] = buff
    end

    self.database[buff:GetAuraNameWithSubtext()] = buff

    return buff
end

function Buff:Get(key)
    return self.database[key]
end

function Buff.prototype:GetFamily()
    return BuffFamily:Get(self)
end

function Buff.prototype:GetFamilyID()
    return self:GetFamily():GetID()
end

function Buff.prototype:GetFamilyName(enUS)
    return self:GetFamily():GetName(enUS)
end

function Buff.prototype:GetSpellID()
    return self.spell.id
end

function Buff.prototype:GetSpellName(enUS)
    return enUS and NAMES[self.spell.id] or self.spell.name
end

function Buff.prototype:GetSpellRank()
    return self.spell.rank
end

function Buff.prototype:GetSpellSubtext(enUS)
    local rank = self:GetSpellRank()
    return rank and format(enUS and "Rank %d" or TOOLTIP_TALENT_RANK_CURRENT_ONLY, rank)
end

function Buff.prototype:GetSpellNameWithSubtext(enUS)
    local name, subtext = self:GetSpellName(enUS), self:GetSpellSubtext(enUS)
    return subtext and format("%s(%s)", name, subtext) or name
end

function Buff.prototype:GetAuraID()
    return self.aura.id
end

function Buff.prototype:GetAuraName(enUS)
    return enUS and NAMES[self.aura.id] or self.aura.name
end

function Buff.prototype:GetAuraRank()
    return self.aura.rank
end

function Buff.prototype:GetAuraSubtext(enUS)
    local rank = self:GetAuraRank()
    return rank and format(enUS and "Rank %d" or TOOLTIP_TALENT_RANK_CURRENT_ONLY, rank)
end

function Buff.prototype:GetAuraNameWithSubtext(enUS)
    local name, subtext = self:GetAuraName(enUS), self:GetAuraSubtext(enUS)
    return subtext and format("%s(%s)", name, subtext) or name
end

local BuffLoader = {}
BuffLoader.prototype = {}
BuffLoader.metatable = {
    __index = BuffLoader.prototype,
    __metatable = true
}

function BuffLoader:Create()
    local buffLoader = setmetatable({}, self.metatable)
    buffLoader.buffIDs = {}
    buffLoader.buffs = {}
    return buffLoader
end

function BuffLoader.prototype:Add(spellID, auraID)
    tinsert(self.buffIDs, {spellID, auraID})
    return self
end

function BuffLoader.prototype:Load(callback)
    if #self.buffIDs == 0 then
        if callback then
            callback(unpack(self.buffs))
        end

        wipe(self.buffs)
        return
    end

    local spellID, auraID = unpack(tremove(self.buffIDs, 1))
    local spellData = Spell:CreateFromSpellID(spellID)
    local auraData = Spell:CreateFromSpellID(auraID or spellID)

    spellData:ContinueOnSpellLoad(
        function()
            auraData:ContinueOnSpellLoad(
                function()
                    local buff = Buff:Create(spellData, auraData)
                    tinsert(self.buffs, buff)
                    self:Load(callback)
                end
            )
        end
    )
end

do
    local function loadNext(i, buffIDs)
        if not i then
            return
        end

        local buffLoader = BuffLoader:Create()

        for _, spellID_auraID in ipairs(buffIDs) do
            buffLoader:Add(unpack(spellID_auraID))
        end

        C_Timer.After(
            0,
            function()
                buffLoader:Load(
                    function(...)
                        BuffFamily:Create(...)
                        loadNext(next(BUFFS, i))
                    end
                )
            end
        )
    end

    loadNext(next(BUFFS))
end

local PRINT_PREFIX = "\124cff8888ff<\124cff6666ffBuffMe\124cff8888ff>\124r"
local RAID_WARNING_FORMAT = "%s   --->   %s"
local RAID_WARNING_WITH_GROUP_FORMAT = RAID_WARNING_FORMAT .. " (" .. GROUP_NUMBER .. ")"

local BuffMeNotice_AddMessage

local BuffMeButton_Glow

do
    local timers = setmetatable({}, {__mode = "k"})

    function BuffMeButton_Glow(frame, duration)
        if timers[frame] then
            timers[frame]:Cancel()
        else
            LibCustomGlow.ButtonGlow_Start(frame, nil, nil, strmatch(frame:GetName(), "^Compact") and 0)
        end

        timers[frame] =
            C_Timer.NewTimer(
            duration,
            function()
                if timers[frame] then
                    LibCustomGlow.ButtonGlow_Stop(frame)
                    timers[frame] = nil
                end
            end
        )
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
eventFrame:SetScript(
    "OnEvent",
    function(self, event, prefix, text, channel, sender)
        if prefix ~= "BuffMe" then
            return
        end

        local buffName, target = strsplit(":", text)
        local buffFamily = BuffFamily:Get(buffName)

        if not buffFamily then
            return
        else
            local buffKnown = false

            for _, buff in ipairs(buffFamily:GetBuffs()) do
                if GetSpellInfo(buff:GetSpellName()) then
                    buffKnown = true
                    break
                end
            end

            if not buffKnown then
                return
            end
        end

        local auraName = buffFamily:GetName()

        target = Ambiguate(target or sender, "none")

        local warning

        if UnitInRaid(target) then
            local _, _, subgroup = GetRaidRosterInfo(UnitInRaid(target))
            warning = format(RAID_WARNING_WITH_GROUP_FORMAT, auraName, target, subgroup)
        else
            warning = format(RAID_WARNING_FORMAT, auraName, target)
        end

        local duration = 4
        local _, class = UnitClass(target)

        BuffMeNotice_AddMessage(BuffMeWarningFrame, warning, class and RAID_CLASS_COLORS[class] or ChatTypeInfo["RAID_WARNING"], duration)

        local unitFrame = LibGetFrame.GetUnitFrame(target)

        if unitFrame then
            BuffMeButton_Glow(unitFrame, duration)
        end

        PlaySoundFile("Sound\\Interface\\RaidWarning.ogg")
    end
)

C_ChatInfo.RegisterAddonMessagePrefix("BuffMe")

local function BuffMe(cmd)
    local target, duration, silent, exists, help
    local conditionals = strmatch(cmd, "^%s*%[([^%]]*)%]")
    local spells = {strsplit(",", conditionals and strmatch(cmd, "^%s*%[[^%]]*%]%s*(.-)%s*$") or cmd)}

    if conditionals then
        conditionals = {strsplit(",", conditionals)}

        for _, conditional in ipairs(conditionals) do
            local value = strmatch(conditional, "^%s*@%s*(.-)%s*$") or strmatch(conditional, "^%s*[tT][aA][rR][gG][eE][tT]%s*=%s*(.-)%s*$")

            if value then
                target = value
            else
                value = tonumber(strmatch(conditional, "^%s*<%s*(.-)%s*$") or strmatch(conditional, "^%s*[dD][uU][rR][aA][tT][iI][oO][nN]%s*=%s*(.-)%s*$"))

                if value then
                    duration = value
                else
                    value = strmatch(conditional, "^%s*[sS][iI][lL][iI][eE][nN][tT]%s*$")

                    if value then
                        silent = true
                    else
                        value = strmatch(conditional, "^%s*[eE][xX][iI][sS][tT][sS]%s*$")

                        if value then
                            exists = true
                        else
                            value = strmatch(conditional, "^%s*[hH][eE][lL][pP]%s*$")

                            if value then
                                help = true
                            else
                                print(PRINT_PREFIX, format("\124cffff0000Invalid argument:\124r %s", conditional))
                                return
                            end
                        end
                    end
                end
            end
        end
    end

    target = target or "player"

    if not UnitExists(target) or not GetUnitName(target, true) then
        if not exists then
            print(PRINT_PREFIX, format("\124cffff0000Unknown target:\124r %s", target))
        end

        return
    end

    target = GetUnitName(target, true)

    if not UnitIsPlayer(target) and not UnitCanAssist("player", target) then
        if not help then
            print(PRINT_PREFIX, format("\124cffff0000Invalid target:\124r %s", target))
        end

        return
    end

    for _, spell in ipairs(spells) do
        local buffFamily = BuffFamily:Get(spell)

        if not buffFamily then
            print(PRINT_PREFIX, format("\124cffff0000Unknown buff:\124r %s", spell))
            return
        end

        do
            local auraName, expirationTime, unitCaster, spellID, _

            do
                local index = 1

                while true do
                    auraName, _, _, _, _, expirationTime, unitCaster, _, _, spellID = UnitBuff(target, index)

                    if not auraName then
                        break
                    end

                    local buff = Buff:Get(spellID)

                    if buff and buffFamily:ContainsBuff(buff) then
                        break
                    end

                    index = index + 1
                end
            end

            if auraName then
                if expirationTime == 0 then
                    if not LibClassicDurations then
                        LibClassicDurations = LibStub("LibClassicDurations", true)
                    end

                    if LibClassicDurations then
                        _, expirationTime = LibClassicDurations:GetAuraDurationByUnit(target, spellID, unitCaster, auraName)
                    end
                end

                if not duration or expirationTime > GetTime() + duration then
                    if not silent then
                        if UnitIsUnit(target, "player") then
                            print(PRINT_PREFIX, format("\124cff00ff00You already have \124r%s\124cff00ff00.", auraName))
                        else
                            print(PRINT_PREFIX, format("\124cff00ff00%s already has \124r%s\124cff00ff00.", target, auraName))
                        end
                    end

                    return
                end
            end
        end

        if not silent then
            local buffFamilyName = buffFamily:GetName(true)

            if UnitIsUnit(target, "player") then
                print(PRINT_PREFIX, format("\124cffffff00Requesting \124r%s\124cffffff00.", buffFamilyName))
            elseif UnitInRaid(target) then
                local _, _, subgroup = GetRaidRosterInfo(UnitInRaid(target))
                print(PRINT_PREFIX, format("\124cffffff00Requesting \124r%s \124cffffff00for \124r%s (Group %d)\124cffffff00.", buffFamilyName, target, subgroup))
            else
                print(PRINT_PREFIX, format("\124cffffff00Requesting \124r%s \124cffffff00for \124r%s\124cffffff00.", buffFamilyName, target))
            end
        end

        local message

        if UnitIsUnit(target, "player") then
            message = buffFamily:GetID()
        else
            message = format("%s:%s-%s", buffFamily:GetID(), gsub(target, "%-.*", ""), GetNormalizedRealmName())
        end

        C_ChatInfo.SendAddonMessage("BuffMe", message, "RAID")
    end
end

local BUFFME_NOTICE_DEFAULT_HOLD_TIME = 10.0
local BUFFME_NOTICE_FADE_IN_TIME = 0.0
local BUFFME_NOTICE_FADE_OUT_TIME = 1.0

local function BuffMeNotice_FadeInit(slotFrame)
    FadingFrame_OnLoad(slotFrame)
    FadingFrame_SetFadeInTime(slotFrame, BUFFME_NOTICE_FADE_IN_TIME)
    FadingFrame_SetHoldTime(slotFrame, BUFFME_NOTICE_FADE_IN_TIME)
    FadingFrame_SetFadeOutTime(slotFrame, BUFFME_NOTICE_FADE_OUT_TIME)
end

local function BuffMeNotice_Clear(noticeFrame)
    for _, slot in ipairs(noticeFrame.slots) do
        RaidNotice_ClearSlot(slot)
    end
end

function BuffMeNotice_AddMessage(noticeFrame, textString, colorInfo, displayTime)
    if not textString then
        return
    end

    if not displayTime or displayTime == 0 then
        displayTime = BUFFME_NOTICE_DEFAULT_HOLD_TIME
    else
        displayTime = displayTime - BUFFME_NOTICE_FADE_OUT_TIME
        displayTime = max(displayTime, 1.0)
    end

    noticeFrame:Show()

    local k

    for i, slot in ipairs(noticeFrame.slots) do
        if not slot:IsShown() then
            k = i
            break
        end

        if not k or FadingFrame_GetRemainingTime(slot) < FadingFrame_GetRemainingTime(noticeFrame.slots[k]) then
            k = i
        end
    end

    noticeFrame.slots_text[k] = textString
    RaidNotice_SetSlot(noticeFrame.slots[k], noticeFrame.slots_text[k], colorInfo, noticeFrame.timings["RAID_NOTICE_MIN_HEIGHT"], displayTime)
    noticeFrame.slots[k].scrollTime = 0
end

function BuffMeNotice_OnUpdate(noticeFrame, elapsedTime)
    local inUse = false

    for _, slot in ipairs(noticeFrame.slots) do
        if slot:IsShown() then
            RaidNotice_UpdateSlot(slot, noticeFrame.timings, elapsedTime, true)
            inUse = true
        end
    end

    if not inUse then
        noticeFrame:Hide()
    end
end

function BuffMeWarningFrame_OnLoad(self)
    self.slots = {}
    self.slots_text = {}

    while _G["BuffMeWarningFrameSlot" .. (#self.slots + 1)] do
        tinsert(self.slots, _G["BuffMeWarningFrameSlot" .. (#self.slots + 1)])
    end

    for _, slot in ipairs(self.slots) do
        BuffMeNotice_FadeInit(slot)
    end

    self.timings = {}
    self.timings["RAID_NOTICE_MIN_HEIGHT"] = 20.0
    self.timings["RAID_NOTICE_MAX_HEIGHT"] = 30.0
    self.timings["RAID_NOTICE_SCALE_UP_TIME"] = 0.2
    self.timings["RAID_NOTICE_SCALE_DOWN_TIME"] = 0.4
end

SLASH_BUFFME1 = "/buffme"

SlashCmdList["BUFFME"] = BuffMe
