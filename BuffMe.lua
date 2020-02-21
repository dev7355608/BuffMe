local UnitExists = UnitExists
local GetUnitName = GetUnitName
local UnitInRaid = UnitInRaid
local UnitIsPlayer = UnitIsPlayer
local UnitIsUnit = UnitIsUnit
local UnitGUID = UnitGUID
local UnitBuff = UnitBuff
local UnitClass = UnitClass
local UnitRace = UnitRace
local UnitCanAssist = UnitCanAssist
local IsInRaid = IsInRaid
local GetTime = GetTime
local GetRaidRosterInfo = GetRaidRosterInfo
local GetNormalizedRealmName = GetNormalizedRealmName
local GetNumGroupMembers = GetNumGroupMembers
local GetTalentInfo = GetTalentInfo
local GetLocale = GetLocale
local Ambiguate = Ambiguate
local SecureCmdOptionParse = SecureCmdOptionParse
local C_Timer = C_Timer
local C_ChatInfo = C_ChatInfo
local C_CreatureInfo = C_CreatureInfo
local format = format
local strlower = strlower
local strtrim = strtrim
local strsplit = strsplit
local strjoin = strjoin
local strmatch = strmatch
local gsub = gsub
local tostringall = tostringall
local tinsert = tinsert
local tremove = tremove
local tContains = tContains
local wipe = wipe
local sort = sort
local unpack = unpack
local max = max

local GROUP_NUMBER = GROUP_NUMBER
local TOOLTIP_TALENT_RANK_CURRENT_ONLY = TOOLTIP_TALENT_RANK_CURRENT_ONLY
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local LibGetFrame = LibStub("LibGetFrame-1.0")
local LibCustomGlow = LibStub("LibCustomGlow-1.0")
local LibClassicDurations

local AMPLIFY_MAGIC = "Amplify Magic"
local ARCANE_BRILLIANCE = "Arcane Brilliance"
local ARCANE_INTELLECT = "Arcane Intellect"
local BATTLE_SHOUT = "Battle Shout"
local BLESSING_OF_FREEDOM = "Blessing of Freedom"
local BLESSING_OF_KINGS = "Blessing of Kings"
local BLESSING_OF_LIGHT = "Blessing of Light"
local BLESSING_OF_MIGHT = "Blessing of Might"
local BLESSING_OF_PROTECTION = "Blessing of Protection"
local BLESSING_OF_SACRIFICE = "Blessing of Sacrifice"
local BLESSING_OF_SALVATION = "Blessing of Salvation"
local BLESSING_OF_SANCTUARY = "Blessing of Sanctuary"
local BLESSING_OF_WISDOM = "Blessing of Wisdom"
local BLOOD_PACT = "Blood Pact"
local CONCENTRATION_AURA = "Concentration Aura"
local CREATE_SOULSTONE = "Create Soulstone"
local CREATE_SOULSTONE_GREATER = "Create Soulstone (Greater)"
local CREATE_SOULSTONE_LESSER = "Create Soulstone (Lesser)"
local CREATE_SOULSTONE_MAJOR = "Create Soulstone (Major)"
local CREATE_SOULSTONE_MINOR = "Create Soulstone (Minor)"
local DAMPEN_MAGIC = "Dampen Magic"
local DETECT_GREATER_INVISIBILITY = "Detect Greater Invisibility"
local DETECT_INVISIBILITY = "Detect Invisibility"
local DETECT_LESSER_INVISIBILITY = "Detect Lesser Invisibility"
local DEVOTION_AURA = "Devotion Aura"
local DISEASE_CLEANSING_TOTEM = "Disease Cleansing Totem"
local DISEASE_CLEANSING_TOTEM_EFFECT = "Disease Cleansing Totem Effect"
local DIVINE_SPIRIT = "Divine Spirit"
local FEAR_WARD = "Fear Ward"
local FIRE_RESISTANCE = "Fire Resistance"
local FIRE_RESISTANCE_AURA = "Fire Resistance Aura"
local FIRE_RESISTANCE_TOTEM = "Fire Resistance Totem"
local FLAMETONGUE_TOTEM = "Flametongue Totem"
local FLAMETONGUE_TOTEM_EFFECT = "Flametongue Totem Effect"
local FROST_RESISTANCE = "Frost Resistance"
local FROST_RESISTANCE_AURA = "Frost Resistance Aura"
local FROST_RESISTANCE_TOTEM = "Frost Resistance Totem"
local GIFT_OF_THE_WILD = "Gift of the Wild"
local GRACE_OF_AIR = "Grace of Air"
local GRACE_OF_AIR_TOTEM = "Grace of Air Totem"
local GREATER_BLESSING_OF_KINGS = "Greater Blessing of Kings"
local GREATER_BLESSING_OF_LIGHT = "Greater Blessing of Light"
local GREATER_BLESSING_OF_MIGHT = "Greater Blessing of Might"
local GREATER_BLESSING_OF_SALVATION = "Greater Blessing of Salvation"
local GREATER_BLESSING_OF_SANCTUARY = "Greater Blessing of Sanctuary"
local GREATER_BLESSING_OF_WISDOM = "Greater Blessing of Wisdom"
local GROUNDING_TOTEM = "Grounding Totem"
local GROUNDING_TOTEM_EFFECT = "Grounding Totem Effect"
local HEALING_STREAM = "Healing Stream"
local HEALING_STREAM_TOTEM = "Healing Stream Totem"
local INNERVATE = "Innervate"
local MANA_SPRING = "Mana Spring"
local MANA_SPRING_TOTEM = "Mana Spring Totem"
local MANA_TIDE = "Mana Tide"
local MANA_TIDE_TOTEM = "Mana Tide Totem"
local MARK_OF_THE_WILD = "Mark of the Wild"
local MOONKIN_AURA = "Moonkin Aura"
local MOONKIN_FORM = "Moonkin Form"
local NATURE_RESISTANCE = "Nature Resistance"
local NATURE_RESISTANCE_TOTEM = "Nature Resistance Totem"
local POISON_CLEANSING_TOTEM = "Poison Cleansing Totem"
local POISON_CLEANSING_TOTEM_EFFECT = "Poison Cleansing Totem Effect"
local POWER_INFUSION = "Power Infusion"
local POWER_WORD_FORTITUDE = "Power Word: Fortitude"
local POWER_WORD_SHIELD = "Power Word: Shield"
local PRAYER_OF_FORTITUDE = "Prayer of Fortitude"
local PRAYER_OF_SHADOW_PROTECTION = "Prayer of Shadow Protection"
local PRAYER_OF_SPIRIT = "Prayer of Spirit"
local REGROWTH = "Regrowth"
local REJUVENATION = "Rejuvenation"
local RENEW = "Renew"
local RETRIBUTION_AURA = "Retribution Aura"
local SHADOW_PROTECTION = "Shadow Protection"
local SHADOW_RESISTANCE_AURA = "Shadow Resistance Aura"
local SOULSTONE_RESURRECTION = "Soulstone Resurrection"
local STONESKIN = "Stoneskin"
local STONESKIN_TOTEM = "Stoneskin Totem"
local STRENGTH_OF_EARTH = "Strength of Earth"
local STRENGTH_OF_EARTH_TOTEM = "Strength of Earth Totem"
local THORNS = "Thorns"
local TRANQUIL_AIR = "Tranquil Air"
local TRANQUIL_AIR_TOTEM = "Tranquil Air Totem"
local TREMOR_TOTEM = "Tremor Totem"
local TREMOR_TOTEM_EFFECT = "Tremor Totem Effect"
local TRUESHOT_AURA = "Trueshot Aura"
local UNENDING_BREATH = "Unending Breath"
local WATER_BREATHING = "Water Breathing"
local WATER_WALKING = "Water Walking"
local WINDFURY_TOTEM = "Windfury Totem"
local WINDFURY_TOTEM_EFFECT = "Windfury Totem Effect"
local WINDWALL = "Windwall"
local WINDWALL_TOTEM = "Windwall Totem"

