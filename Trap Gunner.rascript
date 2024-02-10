// Trap Gunner
// #ID = 14381

// 00: Detonator
// 01: Bomb
// 02: Mine
// 03: Gas
// 04: PitFall
// 05: ForcePanel
// 06: Shooting1
// 07: Shooting2
// 08: Punch
// 09: Unit
// 0a: SparkBit
// 0b: Missile
// 0c: Laser
// 0d: ExplosiveBox
// 0e: Falling
// 0f: Life Judgment


// ==============================
//            Memory             
// ==============================
Difficulty = byte(0x124EA0)
Mode = byte(0x1093DC)
Character_1P = byte(0x124eb2)
Character_2P = byte(0x1258ba)
HP_1P = word(0x12583A)
HP_2P = word(0x126242)
Stage = byte(0x1093e8)
Fight_Time = dword(0x1093D8)
Invulnerability_Frames_1P = byte(0x12585E)
Invulnerability_Frames_2P = byte(0x126266)
Gas_Time_2P = byte(0x126268)
Color_1P = byte(0x124eb9)

Demo = byte(0x1093DA)
Damage_Type_2P = byte(0x12625E)
Map = byte(0x1093c8)
Screen = byte(0x157004)
StageSelect = byte(0x1093cc)
EditTrapUnlocked = byte(0x124b2e)

ScreenType = byte(0x124ea4)
Stance_1P = byte(0x125843)


TrapSlots_Total_2P = {
    "1": byte(0x126227),
    "2": byte(0x12622a),
    "3": byte(0x12622d),
    "4": byte(0x126230),
    "5": byte(0x126230)
}

GameBeaten = {
    "Van Raily": byte(0x124b27),
    "John Bishous": byte(0x124b28),
    "Tico": byte(0x124b29),
    "Lou Riche": byte(0x124b2a),
    "Abdoll Relin": byte(0x124b2b),
    "Tenrou Ugetsu": byte(0x124b2c)
}
Stage9NormalRecords = {
    "Van Raily": dword(0x124c44),
    "John Bishous": dword(0x124c6c),
    "Tico": dword(0x124c94),
    "Lou Riche": dword(0x124cbc),
    "Abdoll Relin": dword(0x124ce4),
    "Tenrou Ugetsu": dword(0x124d0c)
}

Stage9HardRecords = {
    "Van Raily": dword(0x124D34),
    "John Bishous": dword(0x124d5c),
    "Tico": dword(0x124d84),
    "Lou Riche": dword(0x124dac),
    "Abdoll Relin": dword(0x124dd4),
    "Tenrou Ugetsu": dword(0x124dfc)
}
// ==============================
//             Arrays             
// ==============================
CharacterList = {
    "Van Raily": 0,
    "John Bishous": 1,
    "Tico": 2,
    "Lou Riche": 3,
    "Abdoll Relin": 4,
    "Tenrou Ugetsu": 5,
    "Rem": 6,
    "Dyn": 7,
    "Elg": 8,
    "Stilb": 9
}

IconList = {
    "Van Raily": byte(0x124E92),
    "John Bishous": byte(0x124e93),
    "Tico": byte(0x124e94),
    "Lou Riche": byte(0x124e95),
    "Abdoll Relin": byte(0x124e96),
    "Tenrou Ugetsu": byte(0x124e97)
}

DifficultyList = {
    "Easy": 0,
    "Normal": 1,
    "Hard": 2
}

ModeList = {
    "Tutorial": 0,
    "Story": 1,
    "VS COM": 2,
    "VS Man": 3,
    "Record": 4,
    "Options": 5
}


StageList = {
    "Stage 1": 0,
    "Stage 2": 1,
    "Stage 3": 2,
    "Stage 4": 3,
    "Stage 5": 4,
    "Stage 6": 5,
    "Stage 7": 6,
    "Stage 8": 7,
    "Stage 9": 8
}

