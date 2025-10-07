return {
    read           = 94, -- MSP_PID_ADVANCED
    write          = 95, -- MSP_SET_PID_ADVANCED
    title          = "PID Advanced",
    reboot         = false,
    eepromWrite    = true,
    minBytes       = 65,
    yMinLimit      = 11,
    yMaxLimit      = 52,
    text = {
        { t = "Value",      x = 46, y = 14, to = SMLSIZE },
        { t = "Limit",      x = 80, y = 14, to = SMLSIZE },
        { t = "EmuBoost",   x = 2,  y = 26, to = SMLSIZE },
        { t = "EmuB Yaw",   x = 2,  y = 36, to = SMLSIZE },
        { t = "DTermBoost", x = 2,  y = 46, to = SMLSIZE },
        { t = "ITermRelax", x = 2,  y = 56, to = SMLSIZE, t = "Cutoff" },
        { t = "RP",         x = 12, y = 64, to = SMLSIZE },
        { t = "Yaw",        x = 60, y = 64, to = SMLSIZE },
        { t = "FeathPID",   x = 2,  y = 78, to = SMLSIZE },
        { t = "iDecay",     x = 2,  y = 88, to = SMLSIZE },
        { t = "ThrotBoost", x = 2,  y = 98, to = SMLSIZE },
        { t = "ITerm Rot",  x = 2,  y = 108,to = SMLSIZE },
        { t = "SPA",        x = 66, y = 118,to = SMLSIZE },
        { t = "P",          x = 38, y = 126,to = SMLSIZE },
        { t = "I",          x = 66, y = 126,to = SMLSIZE },
        { t = "D",          x = 94, y = 126,to = SMLSIZE },
        { t = "ROLL",       x = 10, y = 136,to = SMLSIZE },
        { t = "PITCH",      x = 10, y = 146,to = SMLSIZE },
        { t = "YAW",        x = 10, y = 156,to = SMLSIZE },
    },
    fields = {
        -- EmuBoost
        { x = 53, y = 26, min = 0, max = 2000, vals = { 5, 6 }, to = SMLSIZE },
        { x = 80, y = 26, min = 0, max = 250,  vals = { 10 },   to = SMLSIZE },
        -- EmuBoost Yaw
        { x = 53, y = 36, min = 0, max = 2000, vals = { 43, 44 }, to = SMLSIZE },
        { x = 80, y = 36, min = 0, max = 250,  vals = { 45 },     to = SMLSIZE },
        -- DTerm Boost
        { x = 53, y = 46, min = 0, max = 2000, vals = { 24, 25 }, to = SMLSIZE },
        { x = 80, y = 46, min = 0, max = 250,  vals = { 29 },     to = SMLSIZE },
        -- ITerm Relax Cutoff
        { x = 20, y = 64, min = 0, max = 100,  vals = { 27 }, to = SMLSIZE }, -- RP
        { x = 68, y = 64, min = 0, max = 100,  vals = { 28 }, to = SMLSIZE }, -- Yaw
        -- Other settings
        { x = 80, y = 78, min = 0, max = 100,  vals = { 7 },  to = SMLSIZE }, -- Feathered PIDs
        { x = 80, y = 88, min = 1, max = 10,   vals = { 11 }, to = SMLSIZE }, -- iDecay
        { x = 80, y = 98, min = 0, max = 100,  vals = { 31 }, to = SMLSIZE }, -- Throttle Boost
        { x = 80, y = 108,min = 0, max = 1,    vals = { 26 }, to = SMLSIZE, table = { [0]="OFF", "ON" } }, -- ITerm Rotation
        -- SPA P
        { x = 39, y = 136, min = 0, max = 250, vals = { 46 }, to = SMLSIZE },
        { x = 39, y = 146, min = 0, max = 250, vals = { 49 }, to = SMLSIZE },
        { x = 39, y = 156, min = 0, max = 250, vals = { 52 }, to = SMLSIZE },
        -- SPA I
        { x = 66, y = 136, min = 0, max = 250, vals = { 47 }, to = SMLSIZE },
        { x = 66, y = 146, min = 0, max = 250, vals = { 50 }, to = SMLSIZE },
        { x = 66, y = 156, min = 0, max = 250, vals = { 53 }, to = SMLSIZE },
        -- SPA D
        { x = 94, y = 136, min = 0, max = 250, vals = { 48 }, to = SMLSIZE },
        { x = 94, y = 146, min = 0, max = 250, vals = { 51 }, to = SMLSIZE },
        { x = 94, y = 156, min = 0, max = 250, vals = { 54 }, to = SMLSIZE },
    },
}