local SPELL_INFO_NAME = {
    [17] = POWER_WORD_SHIELD,
    [131] = WATER_BREATHING,
    [132] = DETECT_LESSER_INVISIBILITY,
    [139] = RENEW,
    [465] = DEVOTION_AURA,
    [467] = THORNS,
    [546] = WATER_WALKING,
    [592] = POWER_WORD_SHIELD,
    [600] = POWER_WORD_SHIELD,
    [604] = DAMPEN_MAGIC,
    [643] = DEVOTION_AURA,
    [693] = CREATE_SOULSTONE_MINOR,
    [774] = REJUVENATION,
    [782] = THORNS,
    [976] = SHADOW_PROTECTION,
    [1008] = AMPLIFY_MAGIC,
    [1022] = BLESSING_OF_PROTECTION,
    [1032] = DEVOTION_AURA,
    [1038] = BLESSING_OF_SALVATION,
    [1044] = BLESSING_OF_FREEDOM,
    [1058] = REJUVENATION,
    [1075] = THORNS,
    [1126] = MARK_OF_THE_WILD,
    [1243] = POWER_WORD_FORTITUDE,
    [1244] = POWER_WORD_FORTITUDE,
    [1245] = POWER_WORD_FORTITUDE,
    [1430] = REJUVENATION,
    [1459] = ARCANE_INTELLECT,
    [1460] = ARCANE_INTELLECT,
    [1461] = ARCANE_INTELLECT,
    [2090] = REJUVENATION,
    [2091] = REJUVENATION,
    [2791] = POWER_WORD_FORTITUDE,
    [2970] = DETECT_INVISIBILITY,
    [3627] = REJUVENATION,
    [3747] = POWER_WORD_SHIELD,
    [5232] = MARK_OF_THE_WILD,
    [5234] = MARK_OF_THE_WILD,
    [5242] = BATTLE_SHOUT,
    [5394] = HEALING_STREAM_TOTEM,
    [5599] = BLESSING_OF_PROTECTION,
    [5672] = HEALING_STREAM,
    [5675] = MANA_SPRING_TOTEM,
    [5677] = MANA_SPRING,
    [5697] = UNENDING_BREATH,
    [6065] = POWER_WORD_SHIELD,
    [6066] = POWER_WORD_SHIELD,
    [6074] = RENEW,
    [6075] = RENEW,
    [6076] = RENEW,
    [6077] = RENEW,
    [6078] = RENEW,
    [6192] = BATTLE_SHOUT,
    [6307] = BLOOD_PACT,
    [6346] = FEAR_WARD,
    [6371] = HEALING_STREAM,
    [6372] = HEALING_STREAM,
    [6375] = HEALING_STREAM_TOTEM,
    [6377] = HEALING_STREAM_TOTEM,
    [6673] = BATTLE_SHOUT,
    [6756] = MARK_OF_THE_WILD,
    [6940] = BLESSING_OF_SACRIFICE,
    [7294] = RETRIBUTION_AURA,
    [7804] = BLOOD_PACT,
    [7805] = BLOOD_PACT,
    [8071] = STONESKIN_TOTEM,
    [8072] = STONESKIN,
    [8075] = STRENGTH_OF_EARTH_TOTEM,
    [8076] = STRENGTH_OF_EARTH,
    [8143] = TREMOR_TOTEM,
    [8146] = TREMOR_TOTEM_EFFECT,
    [8154] = STONESKIN_TOTEM,
    [8155] = STONESKIN_TOTEM,
    [8156] = STONESKIN,
    [8157] = STONESKIN,
    [8160] = STRENGTH_OF_EARTH_TOTEM,
    [8161] = STRENGTH_OF_EARTH_TOTEM,
    [8162] = STRENGTH_OF_EARTH,
    [8163] = STRENGTH_OF_EARTH,
    [8166] = POISON_CLEANSING_TOTEM,
    [8168] = POISON_CLEANSING_TOTEM_EFFECT,
    [8170] = DISEASE_CLEANSING_TOTEM,
    [8171] = DISEASE_CLEANSING_TOTEM_EFFECT,
    [8177] = GROUNDING_TOTEM,
    [8178] = GROUNDING_TOTEM_EFFECT,
    [8181] = FROST_RESISTANCE_TOTEM,
    [8182] = FROST_RESISTANCE,
    [8184] = FIRE_RESISTANCE_TOTEM,
    [8185] = FIRE_RESISTANCE,
    [8227] = FLAMETONGUE_TOTEM,
    [8230] = FLAMETONGUE_TOTEM_EFFECT,
    [8249] = FLAMETONGUE_TOTEM,
    [8250] = FLAMETONGUE_TOTEM_EFFECT,
    [8450] = DAMPEN_MAGIC,
    [8451] = DAMPEN_MAGIC,
    [8455] = AMPLIFY_MAGIC,
    [8512] = WINDFURY_TOTEM,
    [8514] = WINDFURY_TOTEM_EFFECT,
    [8835] = GRACE_OF_AIR_TOTEM,
    [8836] = GRACE_OF_AIR,
    [8907] = MARK_OF_THE_WILD,
    [8910] = REJUVENATION,
    [8914] = THORNS,
    [8936] = REGROWTH,
    [8938] = REGROWTH,
    [8939] = REGROWTH,
    [8940] = REGROWTH,
    [8941] = REGROWTH,
    [9750] = REGROWTH,
    [9756] = THORNS,
    [9839] = REJUVENATION,
    [9840] = REJUVENATION,
    [9841] = REJUVENATION,
    [9856] = REGROWTH,
    [9857] = REGROWTH,
    [9858] = REGROWTH,
    [9884] = MARK_OF_THE_WILD,
    [9885] = MARK_OF_THE_WILD,
    [9910] = THORNS,
    [10060] = POWER_INFUSION,
    [10156] = ARCANE_INTELLECT,
    [10157] = ARCANE_INTELLECT,
    [10169] = AMPLIFY_MAGIC,
    [10170] = AMPLIFY_MAGIC,
    [10173] = DAMPEN_MAGIC,
    [10174] = DAMPEN_MAGIC,
    [10278] = BLESSING_OF_PROTECTION,
    [10290] = DEVOTION_AURA,
    [10291] = DEVOTION_AURA,
    [10292] = DEVOTION_AURA,
    [10293] = DEVOTION_AURA,
    [10298] = RETRIBUTION_AURA,
    [10299] = RETRIBUTION_AURA,
    [10300] = RETRIBUTION_AURA,
    [10301] = RETRIBUTION_AURA,
    [10403] = STONESKIN,
    [10404] = STONESKIN,
    [10405] = STONESKIN,
    [10406] = STONESKIN_TOTEM,
    [10407] = STONESKIN_TOTEM,
    [10408] = STONESKIN_TOTEM,
    [10441] = STRENGTH_OF_EARTH,
    [10442] = STRENGTH_OF_EARTH_TOTEM,
    [10460] = HEALING_STREAM,
    [10461] = HEALING_STREAM,
    [10462] = HEALING_STREAM_TOTEM,
    [10463] = HEALING_STREAM_TOTEM,
    [10476] = FROST_RESISTANCE,
    [10477] = FROST_RESISTANCE,
    [10478] = FROST_RESISTANCE_TOTEM,
    [10479] = FROST_RESISTANCE_TOTEM,
    [10491] = MANA_SPRING,
    [10493] = MANA_SPRING,
    [10494] = MANA_SPRING,
    [10495] = MANA_SPRING_TOTEM,
    [10496] = MANA_SPRING_TOTEM,
    [10497] = MANA_SPRING_TOTEM,
    [10521] = FLAMETONGUE_TOTEM_EFFECT,
    [10526] = FLAMETONGUE_TOTEM,
    [10534] = FIRE_RESISTANCE,
    [10535] = FIRE_RESISTANCE,
    [10537] = FIRE_RESISTANCE_TOTEM,
    [10538] = FIRE_RESISTANCE_TOTEM,
    [10595] = NATURE_RESISTANCE_TOTEM,
    [10596] = NATURE_RESISTANCE,
    [10598] = NATURE_RESISTANCE,
    [10599] = NATURE_RESISTANCE,
    [10600] = NATURE_RESISTANCE_TOTEM,
    [10601] = NATURE_RESISTANCE_TOTEM,
    [10607] = WINDFURY_TOTEM_EFFECT,
    [10611] = WINDFURY_TOTEM_EFFECT,
    [10613] = WINDFURY_TOTEM,
    [10614] = WINDFURY_TOTEM,
    [10626] = GRACE_OF_AIR,
    [10627] = GRACE_OF_AIR_TOTEM,
    [10898] = POWER_WORD_SHIELD,
    [10899] = POWER_WORD_SHIELD,
    [10900] = POWER_WORD_SHIELD,
    [10901] = POWER_WORD_SHIELD,
    [10927] = RENEW,
    [10928] = RENEW,
    [10929] = RENEW,
    [10937] = POWER_WORD_FORTITUDE,
    [10938] = POWER_WORD_FORTITUDE,
    [10957] = SHADOW_PROTECTION,
    [10958] = SHADOW_PROTECTION,
    [11549] = BATTLE_SHOUT,
    [11550] = BATTLE_SHOUT,
    [11551] = BATTLE_SHOUT,
    [11743] = DETECT_GREATER_INVISIBILITY,
    [11766] = BLOOD_PACT,
    [11767] = BLOOD_PACT,
    [14752] = DIVINE_SPIRIT,
    [14818] = DIVINE_SPIRIT,
    [14819] = DIVINE_SPIRIT,
    [15036] = FLAMETONGUE_TOTEM_EFFECT,
    [15107] = WINDWALL_TOTEM,
    [15108] = WINDWALL,
    [15109] = WINDWALL,
    [15110] = WINDWALL,
    [15111] = WINDWALL_TOTEM,
    [15112] = WINDWALL_TOTEM,
    [16190] = MANA_TIDE_TOTEM,
    [16191] = MANA_TIDE,
    [16387] = FLAMETONGUE_TOTEM,
    [17354] = MANA_TIDE_TOTEM,
    [17355] = MANA_TIDE,
    [17359] = MANA_TIDE_TOTEM,
    [17360] = MANA_TIDE,
    [19506] = TRUESHOT_AURA,
    [19740] = BLESSING_OF_MIGHT,
    [19742] = BLESSING_OF_WISDOM,
    [19746] = CONCENTRATION_AURA,
    [19834] = BLESSING_OF_MIGHT,
    [19835] = BLESSING_OF_MIGHT,
    [19836] = BLESSING_OF_MIGHT,
    [19837] = BLESSING_OF_MIGHT,
    [19838] = BLESSING_OF_MIGHT,
    [19850] = BLESSING_OF_WISDOM,
    [19852] = BLESSING_OF_WISDOM,
    [19853] = BLESSING_OF_WISDOM,
    [19854] = BLESSING_OF_WISDOM,
    [19876] = SHADOW_RESISTANCE_AURA,
    [19888] = FROST_RESISTANCE_AURA,
    [19891] = FIRE_RESISTANCE_AURA,
    [19895] = SHADOW_RESISTANCE_AURA,
    [19896] = SHADOW_RESISTANCE_AURA,
    [19897] = FROST_RESISTANCE_AURA,
    [19898] = FROST_RESISTANCE_AURA,
    [19899] = FIRE_RESISTANCE_AURA,
    [19900] = FIRE_RESISTANCE_AURA,
    [19977] = BLESSING_OF_LIGHT,
    [19978] = BLESSING_OF_LIGHT,
    [19979] = BLESSING_OF_LIGHT,
    [20217] = BLESSING_OF_KINGS,
    [20707] = SOULSTONE_RESURRECTION,
    [20729] = BLESSING_OF_SACRIFICE,
    [20752] = CREATE_SOULSTONE_LESSER,
    [20755] = CREATE_SOULSTONE,
    [20756] = CREATE_SOULSTONE_GREATER,
    [20757] = CREATE_SOULSTONE_MAJOR,
    [20762] = SOULSTONE_RESURRECTION,
    [20763] = SOULSTONE_RESURRECTION,
    [20764] = SOULSTONE_RESURRECTION,
    [20765] = SOULSTONE_RESURRECTION,
    [20905] = TRUESHOT_AURA,
    [20906] = TRUESHOT_AURA,
    [20911] = BLESSING_OF_SANCTUARY,
    [20912] = BLESSING_OF_SANCTUARY,
    [20913] = BLESSING_OF_SANCTUARY,
    [20914] = BLESSING_OF_SANCTUARY,
    [21562] = PRAYER_OF_FORTITUDE,
    [21564] = PRAYER_OF_FORTITUDE,
    [21849] = GIFT_OF_THE_WILD,
    [21850] = GIFT_OF_THE_WILD,
    [23028] = ARCANE_BRILLIANCE,
    [24858] = MOONKIN_FORM,
    [24907] = MOONKIN_AURA,
    [25289] = BATTLE_SHOUT,
    [25290] = BLESSING_OF_WISDOM,
    [25291] = BLESSING_OF_MIGHT,
    [25299] = REJUVENATION,
    [25315] = RENEW,
    [25359] = GRACE_OF_AIR_TOTEM,
    [25360] = GRACE_OF_AIR,
    [25361] = STRENGTH_OF_EARTH_TOTEM,
    [25362] = STRENGTH_OF_EARTH,
    [25782] = GREATER_BLESSING_OF_MIGHT,
    [25890] = GREATER_BLESSING_OF_LIGHT,
    [25894] = GREATER_BLESSING_OF_WISDOM,
    [25895] = GREATER_BLESSING_OF_SALVATION,
    [25898] = GREATER_BLESSING_OF_KINGS,
    [25899] = GREATER_BLESSING_OF_SANCTUARY,
    [25908] = TRANQUIL_AIR_TOTEM,
    [25909] = TRANQUIL_AIR,
    [25916] = GREATER_BLESSING_OF_MIGHT,
    [25918] = GREATER_BLESSING_OF_WISDOM,
    [27681] = PRAYER_OF_SPIRIT,
    [27683] = PRAYER_OF_SHADOW_PROTECTION,
    [27841] = DIVINE_SPIRIT,
    [29166] = INNERVATE
}