StageSelectList = {
    "Stage 1": 0,
    "Stage 2": 1,
    "Stage 3": 2,
    "Stage 4": 3,
    "Stage 5": 4,
    "Stage 6": 5,
    "Stage 7": 6,
    "Stage 8": 7,
    "Stage 9": 8,
    "Ending": 9
}

DamageTypeList = {
    "Detonator": 0,
    "Bomb": 1,
    "Mine": 2,
    "Gas": 3,
    "PitFall": 4,
    "ForcePanel": 5,
    "Shooting1": 6,
    "Shooting2": 7,
    "Punch": 8,
    "Unit": 9,
    "SparkBit": 10,
    "Missile": 11,
    "Laser": 12,
    "ExplosiveBox": 13,
    "Falling": 14,
    "Life Judgment": 15
}

ScreenList = {
    "FMV": 0x00,
    "Battle": 0x01,
    "Van Raily Ending": 0x05,
    "Main-Menu": 0x06,
    "Mission Briefing": 0x08,
    "Victory Screen": 0x09,
    "Load": 0x10,
    "Post-Credits Cutscene": 0x20,
    "Character Select": 0x42
}


// ==============================
//            Functions             
// ==============================
function default_difficulties() => Difficulty >= DifficultyList["Normal"] //Normal or Hard
function in_story_mode() => Mode == ModeList["Story"]
function is_demo() => Demo == 1
function hero_took_damage() => HP_1P < 1000
function get_ending() => (Stage == StageList["Stage 9"] && Screen == ScreenList["Victory Screen"])
function cheat_protection() => Screen != ScreenList["Main Menu"]
function get_ending_character() => StageSelect == StageSelectList["Ending"]
function is_vs_cpu() => (Mode != ModeList["VS Man"] && Screen == ScreenList["Battle"])
function battle_starts() => once(Screen == ScreenList["Battle"])
function boss_battle_starts() => once(Screen == ScreenList["Battle"] && Stage == StageList["Stage 9"])
function in_battle() => Screen == ScreenList["Battle"]
function is_searching_1P() => Stance_1P == 4
function is_screentype_wide() => ScreenType == 1
function no_hard_beaten() => (
                                prior(Stage9HardRecords["Van Raily"]) == 180000 &&
                                prior(Stage9HardRecords["John Bishous"]) == 180000 &&
                                prior(Stage9HardRecords["Tico"]) == 180000 &&
                                prior(Stage9HardRecords["Lou Riche"]) == 180000 &&
                                prior(Stage9HardRecords["Abdoll Relin"]) == 180000 &&
                                prior(Stage9HardRecords["Tenrou Ugetsu"]) == 180000)
//function battle_starts() => once(HP_1P == 1000 && Fight_Time == 12600)

//function damageless_start() => once(battle_starts())
function damageless_finalboss_start() => once(HP_1P == 1000 && HP_2P == 1640 && Fight_Time == 18000)
function damageless_cancel() => never(hero_took_damage() || Screen != ScreenList["Battle"])
function damageless_submit() => trigger_when(HP_2P == 0)



function endingCheevo(cheevoTitle, choosenCharacter) {
    achievement(
        title = cheevoTitle,
        points = 10,
        description = format("Beat Story Mode with {0} on Normal or Hard", choosenCharacter),
        trigger = in_story_mode() && 
                  default_difficulties() && 
                  Character_1P == CharacterList[choosenCharacter] && 
                  IconList[choosenCharacter] == 0 && // Save Protection
                  get_ending()
    )
}

function damagelessRivalCheevo(cheevoTitle, choosenCharacter, rival) {
    achievement(
        title = cheevoTitle,
        points = 25,
        description = format("Defeat {0} on Story Mode as {1} without taking Damage (Normal or Hard)", rival, choosenCharacter),
        trigger = in_story_mode() && 
                  default_difficulties() && 
                  Character_1P == CharacterList[choosenCharacter] && 
                  Stage == StageList["Stage 8"] && 
                  battle_starts() && 
                  damageless_cancel() && 
                  damageless_submit()
    )
}

