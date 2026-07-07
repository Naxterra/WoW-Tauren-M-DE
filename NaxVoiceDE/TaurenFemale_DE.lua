local _, addon = ...

addon.VoiceSets = addon.VoiceSets or {}

addon.VoiceSets.TAUREN_FEMALE_DE = {
    locale = "deDE",
    raceFile = "TAUREN",
    sex = 3,
    label = "Tauren female German",

    -- Add German Tauren female FileDataIDs here as they are verified.
    muteFileDataIDs = {},

    replacements = {
        ui = {
            not_ready = {
                text = "Ich bin noch nicht bereit.",
                files = {
                    "Sounds/female/error_not_ready_01.mp3",
                },
            },
            no_mana = {
                text = "Ich habe nicht genug Mana.",
                files = {
                    "Sounds/female/error_no_mana_01.mp3",
                },
            },
            out_of_range = {
                text = "Ich bin zu weit entfernt.",
                files = {
                    "Sounds/female/error_out_of_range_01.mp3",
                },
            },
            inventory_full = {
                text = "Meine Taschen sind voll.",
                files = {
                    "Sounds/female/error_inventory_full_01.mp3",
                },
            },
        },

        emote = {
            ROAR = {
                files = {
                    "Sounds/female/emote_roar_01.mp3",
                },
            },
            TRAIN = {
                files = {
                    "Sounds/female/emote_train_01.mp3",
                },
            },
            CHARGE = {
                files = {
                    "Sounds/female/emote_charge_01.mp3",
                },
            },
        },

        lifecycle = {
            PLAYER_DEAD = {
                files = {
                    "Sounds/female/death_01.mp3",
                },
            },
            PLAYER_ALIVE = {
                files = {
                    "Sounds/female/revive_01.mp3",
                },
            },
        },
    },
}