local SPELL_INFO_CLASS = {
    [17] = 5,
    [131] = 7,
    [132] = 9,
    [139] = 5,
    [465] = 2,
    [467] = 11,
    [546] = 7,
    [592] = 5,
    [600] = 5,
    [604] = 8,
    [643] = 2,
    [693] = 9,
    [774] = 11,
    [782] = 11,
    [976] = 5,
    [1008] = 8,
    [1022] = 2,
    [1032] = 2,
    [1038] = 2,
    [1044] = 2,
    [1058] = 11,
    [1075] = 11,
    [1126] = 11,
    [1243] = 5,
    [1244] = 5,
    [1245] = 5,
    [1430] = 11,
    [1459] = 8,
    [1460] = 8,
    [1461] = 8,
    [2090] = 11,
    [2091] = 11,
    [2791] = 5,
    [2970] = 9,
    [3627] = 11,
    [3747] = 5,
    [5232] = 11,
    [5234] = 11,
    [5242] = 1,
    [5394] = 7,
    [5599] = 2,
    [5672] = 7,
    [5675] = 7,
    [5677] = 7,
    [5697] = 9,
    [6065] = 5,
    [6066] = 5,
    [6074] = 5,
    [6075] = 5,
    [6076] = 5,
    [6077] = 5,
    [6078] = 5,
    [6192] = 1,
    [6307] = 9,
    [6346] = 5,
    [6371] = 7,
    [6372] = 7,
    [6375] = 7,
    [6377] = 7,
    [6673] = 1,
    [6756] = 11,
    [6940] = 2,
    [7294] = 2,
    [7804] = 9,
    [7805] = 9,
    [8071] = 7,
    [8072] = 7,
    [8075] = 7,
    [8076] = 7,
    [8143] = 7,
    [8146] = 7,
    [8154] = 7,
    [8155] = 7,
    [8156] = 7,
    [8157] = 7,
    [8160] = 7,
    [8161] = 7,
    [8162] = 7,
    [8163] = 7,
    [8166] = 7,
    [8168] = 7,
    [8170] = 7,
    [8171] = 7,
    [8177] = 7,
    [8178] = 7,
    [8181] = 7,
    [8182] = 7,
    [8184] = 7,
    [8185] = 7,
    [8227] = 7,
    [8230] = 7,
    [8249] = 7,
    [8250] = 7,
    [8450] = 8,
    [8451] = 8,
    [8455] = 8,
    [8512] = 7,
    [8514] = 7,
    [8835] = 7,
    [8836] = 7,
    [8907] = 11,
    [8910] = 11,
    [8914] = 11,
    [8936] = 11,
    [8938] = 11,
    [8939] = 11,
    [8940] = 11,
    [8941] = 11,
    [9750] = 11,
    [9756] = 11,
    [9839] = 11,
    [9840] = 11,
    [9841] = 11,
    [9856] = 11,
    [9857] = 11,
    [9858] = 11,
    [9884] = 11,
    [9885] = 11,
    [9910] = 11,
    [10060] = 5,
    [10156] = 8,
    [10157] = 8,
    [10169] = 8,
    [10170] = 8,
    [10173] = 8,
    [10174] = 8,
    [10278] = 2,
    [10290] = 2,
    [10291] = 2,
    [10292] = 2,
    [10293] = 2,
    [10298] = 2,
    [10299] = 2,
    [10300] = 2,
    [10301] = 2,
    [10403] = 7,
    [10404] = 7,
    [10405] = 7,
    [10406] = 7,
    [10407] = 7,
    [10408] = 7,
    [10441] = 7,
    [10442] = 7,
    [10460] = 7,
    [10461] = 7,
    [10462] = 7,
    [10463] = 7,
    [10476] = 7,
    [10477] = 7,
    [10478] = 7,
    [10479] = 7,
    [10491] = 7,
    [10493] = 7,
    [10494] = 7,
    [10495] = 7,
    [10496] = 7,
    [10497] = 7,
    [10521] = 7,
    [10526] = 7,
    [10534] = 7,
    [10535] = 7,
    [10537] = 7,
    [10538] = 7,
    [10595] = 7,
    [10596] = 7,
    [10598] = 7,
    [10599] = 7,
    [10600] = 7,
    [10601] = 7,
    [10607] = 7,
    [10611] = 7,
    [10613] = 7,
    [10614] = 7,
    [10626] = 7,
    [10627] = 7,
    [10898] = 5,
    [10899] = 5,
    [10900] = 5,
    [10901] = 5,
    [10927] = 5,
    [10928] = 5,
    [10929] = 5,
    [10937] = 5,
    [10938] = 5,
    [10957] = 5,
    [10958] = 5,
    [11549] = 1,
    [11550] = 1,
    [11551] = 1,
    [11743] = 9,
    [11766] = 9,
    [11767] = 9,
    [14752] = 5,
    [14818] = 5,
    [14819] = 5,
    [15036] = 7,
    [15107] = 7,
    [15108] = 7,
    [15109] = 7,
    [15110] = 7,
    [15111] = 7,
    [15112] = 7,
    [16190] = 7,
    [16191] = 7,
    [16387] = 7,
    [17354] = 7,
    [17355] = 7,
    [17359] = 7,
    [17360] = 7,
    [19506] = 3,
    [19740] = 2,
    [19742] = 2,
    [19746] = 2,
    [19834] = 2,
    [19835] = 2,
    [19836] = 2,
    [19837] = 2,
    [19838] = 2,
    [19850] = 2,
    [19852] = 2,
    [19853] = 2,
    [19854] = 2,
    [19876] = 2,
    [19888] = 2,
    [19891] = 2,
    [19895] = 2,
    [19896] = 2,
    [19897] = 2,
    [19898] = 2,
    [19899] = 2,
    [19900] = 2,
    [19977] = 2,
    [19978] = 2,
    [19979] = 2,
    [20217] = 2,
    [20707] = 9,
    [20729] = 2,
    [20752] = 9,
    [20755] = 9,
    [20756] = 9,
    [20757] = 9,
    [20762] = 9,
    [20763] = 9,
    [20764] = 9,
    [20765] = 9,
    [20905] = 3,
    [20906] = 3,
    [20911] = 2,
    [20912] = 2,
    [20913] = 2,
    [20914] = 2,
    [21562] = 5,
    [21564] = 5,
    [21849] = 11,
    [21850] = 11,
    [23028] = 8,
    [24858] = 11,
    [24907] = 11,
    [25289] = 1,
    [25290] = 2,
    [25291] = 2,
    [25299] = 11,
    [25315] = 5,
    [25359] = 7,
    [25360] = 7,
    [25361] = 7,
    [25362] = 7,
    [25782] = 2,
    [25890] = 2,
    [25894] = 2,
    [25895] = 2,
    [25898] = 2,
    [25899] = 2,
    [25908] = 7,
    [25909] = 7,
    [25916] = 2,
    [25918] = 2,
    [27681] = 5,
    [27683] = 5,
    [27841] = 4,
    [29166] = 11
}

