local ADDON_NAME, addon = ...

local DEFAULT_DB = {
    enabled = true,
    debug = false,
    muteEnabled = true,
    replaceUIErrors = true,
    replaceEmotes = true,
    replaceLifecycle = true,
    scope = "player",
    channel = "Master",
}

local ERROR_PATTERNS = {
    not_ready = {
        "noch nicht bereit",
        "ist noch nicht bereit",
    },
    no_mana = {
        "nicht genug mana",
        "zu wenig mana",
    },
    out_of_range = {
        "ausser reichweite",
        "zu weit entfernt",
    },
    inventory_full = {
        "inventar ist voll",
        "taschen sind voll",
    },
}

local TEXT_EMOTE_PATTERNS = {
    { "ihr flirtet", "FLIRT" },
    { "ihr lacht", "LAUGH" },
    { "ihr weint", "CRY" },
    { "ihr küsst", "KISS" },
    { "ihr kuesst", "KISS" },
    { "ihr gackert", "CHICKEN" },
    { "ihr macht huhngeräusche", "CHICKEN" },
    { "ihr macht huhngeraeusche", "CHICKEN" },
    { "ihr muht", "MOO" },
    { "ihr seufzt", "SIGH" },
    { "ihr gähnt", "YAWN" },
    { "ihr gaehnt", "YAWN" },
    { "ihr jubelt", "CHEER" },
    { "ihr gratuliert", "CONGRATULATE" },
    { "ihr nickt", "YES" },
    { "ihr sagt deutlich: nein", "NO" },
    { "ihr bittet um hilfe", "HELP" },
    { "ihr winkt", "HELLO" },
    { "ihr verabschiedet euch", "BYE" },
    { "ihr bedankt euch", "THANK" },
}

local TEST_ALIASES = {
    ready = { "ui", "not_ready" },
    not_ready = { "ui", "not_ready" },
    mana = { "ui", "no_mana" },
    no_mana = { "ui", "no_mana" },
    range = { "ui", "out_of_range" },
    out_of_range = { "ui", "out_of_range" },
    bags = { "ui", "inventory_full" },
    inventory_full = { "ui", "inventory_full" },
    roar = { "emote", "ROAR" },
    train = { "emote", "TRAIN" },
    charge = { "emote", "CHARGE" },
    hello = { "emote", "HELLO" },
    hallo = { "emote", "HELLO" },
    gruesse = { "emote", "HELLO" },
    hi = { "emote", "HELLO" },
    bye = { "emote", "BYE" },
    tschuess = { "emote", "BYE" },
    tschuss = { "emote", "BYE" },
    abschied = { "emote", "BYE" },
    goodbye = { "emote", "BYE" },
    thanks = { "emote", "THANK" },
    thank = { "emote", "THANK" },
    danke = { "emote", "THANK" },
    danken = { "emote", "THANK" },
    flirt = { "emote", "FLIRT" },
    laugh = { "emote", "LAUGH" },
    lachen = { "emote", "LAUGH" },
    cry = { "emote", "CRY" },
    weinen = { "emote", "CRY" },
    kiss = { "emote", "KISS" },
    kuss = { "emote", "KISS" },
    chicken = { "emote", "CHICKEN" },
    huhn = { "emote", "CHICKEN" },
    moo = { "emote", "MOO" },
    muh = { "emote", "MOO" },
    sigh = { "emote", "SIGH" },
    seufzen = { "emote", "SIGH" },
    yawn = { "emote", "YAWN" },
    gaehnen = { "emote", "YAWN" },
    gahnen = { "emote", "YAWN" },
    cheer = { "emote", "CHEER" },
    jubeln = { "emote", "CHEER" },
    congrats = { "emote", "CONGRATULATE" },
    gratulation = { "emote", "CONGRATULATE" },
    glueckwunsch = { "emote", "CONGRATULATE" },
    yes = { "emote", "YES" },
    ja = { "emote", "YES" },
    no = { "emote", "NO" },
    nein = { "emote", "NO" },
    help = { "emote", "HELP" },
    hilfe = { "emote", "HELP" },
    follow = { "emote", "FOLLOWME" },
    folgen = { "emote", "FOLLOWME" },
    wait = { "emote", "WAIT" },
    warten = { "emote", "WAIT" },
    incoming = { "emote", "INCOMING" },
    angriff = { "emote", "INCOMING" },
    flee = { "emote", "FLEE" },
    fliehen = { "emote", "FLEE" },
    openfire = { "emote", "OPENFIRE" },
    feuer = { "emote", "OPENFIRE" },
    attacktarget = { "emote", "ATTACKMYTARGET" },
    ziel = { "emote", "ATTACKMYTARGET" },
    healme = { "emote", "HEALME" },
    heilung = { "emote", "HEALME" },
    oom = { "emote", "OOM" },
    willkommen = { "emote", "WELCOME" },
    rasp = { "emote", "RASP" },
    raspberry = { "emote", "RASP" },
    angry = { "emote", "ANGRY" },
    wuetend = { "emote", "ANGRY" },
    oops = { "emote", "OOPS" },
    sorry = { "emote", "SORRY" },
    taunt = { "emote", "TAUNT" },
    threat = { "emote", "THREATEN" },
    threaten = { "emote", "THREATEN" },
    whoa = { "emote", "WHOA" },
    death = { "lifecycle", "PLAYER_DEAD" },
    revive = { "lifecycle", "PLAYER_ALIVE" },
}

