return {
    read           = 111, -- MSP_RC_TUNING
    write          = 204, -- MSP_SET_RC_TUNING
    title          = "Rates",
    reboot         = false,
    eepromWrite    = true,
    minBytes       = 28,
    yMinLimit      = 11,
    yMaxLimit      = 52,
    text = {
        { t = "Rates Type", x = 10, y = 11, to = SMLSIZE },
        { t = "RC",         x = 43, y = 18, to = SMLSIZE },
        { t = "Rate",       x = 38, y = 25, to = SMLSIZE },
        { t = "Super",      x = 63, y = 18, to = SMLSIZE },
        { t = "Rate",       x = 66, y = 25, to = SMLSIZE },
        { t = "RC",         x = 99, y = 18, to = SMLSIZE },
        { t = "Expo",       x = 94, y = 25, to = SMLSIZE },
        { t = "ROLL",       x = 10, y = 33, to = SMLSIZE },
        { t = "PITCH",      x = 10, y = 43, to = SMLSIZE },
        { t = "YAW",        x = 10, y = 53, to = SMLSIZE },

        { t = "Throttle",   x = 10, y = 60,  to = SMLSIZE },
        { t = "Mid",        x = 20, y = 68,  to = SMLSIZE },
        { t = "Expo",       x = 20, y = 76,  to = SMLSIZE },
        { t = "Limit Type", x = 20, y = 84,  to = SMLSIZE },
        { t = "Limit %",    x = 20, y = 92,  to = SMLSIZE },
        { t = "TPA",        x = 10, y = 100, to = SMLSIZE },
        -- { t = "TPA P",       x = 20, y = 108, to = SMLSIZE },
        -- { t = "TPA I",       x = 20, y = 116, to = SMLSIZE },
        -- { t = "TPA D",       x = 20, y = 124, to = SMLSIZE },
        { t = "Breakpoint", x = 20, y = 108, to = SMLSIZE },
        { t = "Rate Dynamics", x = 10, y = 118, to = SMLSIZE },

        { t = "Sens.",         x = 39, y = 128,  to = SMLSIZE },
        { t = "Corr.",      x = 70, y = 128,  to = SMLSIZE },
        { t = "Weight.",         x = 99, y = 128,  to = SMLSIZE },
        { t = "Center",       x = 5, y = 140,  to = SMLSIZE },
        { t = "End",      x = 5, y = 148,  to = SMLSIZE },



    },
    fields = {
        -- Rates Type
        { x = 87, y = 11, vals = { 1 }, min = 0, max = 3, to = SMLSIZE, table = { "BETAFLIGHT", "RACEFLIGHT", "KISS", "ACTUAL" } },
        -- RC Rates
        { x = 39, y = 33, vals = { 2 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- Roll
        { x = 39, y = 43, vals = { 14 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- Pitch
        { x = 39, y = 53, vals = { 13 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- Yaw
        -- Super Rates
        { x = 66, y = 33, vals = { 4 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Roll
        { x = 66, y = 43, vals = { 5 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Pitch
        { x = 66, y = 53, vals = { 6 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- Yaw
        -- RC Expo
        { x = 94, y = 33, vals = { 3 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Roll
        { x = 94, y = 43, vals = { 15 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Pitch
        { x = 94, y = 53, vals = { 12 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Yaw
        -- Throttle
        { x = 70, y = 75, vals = { 8 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Mid
        { x = 70, y = 83, vals = { 9 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- Expo
        -- TPA
        { x = 70, y = 99, vals = { 10, 11 }, min = 1000, max = 2000, to = SMLSIZE }, -- Breakpoint
    },
}