local SPELL_INFO_RACE = {
    [6346] = 3
}

local SPELL_INFO_TALENT = {
    [10060] = {1, 15, 7, 2},
    [19506] = {2, 14, 7, 2},
    [20217] = {2, 6, 3, 1},
    [20911] = {2, 12, 5, 2},
    [20912] = {2, 12, 5, 2},
    [20913] = {2, 12, 5, 2},
    [20914] = {2, 12, 5, 2},
    [25898] = {2, 6, 3, 1},
    [25899] = {2, 12, 5, 2}
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
        },
        {
            21562,
            21562
        },
        {
            21564,
            21564
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
    },
    {
        {
            546,
            546
        }
    },
    {
        {
            10060,
            10060
        }
    },
    {
        {
            1126,
            1126
        },
        {
            5232,
            5232
        },
        {
            6756,
            6756
        },
        {
            5234,
            5234
        },
        {
            8907,
            8907
        },
        {
            9884,
            9884
        },
        {
            9885,
            9885
        },
        {
            21849,
            21849
        },
        {
            21850,
            21850
        }
    },
    {
        {
            29166,
            29166
        }
    }
}

local function normalize(key)
    return tonumber(key) or type(key) == "string" and strlower(strtrim(strmatch(key, "!?(.*)"))) or key