local EMOTE_TOKEN_ALIASES = {
    HALLO = "HELLO",
    GRUESSE = "HELLO",
    TSCHUESS = "BYE",
    TSCHUSS = "BYE",
    ABSCHIED = "BYE",
    DANKE = "THANK",
    DANKEN = "THANK",
    LACHEN = "LAUGH",
    WEINEN = "CRY",
    KUSS = "KISS",
    HUHN = "CHICKEN",
    MUH = "MOO",
    SEUFZEN = "SIGH",
    GAEHNEN = "YAWN",
    GAHNEN = "YAWN",
    JUBELN = "CHEER",
    GRATULATION = "CONGRATULATE",
    GLUECKWUNSCH = "CONGRATULATE",
    JA = "YES",
    NEIN = "NO",
    HILFE = "HELP",
    FOLGEN = "FOLLOWME",
    WARTEN = "WAIT",
    ANGRIFF = "INCOMING",
    FLIEHEN = "FLEE",
    FEUER = "OPENFIRE",
    ZIEL = "ATTACKMYTARGET",
    HEILUNG = "HEALME",
    WILLKOMMEN = "WELCOME",
    WUETEND = "ANGRY",
}

local SLASH_EMOTE_ALIASES = {
    ["/roar"] = "ROAR",
    ["/brüllen"] = "ROAR",
    ["/bruellen"] = "ROAR",
    ["/train"] = "TRAIN",
    ["/zug"] = "TRAIN",
    ["/charge"] = "CHARGE",
    ["/angriff"] = "CHARGE",
    ["/hello"] = "HELLO",
    ["/hallo"] = "HELLO",
    ["/bye"] = "BYE",
    ["/tschüss"] = "BYE",
    ["/tschuess"] = "BYE",
    ["/thank"] = "THANK",
    ["/thanks"] = "THANK",
    ["/danke"] = "THANK",
    ["/flirt"] = "FLIRT",
    ["/laugh"] = "LAUGH",
    ["/lachen"] = "LAUGH",
    ["/cry"] = "CRY",
    ["/weinen"] = "CRY",
    ["/kiss"] = "KISS",
    ["/kuss"] = "KISS",
    ["/chicken"] = "CHICKEN",
    ["/huhn"] = "CHICKEN",
    ["/moo"] = "MOO",
    ["/muh"] = "MOO",
    ["/sigh"] = "SIGH",
    ["/seufzen"] = "SIGH",
    ["/yawn"] = "YAWN",
    ["/gähnen"] = "YAWN",
    ["/gaehnen"] = "YAWN",
    ["/cheer"] = "CHEER",
    ["/jubeln"] = "CHEER",
    ["/congrats"] = "CONGRATULATE",
    ["/glückwunsch"] = "CONGRATULATE",
    ["/glueckwunsch"] = "CONGRATULATE",
    ["/yes"] = "YES",
    ["/ja"] = "YES",
    ["/no"] = "NO",
    ["/nein"] = "NO",
    ["/help"] = "HELP",
    ["/hilfe"] = "HELP",
    ["/followme"] = "FOLLOWME",
    ["/follow"] = "FOLLOWME",
    ["/folgtmir"] = "FOLLOWME",
    ["/folge"] = "FOLLOWME",
    ["/folgen"] = "FOLLOWME",
    ["/wait"] = "WAIT",
    ["/warten"] = "WAIT",
    ["/warte"] = "WAIT",
    ["/incoming"] = "INCOMING",
    ["/feindekommen"] = "INCOMING",
    ["/eintreffend"] = "INCOMING",
    ["/flee"] = "FLEE",
    ["/fliehen"] = "FLEE",
    ["/flieh"] = "FLEE",
    ["/openfire"] = "OPENFIRE",
    ["/feuerfrei"] = "OPENFIRE",
    ["/feuer"] = "OPENFIRE",
    ["/attacktarget"] = "ATTACKMYTARGET",
    ["/attackmytarget"] = "ATTACKMYTARGET",
    ["/zielangreifen"] = "ATTACKMYTARGET",
    ["/greiftmeinzielan"] = "ATTACKMYTARGET",
    ["/healme"] = "HEALME",
    ["/heiltmich"] = "HEALME",
    ["/heilung"] = "HEALME",
    ["/oom"] = "OOM",
    ["/outofmana"] = "OOM",
    ["/welcome"] = "WELCOME",
    ["/willkommen"] = "WELCOME",
    ["/rasp"] = "RASP",
    ["/raspberry"] = "RASP",
    ["/angry"] = "ANGRY",
    ["/wütend"] = "ANGRY",
    ["/wuetend"] = "ANGRY",
    ["/oops"] = "OOPS",
    ["/sorry"] = "SORRY",
    ["/taunt"] = "TAUNT",
    ["/spotten"] = "TAUNT",
    ["/threaten"] = "THREATEN",
    ["/drohen"] = "THREATEN",
    ["/whoa"] = "WHOA",
    ["/wow"] = "WHOA",
}