// ==============================
//           Achievements             
// ==============================
endingCheevo("Feared Agent", "Van Raily")
endingCheevo("Burn! Burn!", "John Bishous")
endingCheevo("Army of Helper Androids", "Tico")
endingCheevo("It's Finally Over", "Lou Riche")
endingCheevo("Cruel Mutant", "Abdoll Relin")
endingCheevo("It's Not Over Yet", "Tenrou Ugetsu")

damagelessRivalCheevo("Good-bye...", "Van Raily", "Rem")
damagelessRivalCheevo("You Were a Fine Lieutenant!", "John Bishous", "Dyn")
damagelessRivalCheevo("Unscathed Vendetta", "Tenrou Ugetsu", "Elg")

achievement(
        title = "-----Different color",
        points = 3,
        description = "Unlock and play with any of the extra costume",
        trigger =   Screen == ScreenList["Battle"] &&
                    !is_demo() && 
                    (
                        Stage9NormalRecords["Tico"] != 180000 ||
                        Stage9NormalRecords["Lou Riche"] != 180000 ||
                        Stage9NormalRecords["Abdoll Relin"] != 180000 ||
                        Stage9HardRecords["Tico"] != 180000 ||
                        Stage9HardRecords["Lou Riche"] != 180000 ||
                        Stage9HardRecords["Abdoll Relin"] != 180000
                    ) &&
                    Color_1P == 2
                    
            )


    //  achievement(
    //     title = "-----Edit Trap",
    //     points = 5,
    //     description = "Unlock Edit Trap",
    //     trigger =   (
    //                     GameBeaten["Van Raily"] == 1 &&
    //                     GameBeaten["John Bishous"] == 1 &&
    //                     GameBeaten["Tico"] == 1 &&
    //                     GameBeaten["Lou Riche"] == 1 &&
    //                     GameBeaten["Abdoll Relin"] == 1 &&
    //                     GameBeaten["Tenrou Ugetsu"] == 1
    //                 ) &&
    //                 EditTrapUnlocked == 1 &&
    //                 Screen != ScreenList["Main-Menu"] &&
    //                 Screen != ScreenList["Load"]
    //   )

achievement(
        title = "Iron Will",
        points = 10,
        description = "Beat Story Mode without using continues or restarting (Normal or Hard)",
        trigger =   once(
                        in_story_mode() &&
                        Stage == StageList["Stage 1"] &&
                        Screen == ScreenList["Mission Briefing"]
                    ) &&
                    never(
                        Screen == ScreenList["Main-Menu"] ||
                        Screen == ScreenList["Character Select"] ||
                        HP_1P == 0
                        // (Stage != StageList["Stage 1"] && HP_1P == 0)
                    ) &&
                    trigger_when(
                        get_ending()
                    )
)

// Hard Mode
 achievement(
        title = "CRACK-DOWN!",
        points = 50,
        description = "Beat Story Mode on Hard",
        trigger = in_story_mode() && 
                  Difficulty == DifficultyList["Hard"] &&
                  get_ending()
    )

achievement(
        title = "Master of Evasion",
        points = 50,
        description = "Defeat Stilb without taking damage (Normal or Hard)",
        trigger =   in_story_mode() &&
                    default_difficulties() && 
                    Stage == StageList["Stage 9"] && 
                    battle_starts() &&  
                    damageless_cancel() && 
                    damageless_submit()
)

// achievement(
//         title = "-----Edit Trap!",
//         points = 10,
//         description = "Unlock Edit Trap",
//         trigger =   default_difficulties() && 
//                     Character_2P == CharacterList["Stilb"] && 
//                     damageless_finalboss_start() &&  
//                     damageless_cancel() && 
//                     damageless_submit()
// )

