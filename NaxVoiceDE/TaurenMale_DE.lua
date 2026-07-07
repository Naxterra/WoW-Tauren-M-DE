local _, addon = ...

addon.VoiceSets = addon.VoiceSets or {}

addon.VoiceSets.TAUREN_MALE_DE = {
    locale = "deDE",
    raceFile = "TAUREN",
    sex = 2,
    label = "Tauren male German",

    muteFileDataIDs = {
        -- Classic/current male Tauren player exertions and roar.
        542440, -- taurenmalemainwoundd
        542441, -- taurenmalemainwoundcrita
        542442, -- taurenmalemainattackb
        542443, -- taurenmalemainattacka
        542444, -- taurenmalemainwoundb
        542445, -- taurenmalemainattackd
        542446, -- taurenmalemainattackc
        542447, -- taurenmalemaindeatha
        542448, -- taurenmalemainwounda
        542449, -- taurenmalemainwoundc
        542450, -- taurenmalemainjump
        542451, -- taurenmalemainland
        542508, -- characterroarstaurenmale

        -- Male Tauren emotes and combat barks.
        542887, -- taurenmalecry01
        542888, -- taurenmalewoundb
        542889, -- taurenmaleattacka
        542890, -- taurenmaleyawn01
        542891, -- taurenmalewoundc
        542892, -- taurenmaleattackd
        542893, -- taurenmalekiss01
        542894, -- taurenmalemoo01
        542895, -- taurenmaledeatha
        542896, -- taurenmalechoochoo01
        542897, -- taurenmaleattackc
        542898, -- taurenmalelaugh01
        542899, -- taurenmalewoundcrit
        542900, -- taurenmalesigh01
        542901, -- taurenmaleattackb
        542902, -- taurenmalewounda
        542903, -- taurenmalechicken01

        -- Male Tauren vocal emotes from sound/character/tauren/taurenvocalmale.
        543023, -- taurenmaleattackmytarget01
        543024, -- taurenmalehelp01
        543025, -- taurenmalecheer02
        543026, -- taurenmalepissed05
        543027, -- taurenmalecongratulations03
        543028, -- taurenmalehealme02
        543029, -- taurenmalehello03
        543030, -- taurenmaleyes02
        543031, -- taurenmaleflirt01
        543032, -- taurenmalehelp03
        543033, -- taurenmaleflirt05
        543034, -- taurenmalegoodbye03
        543035, -- taurenmalehello02
        543036, -- taurenmaleyes03
        543037, -- taurenmaleflirt06
        543038, -- taurenmalecongratulations01
        543039, -- taurenmalethankyou04
        543040, -- taurenmalecharge01
        543041, -- taurenmaleflee01
        543042, -- taurenmaleno01
        543043, -- taurenmalewaithere01
        543044, -- taurenmaleraspberry01
        543045, -- taurenmalewaithere03
        543046, -- taurenmaleyes01
        543047, -- taurenmalethankyou03
        543048, -- taurenmalefollowme01
        543049, -- taurenmaleoutofmana01
        543050, -- taurenmalefollowme02
        543051, -- taurenmalehelp02
        543052, -- taurenmaleflirt03
        543053, -- taurenmaleoutofmana02
        543054, -- taurenmaleincoming01
        543055, -- taurenmalepissed01
        543056, -- taurenmaleflee02
        543057, -- taurenmalecharge03
        543058, -- taurenmalepissed03
        543059, -- taurenmaleno03
        543060, -- taurenmalethankyou02
        543061, -- taurenmalegoodbye02
        543062, -- vo_pctaurenmaleroar01
        543063, -- taurenmaleincoming02
        543064, -- taurenmaleflirt04
        543065, -- taurenmalepissed04
        543066, -- taurenmaleyourewelcome03
        543067, -- taurenmaleopenfire02
        543068, -- taurenmalegoodbye01
        543069, -- taurenmalethankyou01
        543070, -- taurenmalecongratulations02
        543071, -- taurenmalecharge02
        543072, -- taurenmaleopenfire01
        543073, -- taurenmaleattackmytarget02
        543074, -- taurenmalehello01
        543075, -- taurenmalehealme01
        543076, -- taurenmalewaithere02
        543077, -- taurenmaleflirt02
        543078, -- taurenmalecheer01
        543079, -- taurenmaleyourewelcome02
        543080, -- taurenmaleno02
        543081, -- taurenmaleyourewelcome01
        543082, -- taurenmalepissed02
        1410374, -- vo_taurenmale_oops_01
        1410375, -- vo_taurenmale_sorry_01
        1410376, -- vo_taurenmale_taunt_01
        1410377, -- vo_taurenmale_threaten_01
        1410378, -- vo_taurenmale_whoa_01
        1502107, -- vo_taurenmale_forhorde_01

        -- Current male Tauren PC combat set.
        951596, -- vo_pctaurenmale_attack_01
        951598, -- vo_pctaurenmale_attack_02
        951600, -- vo_pctaurenmale_attack_03
        951602, -- vo_pctaurenmale_attack_04
        951604, -- vo_pctaurenmale_attack_05
        951606, -- vo_pctaurenmale_attack_06
        951608, -- vo_pctaurenmale_death_01
        951610, -- vo_pctaurenmale_death_02
        951612, -- vo_pctaurenmale_death_03
        951614, -- vo_pctaurenmale_death_04
        951616, -- vo_pctaurenmale_woundcrit_01
        951618, -- vo_pctaurenmale_woundcrit_02
        951620, -- vo_pctaurenmale_woundcrit_03
        951622, -- vo_pctaurenmale_woundcrit_04
        951624, -- vo_pctaurenmale_woundcrit_05
        951626, -- vo_pctaurenmale_woundcrit_06
        951628, -- vo_pctaurenmale_woundcrit_07
        951630, -- vo_pctaurenmale_wound_01
        951632, -- vo_pctaurenmale_wound_02
        951634, -- vo_pctaurenmale_wound_03
        951636, -- vo_pctaurenmale_wound_04
        951638, -- vo_pctaurenmale_wound_05
        951640, -- vo_pctaurenmale_wound_06
        1502087, -- vo_taurenmale_battleshoutlarge_01
        1502088, -- vo_taurenmale_battleshoutlarge_02
        1502089, -- vo_taurenmale_battleshoutlarge_03
        1502090, -- vo_taurenmale_battleshoutlarge_04
        1502091, -- vo_taurenmale_battleshoutlarge_05
        1502092, -- vo_taurenmale_charge_01
        1502093, -- vo_taurenmale_charge_02
        1502094, -- vo_taurenmale_charge_03
        1502095, -- vo_taurenmale_charge_04
        1502096, -- vo_taurenmale_charge_05
        1502097, -- vo_taurenmale_charge_06
        1502098, -- vo_taurenmale_charge_07
        1502099, -- vo_taurenmale_charge_08
        1502100, -- vo_taurenmale_meleewindup_01
        1502101, -- vo_taurenmale_meleewindup_02
        1502102, -- vo_taurenmale_meleewindup_03
        1502103, -- vo_taurenmale_meleewindup_04
        1502104, -- vo_taurenmale_meleewindup_05
        1502105, -- vo_taurenmale_meleewindup_06

        -- Male Tauren UI error messages.
        542904, 542905, 542906, 542907, 542908, 542909, 542910, 542911,
        542912, 542913, 542914, 542915, 542916, 542917, 542918, 542919,
        542920, 542921, 542922, 542923, 542924, 542925, 542926, 542927,
        542928, 542929, 542930, 542931, 542932, 542933, 542934, 542935,
        542936, 542937, 542938, 542939, 542940, 542941, 542942, 542943,
        542944, 542945, 542946, 542947, 542948, 542949, 542950, 542951,
        542952, 542953, 542954, 542955, 542956, 542957, 542958, 542959,
        542960, 542961, 542962, 542963, 542964, 542965, 542966, 542967,
    },

    replacements = {
        ui = {
            not_ready = {
                text = "Ich bin noch nicht bereit.",
                files = {
                    "Sounds/male/error_not_ready_v3_01.mp3",
                },
            },
            no_mana = {
                text = "Ich habe nicht genug Mana.",
                files = {
                    "Sounds/male/error_no_mana_01.mp3",
                },
            },
            out_of_range = {
                text = "Ich bin zu weit entfernt.",
                files = {
                    "Sounds/male/error_out_of_range_01.mp3",
                },
            },
            inventory_full = {
                text = "Meine Taschen sind voll.",
                files = {
                    "Sounds/male/error_inventory_full_01.mp3",
                },
            },
        },

        emote = {
            ROAR = {
                files = {
                    "Sounds/male/emote_roar_01.mp3",
                },
            },
            TRAIN = {
                files = {
                    "Sounds/male/emote_train_01.mp3",
                },
            },
            CHARGE = {
                files = {
                    "Sounds/male/emote_charge_01.mp3",
                },
            },
            HELLO = {
                files = {
                    "Sounds/male/emote_hello_01.mp3",
                },
            },
            BYE = {
                files = {
                    "Sounds/male/emote_bye_01.mp3",
                },
            },
            THANK = {
                files = {
                    "Sounds/male/emote_thank_01.mp3",
                },
            },
            FLIRT = {
                files = {
                    "Sounds/male/emote_flirt_01.mp3",
                },
            },
            LAUGH = {
                files = {
                    "Sounds/male/emote_laugh_01.mp3",
                },
            },
            CRY = {
                files = {
                    "Sounds/male/emote_cry_01.mp3",
                },
            },
            KISS = {
                files = {
                    "Sounds/male/emote_kiss_01.mp3",
                },
            },
            CHICKEN = {
                files = {
                    "Sounds/male/emote_chicken_01.mp3",
                },
            },
            MOO = {
                files = {
                    "Sounds/male/emote_moo_01.mp3",
                },
            },
            SIGH = {
                files = {
                    "Sounds/male/emote_sigh_01.mp3",
                },
            },
            YAWN = {
                files = {
                    "Sounds/male/emote_yawn_01.mp3",
                },
            },
            CHEER = {
                files = {
                    "Sounds/male/emote_cheer_01.mp3",
                },
            },
            CONGRATULATE = {
                files = {
                    "Sounds/male/emote_congratulate_01.mp3",
                },
            },
            YES = {
                files = {
                    "Sounds/male/emote_yes_01.mp3",
                },
            },
            NO = {
                files = {
                    "Sounds/male/emote_no_01.mp3",
                },
            },
            HELP = {
                files = {
                    "Sounds/male/emote_help_01.mp3",
                },
            },
            FOLLOWME = {
                files = {
                    "Sounds/male/emote_followme_01.mp3",
                },
            },
            WAIT = {
                files = {
                    "Sounds/male/emote_wait_01.mp3",
                },
            },
            INCOMING = {
                files = {
                    "Sounds/male/emote_incoming_01.mp3",
                },
            },
            FLEE = {
                files = {
                    "Sounds/male/emote_flee_01.mp3",
                },
            },
            OPENFIRE = {
                files = {
                    "Sounds/male/emote_openfire_01.mp3",
                },
            },
            ATTACKMYTARGET = {
                files = {
                    "Sounds/male/emote_attackmytarget_01.mp3",
                },
            },
            HEALME = {
                files = {
                    "Sounds/male/emote_healme_01.mp3",
                },
            },
            OOM = {
                files = {
                    "Sounds/male/emote_outofmana_01.mp3",
                },
            },
            WELCOME = {
                files = {
                    "Sounds/male/emote_welcome_01.mp3",
                },
            },
            RASP = {
                files = {
                    "Sounds/male/emote_raspberry_01.mp3",
                },
            },
            ANGRY = {
                files = {
                    "Sounds/male/emote_angry_01.mp3",
                },
            },
            OOPS = {
                files = {
                    "Sounds/male/emote_oops_01.mp3",
                },
            },
            SORRY = {
                files = {
                    "Sounds/male/emote_sorry_01.mp3",
                },
            },
            TAUNT = {
                files = {
                    "Sounds/male/emote_taunt_01.mp3",
                },
            },
            THREATEN = {
                files = {
                    "Sounds/male/emote_threaten_01.mp3",
                },
            },
            WHOA = {
                files = {
                    "Sounds/male/emote_whoa_01.mp3",
                },
            },
        },

        lifecycle = {
            PLAYER_DEAD = {
                files = {
                    "Sounds/male/death_01.mp3",
                },
            },
            PLAYER_ALIVE = {
                files = {
                    "Sounds/male/revive_01.mp3",
                },
            },
        },
    },
}