local EMOTE_TOKEN_REPLACEMENTS = {
    FLIRT = "FLIRT",
    LAUGH = "LAUGH",
    CRY = "CRY",
    KISS = "KISS",
    CHICKEN = "CHICKEN",
    MOO = "MOO",
    SIGH = "SIGH",
    YAWN = "YAWN",
    CHEER = "CHEER",
    CONGRATULATE = "CONGRATULATE",
    YES = "YES",
    NO = "NO",
    HELP = "HELP",
    FOLLOWME = "FOLLOWME",
    WAIT = "WAIT",
    INCOMING = "INCOMING",
    FLEE = "FLEE",
    OPENFIRE = "OPENFIRE",
    ATTACKMYTARGET = "ATTACKMYTARGET",
    HEALME = "HEALME",
    OOM = "OOM",
    WELCOME = "WELCOME",
    RASP = "RASP",
    RASPBERRY = "RASP",
    ANGRY = "ANGRY",
    PISSED = "ANGRY",
    OOPS = "OOPS",
    SORRY = "SORRY",
    TAUNT = "TAUNT",
    THREATEN = "THREATEN",
    WHOA = "WHOA",
}

local frame = CreateFrame("Frame")
local db
local activeVoiceSet
local lastPlayed = {}

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff9d7cffNaxVoiceDE|r: " .. tostring(message))
end