achievement(
        title = "With a Little Help From My Friends",
        points = 10,
        description = "Use your traps to make your opponent get hit by any stage enviroment (Story or VS COM)",
        trigger =   is_vs_cpu() &&  
                    !is_demo() && 
                    
                        (
                        Damage_Type_2P == DamageTypeList["SparkBit"] || 
                        Damage_Type_2P == DamageTypeList["Missile"] || 
                        Damage_Type_2P == DamageTypeList["Laser"] || 
                        Damage_Type_2P == DamageTypeList["ExplosiveBox"]
                        ) 
                        &&
                        (
                        prev(Damage_Type_2P) == DamageTypeList["PitFall"]
                        ||
                        prev(Damage_Type_2P) == DamageTypeList["ForcePanel"]
                        )

                    
                  
                    
            )

achievement(
    title = "Ingenious Strategist",
    points = 10,
    description = "Make a combo using 5 different traps (Bomb doesn't count)",
    trigger =     is_vs_cpu() &&
                  !is_demo() &&
                  tally(5, 
                        once(Damage_Type_2P == DamageTypeList["Detonator"]), 
                        once(Damage_Type_2P == DamageTypeList["Mine"]), 
                        once(Damage_Type_2P == DamageTypeList["PitFall"]), 
                        once(Damage_Type_2P == DamageTypeList["ForcePanel"]), 
                        once(Gas_Time_2P > 0)
                        ) && 
                  never(Damage_Type_2P == DamageTypeList["Life Judgment"])
)

achievement(
    title = "Perfect Disarmament",
    points = 5,
    description = "Disarm 10 traps on the same match (Story or VS COM)",
    trigger =     is_vs_cpu() &&
                  !is_demo() &&
                  tally(10, 
                        repeated(10, TrapSlots_Total_2P["1"] < prev(TrapSlots_Total_2P["1"])), 
                        repeated(10, TrapSlots_Total_2P["2"] < prev(TrapSlots_Total_2P["2"])), 
                        repeated(10, TrapSlots_Total_2P["3"] < prev(TrapSlots_Total_2P["3"])), 
                        repeated(10, TrapSlots_Total_2P["4"] < prev(TrapSlots_Total_2P["4"])), 
                        repeated(10, TrapSlots_Total_2P["5"] < prev(TrapSlots_Total_2P["5"]))
                        ) && 
                  never(Screen != ScreenList["Battle"])
)


    achievement(
        title = "Mastermind",
        points = 10,
        description = "Win a match not using any kind of explosives",
        trigger =   once(battle_starts() && is_vs_cpu() && !is_demo()) && 
                    never(Damage_Type_2P != DamageTypeList["Detonator"] && Damage_Type_2P != DamageTypeList["Mine"]) && 
                    HP_2P == 0
                                    
                )

achievement(
    title = "No peeking!",
    points = 5,
    description = "Win a match with Camera View set as Wide and without using the Search button",
    trigger =     is_vs_cpu() &&
                  default_difficulties() &&
                  !is_demo() &&
                  ScreenType == 0 && // Wide
                  battle_starts() &&
                  never(is_searching_1P()) &&
                  trigger_when(HP_2P == 0)
)





// ==============================
//           Rich Presence             
// ==============================

ModeLookup = {
    00 : "Tutorial",
    01 : "Story",
    02 : "VS COM",
    03 : "VS Man",
    04 : "Record",
    05 : "Options",
}

StageLookup = {
    0: "Stage 1",
    1: "Stage 2",
    2: "Stage 3",
    3: "Stage 4",
    4: "Stage 5",
    5: "Stage 6",
    6: "Stage 7",
    7: "Stage 8",
    8: "Stage 9",
    9: "Ending"
}

DifficultyLookup = {
    0: "Easy",
    1: "Normal", 
    2: "Hard"
}