end

local DatabaseMetatable = {
    __newindex = function(t, k, v)
        return rawset(t, normalize(k), v)
    end,
    __index = function(t, k)
        return rawget(t, normalize(k))
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

function BuffFamily.prototype:GetClassID()
    return self.buff:GetClassID()
end

function BuffFamily.prototype:GetClassName()
    return self.buff:GetClassName()
end

function BuffFamily.prototype:GetRaceID()
    return self.buff:GetRaceID()
end

function BuffFamily.prototype:GetRaceName()
    return self.buff:GetRaceName()
end

function BuffFamily.prototype:GetTalentLocation()
    return self.buff:GetTalentLocation()
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
    assert(GetLocale() ~= "enUS" or data:GetSpellName() == SPELL_INFO_NAME[data:GetSpellID()])
    return {
        id = data:GetSpellID(),
        name = GetLocale() ~= "enUS" and data:GetSpellName() or SPELL_INFO_NAME[data:GetSpellID()],
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

function Buff.prototype:GetClassID()
    return SPELL_INFO_CLASS[self.spell.id]
end

do
    local CLASS_INFO = {
        [1] = {"Warrior", "WARRIOR"},
        [2] = {"Paladin", "PALADIN"},
        [3] = {"Hunter", "HUNTER"},
        [4] = {"Rogue", "ROGUE"},
        [5] = {"Priest", "PRIEST"},
        [7] = {"Shaman", "SHAMAN"},
        [8] = {"Mage", "MAGE"},
        [9] = {"Warlock", "WARLOCK"},
        [11] = {"Druid", "DRUID"}
    }

    function Buff.prototype:GetClassName(enUS)
        if enUS then
            return unpack(CLASS_INFO[self:GetClassID()])
        end

        local classInfo = C_CreatureInfo.GetClassInfo(self:GetClassID())
        return classInfo.className, classInfo.classFile
    end
end

function Buff.prototype:GetRaceID()
    return SPELL_INFO_RACE[self.spell.id]
end

do
    local RACE_INFO = {
        [1] = {"Human", "Human"},
        [2] = {"Orc", "Orc"},
        [3] = {"Dwarf", "Dwarf"},
        [4] = {"Night Elf", "NightElf"},
        [5] = {"Undead", "Scourge"},
        [6] = {"Tauren", "Tauren"},
        [7] = {"Gnome", "Gnome"},
        [8] = {"Troll", "Troll"}
    }

    function Buff.prototype:GetRaceName(enUS)
        if enUS then
            return unpack(RACE_INFO[self:GetRaceID()])
        end

        local raceInfo = C_CreatureInfo.GetRaceInfo(self:GetRaceID())
        return raceInfo.raceName, raceInfo.clientFileString
    end
end

function Buff.prototype:GetTalentLocation()
    if SPELL_INFO_TALENT[self.spell.id] then
        return unpack(SPELL_INFO_TALENT[self.spell.id])
    end
end

function Buff.prototype:GetSpellID()
    return self.spell.id
end

function Buff.prototype:GetSpellName(enUS)
    return enUS and SPELL_INFO_NAME[self.spell.id] or self.spell.name
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
    return enUS and SPELL_INFO_NAME[self.aura.id] or self.aura.name
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

local BuffMeChatTypeInfo = {r = 1.0, g = 0.84, b = 0.73, flashTab = true, flashTabOnGeneral = true, sticky = 0}

local function BuffMe_Print(...)
    local message = strjoin(" ", "\124cffff8080<\124cffff4040BuffMe\124cffff8080>\124r", tostringall(...))
    local tab

    for i = 1, NUM_CHAT_WINDOWS do
        local name, _, _, _, _, _, shown = FCF_GetChatWindowInfo(i)
        local chatFrame = _G["ChatFrame" .. i]
        if chatFrame then
            if shown or chatFrame.isDocked then
                if name == "BuffMe" then
                    tab = i
                    break
                end
            end
        end
    end

    local info = BuffMeChatTypeInfo
    local chatFrame = tab and _G["ChatFrame" .. tab] or DEFAULT_CHAT_FRAME

    chatFrame:AddMessage(message, info.r, info.g, info.b)

    if not chatFrame:IsShown() then
        if chatFrame == DEFAULT_CHAT_FRAME and info.flashTabOnGeneral or chatFrame ~= DEFAULT_CHAT_FRAME and info.flashTab then
            FCF_StartAlertFlash(chatFrame)
        end
    end
end

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
eventFrame:SetScript(
    "OnEvent",
    function(self, event, prefix, text, channel, sender)
        if prefix ~= "BuffMe" then
            return
        end

        local silent = false
        local buffName, unitName = strsplit(":", text)
        local buffFamily = BuffFamily:Get(buffName)

        if not buffFamily then
            return
        else
            local _, _, classID = UnitClass("player")
            if classID ~= buffFamily:GetClassID() then
                return
            end

            local buffFamilyRaceID = buffFamily:GetRaceID()
            if buffFamilyRaceID then
                local _, _, raceID = UnitRace("player")
                if raceID ~= buffFamilyRaceID then
                    return
                end
            end

            local buffFamilyTalentTab, buffFamilyTalentIndex = buffFamily:GetTalentLocation()
            if buffFamilyTalentTab then
                local _, _, _, _, rank = GetTalentInfo(buffFamilyTalentTab, buffFamilyTalentIndex)
                if not rank or rank == 0 then
                    return
                end
            end
        end

        unitName = Ambiguate(unitName or sender, "none")

        local _, unitClass = UnitClass(unitName)
        local _, buffFamilyClass = buffFamily:GetClassName(true)

        local who = unitName
        local who2 = unitName
        local what = RAID_CLASS_COLORS[buffFamilyClass]:WrapTextInColorCode(buffFamily:GetName(true))
        local what2 = RAID_CLASS_COLORS[buffFamilyClass]:WrapTextInColorCode(buffFamily:GetName())

        local raidIndex = UnitInRaid(unitName)
        if raidIndex then
            local _, _, subgroup = GetRaidRosterInfo(raidIndex)
            who = format("%s (Group %d)", unitName, subgroup)
            who2 = format("%s (" .. GROUP_NUMBER .. ")", unitName, subgroup)
        end

        if unitClass then
            who = RAID_CLASS_COLORS[unitClass]:WrapTextInColorCode(who)
            who2 = RAID_CLASS_COLORS[unitClass]:WrapTextInColorCode(who2)
        end

        if not silent then
            BuffMe_Print(format("%s requested %s.", who, what))
        end

        local duration = 5

        BuffMeNotice_AddMessage(BuffMeWarningFrame, format("%s   >>>   %s", what2, who2), BuffMeChatTypeInfo, duration)

        local unitFrame = LibGetFrame.GetUnitFrame(unitName)

        if unitFrame then
            BuffMeButton_Glow(unitFrame, duration)
        end

        PlaySoundFile("Sound\\Interface\\RaidWarning.ogg")
    end
)

local function SendAddonMessage(...)
    return ChatThrottleLib:SendAddonMessage("ALERT", ...)
end

local function BuffMe(cmd)
    local unit = "player"
    local unitName = GetUnitName(unit, true)
    local result, target = SecureCmdOptionParse(cmd)
    local targetName
    local duration = nil
    local silent = false

    if target then
        if not UnitExists(target) or not GetUnitName(target, true) then
            BuffMe_Print(format("\124cffff0000Unknown target '\124r%s\124cffff0000'", target))
            return
        end

        targetName = GetUnitName(target, true)

        if not UnitIsPlayer(target) or not UnitCanAssist("player", target) then
            BuffMe_Print(format("\124cffff0000Invalid target '\124r%s\124cffff0000'", targetName))
            return
        end
    end

    for _, spell in ipairs({strsplit(",", result)}) do
        local buffFamily = BuffFamily:Get(spell)

        if not buffFamily then
            BuffMe_Print(format("\124cffff0000Unknown buff '\124r%s\124cffff0000'", spell))
            return
        end

        do
            local auraName, expirationTime, unitCaster, spellID, _

            do
                local index = 1

                while true do
                    auraName, _, _, _, _, expirationTime, unitCaster, _, _, spellID = UnitBuff(unit, index)

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
                        _, expirationTime = LibClassicDurations:GetAuraDurationByUnit(unit, spellID, unitCaster, auraName)
                    end
                end

                if not duration or expirationTime == 0 or expirationTime > GetTime() + duration then
                    if not silent then
                        local _, buffFamilyClass = buffFamily:GetClassName(true)
                        local what = RAID_CLASS_COLORS[buffFamilyClass]:WrapTextInColorCode(auraName)

                        if UnitIsUnit(unit, "player") then
                            BuffMe_Print(format("You already have %s.", what))
                        else
                            local who = unitName

                            local raidIndex = UnitInRaid(unit)
                            if raidIndex then
                                local _, _, subgroup = GetRaidRosterInfo(raidIndex)
                                who = format("%s (Group %d)", unitName, subgroup)
                            end

                            local _, class = UnitClass(unit)
                            if class then
                                who = RAID_CLASS_COLORS[class]:WrapTextInColorCode(who)
                            end

                            BuffMe_Print(format("%s already has %s.", who, what))
                        end
                    end

                    return
                end
            end
        end

        local buffFamilyName = buffFamily:GetName(true)
        local buffFamilyClassID = buffFamily:GetClassID()
        local _, buffFamilyClass = buffFamily:GetClassName(true)
        local _, targetClass, targetClassID

        if target then
            local targetKnowsBuff = true

            _, targetClass, targetClassID = UnitClass(target)

            if targetClass then
                if targetClassID ~= buffFamilyClassID then
                    targetKnowsBuff = false
                end
            end

            if targetKnowsBuff then
                local buffFamilyRaceID = buffFamily:GetRaceID()
                if buffFamilyRaceID then
                    local _, targetRace, targetRaceID = UnitClass(target)
                    if targetRace and targetRaceID ~= buffFamilyRaceID then
                        targetKnowsBuff = false
                    end
                end
            end

            if targetKnowsBuff then
                local buffFamilyTalentTab, _, buffFamilyTalentTier, buffFamilyTalentColumn = buffFamily:GetTalentLocation()
                if buffFamilyTalentTab then
                    local talents = Details and Details:GetTalents(UnitGUID(target))
                    if talents then
                        targetKnowsBuff = false
                        for _, talent in ipairs(talents) do
                            local _, rank, tier, column, tabIndex = unpack(talent)
                            if tabIndex == buffFamilyTalentTab and tier == buffFamilyTalentTier and column == buffFamilyTalentColumn then
                                if rank and rank > 0 then
                                    targetKnowsBuff = true
                                    break
                                end
                            end
                        end
                    end
                end
            end

            if not targetKnowsBuff then
                if not silent then
                    local who = RAID_CLASS_COLORS[targetClass]:WrapTextInColorCode(targetName)
                    local what = RAID_CLASS_COLORS[buffFamilyClass]:WrapTextInColorCode(buffFamilyName)

                    BuffMe_Print(format("%s cannot buff %s!", who, what))
                end

                return
            end
        end

        if not silent then
            local what = RAID_CLASS_COLORS[buffFamilyClass]:WrapTextInColorCode(buffFamilyName)

            if not target then
                BuffMe_Print(format("Requesting %s...", what))
            else
                local who = targetName

                local raidIndex = UnitInRaid(target)
                if raidIndex then
                    local _, _, subgroup = GetRaidRosterInfo(raidIndex)
                    who = format("%s (Group %d)", targetName, subgroup)
                end

                if targetClass then
                    who = RAID_CLASS_COLORS[targetClass]:WrapTextInColorCode(who)
                end

                BuffMe_Print(format("Requesting %s from %s...", what, who))
            end
        end

        local message

        if UnitIsUnit(unit, "player") then
            message = buffFamily:GetID()
        else
            message = format("%s:%s-%s", buffFamily:GetID(), gsub(unitName, "%-.*", ""), GetNormalizedRealmName())
        end

        if target then
            SendAddonMessage("BuffMe", message, "WHISPER", targetName)
        else
            if GetNumGroupMembers() == 0 then
                SendAddonMessage("BuffMe", message, "WHISPER", GetUnitName("player", true))
            else
                SendAddonMessage("BuffMe", message, IsInRaid() and "RAID" or "PARTY")
            end
        end
    end
end

local loadFrame = CreateFrame("Frame")
loadFrame:RegisterEvent("ADDON_LOADED")
loadFrame:SetScript(
    "OnEvent",
    function(self, event, addOnName)
        if addOnName ~= "BuffMe" then
            return
        end

        self:UnregisterEvent("ADDON_LOADED")

        local function loadNext(k, buffIDs)
            if not k then
                if FCF_GetNumActiveChatFrames() < NUM_CHAT_WINDOWS then
                    local tab

                    for i = 1, NUM_CHAT_WINDOWS do
                        local name, _, _, _, _, _, shown = FCF_GetChatWindowInfo(i)
                        local chatFrame = _G["ChatFrame" .. i]
                        if chatFrame then
                            if shown or chatFrame.isDocked then
                                if name == "BuffMe" then
                                    tab = i
                                    break
                                end
                            end
                        end
                    end

                    if not tab then
                        local selectedChatFrame = SELECTED_CHAT_FRAME
                        FCF_OpenNewWindow("BuffMe", true)
                        FCF_Tab_OnClick(selectedChatFrame, "LeftButton")
                    end
                end

                SLASH_BUFFME1 = "/buffme"
                SlashCmdList["BUFFME"] = BuffMe

                C_ChatInfo.RegisterAddonMessagePrefix("BuffMe")

                eventFrame:RegisterEvent("CHAT_MSG_ADDON")
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
                            loadNext(next(BUFFS, k))
                        end
                    )
                end
            )
        end

        loadNext(next(BUFFS))
    end
)

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