local function Debug(message)
    if db and db.debug then
        Print(message)
    end
end

local function CopyDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if target[key] == nil then
            target[key] = value
        end
    end
end

local function GetPlayerRaceAndSex()
    local _, raceFile = UnitRace("player")
    return raceFile, UnitSex("player")
end

local function NormalizeRaceFile(raceFile)
    if type(raceFile) == "string" then
        return raceFile:upper()
    end

    return raceFile
end

local function VoiceSetMatchesPlayer(voiceSet)
    local raceFile, sex = GetPlayerRaceAndSex()
    return voiceSet
        and voiceSet.locale == GetLocale()
        and NormalizeRaceFile(voiceSet.raceFile) == NormalizeRaceFile(raceFile)
        and voiceSet.sex == sex
end

local function SelectActiveVoiceSet()
    for _, voiceSet in pairs(addon.VoiceSets or {}) do
        if VoiceSetMatchesPlayer(voiceSet) then
            return voiceSet
        end
    end
end

local function IterateMutedVoiceSets(callback)
    if not addon.VoiceSets then
        return
    end

    local playerRaceFile, playerSex = GetPlayerRaceAndSex()

    for _, voiceSet in pairs(addon.VoiceSets) do
        local isGermanSet = voiceSet.locale == GetLocale()
        local isPlayerSet = NormalizeRaceFile(voiceSet.raceFile) == NormalizeRaceFile(playerRaceFile) and voiceSet.sex == playerSex
        local isTaurenSet = NormalizeRaceFile(voiceSet.raceFile) == "TAUREN"

        if isGermanSet and ((db.scope == "player" and isPlayerSet) or (db.scope == "tauren" and isTaurenSet)) then
            callback(voiceSet)
        end
    end
end

local function CountMutedIDs()
    local count = 0
    IterateMutedVoiceSets(function(voiceSet)
        count = count + #(voiceSet.muteFileDataIDs or {})
    end)
    return count
end

local function ApplyMutes()
    if not db.enabled or not db.muteEnabled then
        return
    end

    local count = 0

    IterateMutedVoiceSets(function(voiceSet)
        for _, fileDataID in ipairs(voiceSet.muteFileDataIDs or {}) do
            if type(fileDataID) == "number" and fileDataID > 0 then
                MuteSoundFile(fileDataID)
                count = count + 1
            end
        end
    end)

    Debug("Applied " .. count .. " mute entries.")
end

local function UnmuteConfiguredSounds()
    local count = 0

    IterateMutedVoiceSets(function(voiceSet)
        for _, fileDataID in ipairs(voiceSet.muteFileDataIDs or {}) do
            if type(fileDataID) == "number" and fileDataID > 0 then
                UnmuteSoundFile(fileDataID)
                count = count + 1
            end
        end
    end)

    Print("Unmuted " .. count .. " configured sound files for this scope.")
end

local function NormalizeAddonPath(relativePath)
    return ("Interface\\AddOns\\%s\\%s"):format(ADDON_NAME, relativePath:gsub("/", "\\"))
end