MapLookup = {
    0: "Depot (Type 1)",
    1: "Depot (Type 2)",
    2: "Depot (Type 3)",
    4: "Port (Type 1)",
    5: "Port (Type 2)",
    6: "Port (Type 3)",
    8: "Basement (Type 1)",
    9: "Basement (Type 2)",
    10: "Basement (Type 3)",
    12: "Museum (Type 1)",
    13: "Museum (Type 2)",
    14: "Museum (Type 3)",
    16: "Sanctuary (Type 1)",
    17: "Sanctuary (Type 2)",
    18: "Sanctuary (Type 3)",
    20: "Clock Tower (Type 1)",
    21: "Clock Tower (Type 2)",
    22: "Clock Tower (Type 3)",
    24: "Factory (Type 1)",
    25: "Factory (Type 2)",
    26: "Factory (Type 3)",
    28: "Low Town (Type 1)",
    29: "Low Town (Type 2)",
    30: "Low Town (Type 3)",
    32: "Airport (Type 1)",
    33: "Airport (Type 2)",
    34: "Airport (Type 3)",
    36: "Canal Way (Type 1)",
    37: "Canal Way (Type 2)",
    38: "Canal Way (Type 3)",
    40: "Ninja House (Type 1)",
    41: "Ninja House (Type 2)",
    42: "Ninja House (Type 3)",
    44: "Uboat Dock (Type 1)",
    45: "Uboat Dock (Type 2)",
    46: "Uboat Dock (Type 3)",
    48: "Sky Garden",
    52: "Ring",
    56: "Maze",
    60: "Gain"
}

CharacterLookup = {
     0: "Van Raily",
     1: "John Bishous",
     2: "Tico",
     3: "Lou Riche",
     4: "Abdoll Relin",
     5: "Tenrou Ugetsu",
     6: "Rem",
     7: "Dyn",
     8: "Elg",
     9: "Stilb"
}

ScreenLookup = {
    0x01: "Battle",
    0x06: "Main-Menu",
    0x08: "Mission Briefing",
    0x42: "Character Select"
}

rich_presence_conditional_display(
    Screen == ScreenList["Main-Menu"],
    "Main-Menu"
)

rich_presence_conditional_display(
    Demo == 1,
    "Demonstration"
)

rich_presence_conditional_display(
    Mode == ModeList["Story"] && StageSelect == StageSelectList["Ending"],
    "Watching {0}'s ending",
    rich_presence_lookup("Character_1P", Character_1P, CharacterLookup)
)

rich_presence_conditional_display(
    Mode == ModeList["Story"] && (Screen == ScreenList["Battle"] || Screen == ScreenList["Mission Briefing"]),
    "Playing Story Mode with {0} at 🚩{1} ({2})",
    rich_presence_lookup("Character_1P", Character_1P, CharacterLookup),
    rich_presence_lookup("Stage", Stage, StageLookup),
    rich_presence_lookup("Difficulty", Difficulty, DifficultyLookup)
)

rich_presence_conditional_display(
    Screen == ScreenList["Character Select"],
    "Choosing character"
)

rich_presence_display(
    "{0} | {1} 🆚 {2} | {3}",
    rich_presence_lookup("Mode", Mode, ModeLookup),
    rich_presence_lookup("Character_1P", Character_1P, CharacterLookup),
    rich_presence_lookup("Character_2P", Character_2P, CharacterLookup),
    rich_presence_lookup("Map", Map, MapLookup)
)


// ==============================
//           Leaderboards             
// ==============================
function stage_timer() => word(0x138758)
function lb_timer_logic() => tally(0, stage_timer() != prev(stage_timer()), stage_timer() != prev(stage_timer()))
//function change_character() => Screen == ScreenList["Mission Briefing"] && Character_1P != prev(Character_1P)
//function change_stage() => Screen == ScreenList["Character Select"] && Stage != prev(Stage)


function speedrunCheevo(choosenDifficulty) {
    leaderboard(format("Beat Story Mode ({0})", choosenDifficulty), "Beat Story Mode in the shortest time",
           start =  in_story_mode() &&
                    Difficulty == DifficultyList[choosenDifficulty] &&
                    Stage == StageList["Stage 1"] &&
                    Screen == ScreenList["Mission Briefing"],
           cancel = Screen == ScreenList["Main-Menu"] || Screen == 
           ScreenList["Character Select"],
           submit = get_ending(),
           value  = lb_timer_logic(), 
           format = "FRAMES", lower_is_better=true
    )
}

speedrunCheevo("Easy")
speedrunCheevo("Normal")
speedrunCheevo("Hard")