local function PickFile(files)
    if not files or #files == 0 then
        return
    end

    if #files == 1 then
        return files[1]
    end

    return files[math.random(#files)]
end

local function PlayReplacement(kind, key, throttleSeconds)
    if not db.enabled or not activeVoiceSet then
        return false
    end

    local group = activeVoiceSet.replacements and activeVoiceSet.replacements[kind]
    local replacement = group and group[key]
    local relativePath = replacement and PickFile(replacement.files)

    if not relativePath then
        Debug("No replacement configured for " .. tostring(kind) .. ":" .. tostring(key))
        return false
    end

    local throttleKey = kind .. ":" .. key
    local now = GetTime()
    if throttleSeconds and lastPlayed[throttleKey] and now - lastPlayed[throttleKey] < throttleSeconds then
        return false
    end

    lastPlayed[throttleKey] = now

    local willPlay = PlaySoundFile(NormalizeAddonPath(relativePath), db.channel or "Master")
    Debug("Play " .. relativePath .. " -> " .. tostring(willPlay))
    return willPlay
end

local function TestReplacement(kind, key)
    if not activeVoiceSet then
        Print("No active voice set.")
        return
    end

    local group = activeVoiceSet.replacements and activeVoiceSet.replacements[kind]
    local replacement = group and group[key]
    local relativePath = replacement and PickFile(replacement.files)

    if not relativePath then
        Print("No replacement configured for " .. tostring(kind) .. ":" .. tostring(key))
        return
    end

    local addonPath = NormalizeAddonPath(relativePath)
    local willPlay, soundHandle = PlaySoundFile(addonPath, db.channel or "Master")
    Print("Test " .. tostring(kind) .. ":" .. tostring(key) .. " -> " .. relativePath .. " play=" .. tostring(willPlay) .. " handle=" .. tostring(soundHandle))
end

local function FindUIErrorKey(message)
    if type(message) ~= "string" then
        return
    end

    local lowerMessage = message:lower()
    for key, patterns in pairs(ERROR_PATTERNS) do
        for _, pattern in ipairs(patterns) do
            if lowerMessage:find(pattern, 1, true) then
                return key
            end
        end
    end
end

local function NormalizeTextPattern(text)
    if type(text) ~= "string" then
        return
    end

    return text
        :lower()
        :gsub("|4", "")
        :gsub("[<>]", "")
        :gsub("%%s", "")
        :gsub("%s+", " ")
        :gsub("^%s+", "")
        :gsub("%s+$", "")
end

local function AddTextEmotePattern(pattern, emoteToken)
    local normalizedPattern = NormalizeTextPattern(pattern)
    if not normalizedPattern or normalizedPattern == "" then
        return
    end

    for _, existingPattern in ipairs(TEXT_EMOTE_PATTERNS) do
        if existingPattern[1] == normalizedPattern and existingPattern[2] == emoteToken then
            return
        end
    end

    table.insert(TEXT_EMOTE_PATTERNS, { normalizedPattern, emoteToken })
end

local function BuildLocalizedTextEmotePatterns()
    if addon.localizedTextEmotePatternsBuilt then
        return
    end

    addon.localizedTextEmotePatternsBuilt = true

    local emoteIndexesByCommand = {}

    for globalName, value in pairs(_G) do
        if type(globalName) == "string" and type(value) == "string" then
            local index = globalName:match("^EMOTE(%d+)_CMD%d+$")
            if index then
                emoteIndexesByCommand[value:lower()] = index
            end
        end
    end

    local count = 0

    for slashCommand, replacementToken in pairs(SLASH_EMOTE_ALIASES) do
        local index = emoteIndexesByCommand[slashCommand]
        local selfText = index and _G["EMOTE" .. index .. "_SELF"]

        if type(selfText) == "string" then
            AddTextEmotePattern(selfText, replacementToken)
            count = count + 1
        end
    end

    for globalName, value in pairs(_G) do
        if type(globalName) == "string" and type(value) == "string" then
            local index = globalName:match("^EMOTE(%d+)_TOKEN$")
            local replacementToken = index and EMOTE_TOKEN_REPLACEMENTS[value:upper()]
            local selfText = index and replacementToken and _G["EMOTE" .. index .. "_SELF"]

            if type(selfText) == "string" then
                AddTextEmotePattern(selfText, replacementToken)
                count = count + 1
            end
        end
    end

    Debug("Built " .. count .. " localized text-emote patterns.")
end

local function HandleUIErrorMessage(...)
    if not db or not db.replaceUIErrors then
        return
    end

    local message
    if select("#", ...) >= 2 then
        message = select(2, ...)
    else
        message = select(1, ...)
    end

    local key = FindUIErrorKey(message)
    if key then
        PlayReplacement("ui", key, 0.9)
    end
end

local function FindTextEmoteToken(message)
    if type(message) ~= "string" then
        return
    end

    local lowerMessage = NormalizeTextPattern(message)
    for _, emotePattern in ipairs(TEXT_EMOTE_PATTERNS) do
        if lowerMessage and lowerMessage:find(emotePattern[1], 1, true) then
            return emotePattern[2]
        end
    end
end

local function HandleTextEmote(message, author, ...)
    if not db or not db.replaceEmotes then
        return
    end

    local playerName = UnitName("player")
    if author and playerName and author ~= "" and author ~= playerName then
        return
    end

    local emoteToken = FindTextEmoteToken(message)
    if emoteToken then
        PlayReplacement("emote", emoteToken, 0.8)
    elseif db.debug then
        Debug("Unmapped text emote: " .. tostring(message))
    end
end

local function InstallEmoteHook()
    if addon.emoteHookInstalled then
        return
    end

    addon.emoteHookInstalled = true

    hooksecurefunc("DoEmote", function(token)
        if db and db.replaceEmotes and type(token) == "string" then
            local normalizedToken = token:upper()
            PlayReplacement("emote", EMOTE_TOKEN_ALIASES[normalizedToken] or normalizedToken, 0.8)
        end
    end)
end

local function FindSlashTokensByCommand()
    local slashTokensByCommand = {}

    for globalName, value in pairs(_G) do
        if type(globalName) == "string" and type(value) == "string" then
            local token = globalName:match("^SLASH_([%w_]+)%d+$")
            if token then
                slashTokensByCommand[value:lower()] = token
            end
        end
    end

    return slashTokensByCommand
end

local function FindEmoteTokenFromChatText(text)
    if type(text) ~= "string" then
        return
    end

    local command = text:match("^%s*(/%S+)")
    if not command then
        return
    end

    return SLASH_EMOTE_ALIASES[command:lower()]
end

local function InstallChatEmoteHook()
    if addon.chatEmoteHookInstalled or type(ChatEdit_ParseText) ~= "function" then
        return
    end

    addon.chatEmoteHookInstalled = true

    local originalChatEditParseText = ChatEdit_ParseText
    ChatEdit_ParseText = function(editBox, send, ...)
        local emoteToken

        if editBox and type(editBox.GetText) == "function" then
            emoteToken = FindEmoteTokenFromChatText(editBox:GetText())
        end

        local results = { originalChatEditParseText(editBox, send, ...) }

        if emoteToken and db and db.replaceEmotes then
            PlayReplacement("emote", emoteToken, 0.8)
        end

        return unpack(results)
    end

    Debug("Hooked ChatEdit_ParseText for typed emote commands.")
end

local function InstallSlashEmoteHooks()
    if addon.slashEmoteHooksInstalled then
        return
    end

    addon.slashEmoteHooksInstalled = true

    local slashTokensByCommand = FindSlashTokensByCommand()

    for slashCommand, emoteToken in pairs(SLASH_EMOTE_ALIASES) do
        local slashToken = slashTokensByCommand[slashCommand]
        local handler = slashToken and SlashCmdList[slashToken]

        if handler and type(handler) == "function" and not addon.slashEmoteWrappedHandlers[slashToken] then
            addon.slashEmoteWrappedHandlers[slashToken] = true
            SlashCmdList[slashToken] = function(...)
                handler(...)
                if db and db.replaceEmotes then
                    PlayReplacement("emote", emoteToken, 0.8)
                end
            end
            Debug("Hooked slash " .. slashCommand .. " -> " .. emoteToken)
        end
    end
end

local function PrintStatus()
    local raceFile, sex = GetPlayerRaceAndSex()
    Print("enabled=" .. tostring(db.enabled)
        .. ", locale=" .. GetLocale()
        .. ", player=" .. tostring(raceFile) .. "/" .. tostring(sex)
        .. ", active=" .. (activeVoiceSet and activeVoiceSet.label or "none")
        .. ", scope=" .. db.scope
        .. ", muteIDs=" .. CountMutedIDs())
end

local function PrintHelp()
    Print("/naxvoice status")
    Print("/naxvoice on | off")
    Print("/naxvoice mute | unmute | remute")
    Print("/naxvoice scope player | tauren")
    Print("/naxvoice test ready|mana|range|bags|roar|train|charge|hallo|tschuess|danke|flirt")
    Print("/naxvoice test lachen|weinen|kuss|huhn|muh|seufzen|gaehnen|ja|nein|hilfe|jubeln")
    Print("/naxvoice play Sounds/male/error_not_ready_01.mp3")
    Print("/naxvoice debug")
end

local function HandleSlashCommand(input)
    local command, rest = strsplit(" ", strtrim(input or ""), 2)
    command = command and command:lower() or ""
    rest = strtrim(rest or "")

    if command == "" or command == "help" then
        PrintHelp()
    elseif command == "status" then
        PrintStatus()
    elseif command == "on" then
        db.enabled = true
        ApplyMutes()
        Print("Enabled.")
    elseif command == "off" then
        db.enabled = false
        Print("Disabled. Existing mutes remain until reload/restart unless you run /naxvoice unmute.")
    elseif command == "mute" or command == "remute" then
        db.muteEnabled = true
        ApplyMutes()
        Print("Mute pass complete.")
    elseif command == "unmute" then
        db.muteEnabled = false
        UnmuteConfiguredSounds()
    elseif command == "scope" then
        if rest == "player" or rest == "tauren" then
            db.scope = rest
            ApplyMutes()
            Print("Scope set to " .. rest .. ".")
        else
            Print("Scope must be player or tauren.")
        end
    elseif command == "debug" then
        db.debug = not db.debug
        Print("Debug " .. (db.debug and "enabled." or "disabled."))
    elseif command == "test" then
        local alias = TEST_ALIASES[rest:lower()]
        if alias then
            TestReplacement(alias[1], alias[2])
        else
            Print("Unknown test key.")
        end
    elseif command == "play" and rest ~= "" then
        PlaySoundFile(NormalizeAddonPath(rest), db.channel or "Master")
    else
        PrintHelp()
    end
end

local function Initialize()
    NaxVoiceDEDB = NaxVoiceDEDB or {}
    CopyDefaults(NaxVoiceDEDB, DEFAULT_DB)
    db = NaxVoiceDEDB

    addon.slashEmoteWrappedHandlers = addon.slashEmoteWrappedHandlers or {}
    activeVoiceSet = SelectActiveVoiceSet()
    ApplyMutes()
    BuildLocalizedTextEmotePatterns()
    InstallEmoteHook()
    InstallChatEmoteHook()
    InstallSlashEmoteHooks()

    if GetLocale() ~= "deDE" then
        Print("Loaded, but the current client locale is " .. GetLocale() .. ". This addon is configured for deDE.")
    elseif activeVoiceSet then
        Print("Loaded for " .. activeVoiceSet.label .. ".")
    else
        Print("Loaded. No German Tauren player voice set is active on this character.")
    end
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("UI_ERROR_MESSAGE")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:RegisterEvent("PLAYER_DEAD")
frame:RegisterEvent("PLAYER_ALIVE")
frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        Initialize()
    elseif event == "UI_ERROR_MESSAGE" then
        HandleUIErrorMessage(...)
    elseif event == "CHAT_MSG_TEXT_EMOTE" then
        HandleTextEmote(...)
    elseif event == "PLAYER_DEAD" and db and db.replaceLifecycle then
        PlayReplacement("lifecycle", "PLAYER_DEAD", 1.5)
    elseif event == "PLAYER_ALIVE" and db and db.replaceLifecycle then
        PlayReplacement("lifecycle", "PLAYER_ALIVE", 1.5)
    end
end)

SLASH_NAXVOICEDE1 = "/naxvoice"
SLASH_NAXVOICEDE2 = "/nvd"
SlashCmdList.NAXVOICEDE = HandleSlashCommand
