return {
    read           = 111, -- MSP_RC_TUNING
    write          = 204, -- MSP_SET_RC_TUNING
    title          = "Rates",
    reboot         = false,
    eepromWrite    = true,
    minBytes       = 29,
    yMinLimit      = 11,
    yMaxLimit      = 52,

    preSave = function(self)
        local writePayload = {}
        -- The write payload is the same as the read payload, but without the two reserved bytes (20 and 21)
        -- Copy bytes 1-19
        for i = 1, 19 do
            writePayload[i] = self.values[i]
        end
        -- Copy bytes 22-29 into positions 20-27
        for i = 22, 29 do
            writePayload[i - 2] = self.values[i]
        end
        return writePayload
    end,

    text = {
        { t = "RC",         x = 43, y = 11,  to = SMLSIZE },
        { t = "Rate",       x = 38, y = 18,  to = SMLSIZE },
        { t = "Super",      x = 63, y = 11,  to = SMLSIZE },
        { t = "Rate",       x = 66, y = 18,  to = SMLSIZE },
        { t = "RC",         x = 99, y = 11,  to = SMLSIZE },
        { t = "Expo",       x = 94, y = 18,  to = SMLSIZE },
        { t = "ROLL",       x = 10, y = 26,  to = SMLSIZE },
        { t = "PITCH",      x = 10, y = 36,  to = SMLSIZE },
        { t = "YAW",        x = 10, y = 46,  to = SMLSIZE },

        { t = "Throttle",   x = 10, y = 60,  to = SMLSIZE },
        { t = "Mid",        x = 20, y = 68,  to = SMLSIZE },
        { t = "Expo",       x = 20, y = 76,  to = SMLSIZE },
        { t = "Limit Type", x = 20, y = 84,  to = SMLSIZE },
        { t = "Limit %",    x = 20, y = 92,  to = SMLSIZE },
        { t = "TPA",        x = 10, y = 100, to = SMLSIZE },
        { t = "TPA P",      x = 20, y = 108, to = SMLSIZE },
        { t = "Breakpoint", x = 20, y = 116, to = SMLSIZE },
        { t = "Rate Dynamics", x = 10, y = 126, to = SMLSIZE },

        { t = "Sens.",      x = 39, y = 136, to = SMLSIZE },
        { t = "Corr.",      x = 70, y = 136, to = SMLSIZE },
        { t = "Weight.",    x = 99, y = 136, to = SMLSIZE },
        { t = "Center",     x = 5,  y = 148, to = SMLSIZE },
        { t = "End",        x = 5,  y = 156, to = SMLSIZE },
    },

    fields = {
        -- RC Rates
        { x = 39, y = 26,  vals = { 2 },  min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rcRates[FD_ROLL]
        { x = 39, y = 36,  vals = { 14 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rcRates[FD_PITCH]
        { x = 39, y = 46,  vals = { 13 }, min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rcRates[FD_YAW]
        -- Super Rates
        { x = 66, y = 26,  vals = { 4 },  min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rates[ROLL]
        { x = 66, y = 36,  vals = { 5 },  min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rates[PITCH]
        { x = 66, y = 46,  vals = { 6 },  min = 0, max = 255, scale = 100, to = SMLSIZE }, -- rates[YAW]
        -- RC Expo
        { x = 94, y = 26,  vals = { 3 },  min = 0, max = 100, scale = 100, to = SMLSIZE }, -- rcExpo[FD_ROLL]
        { x = 94, y = 36,  vals = { 15 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- rcExpo[FD_PITCH]
        { x = 94, y = 46,  vals = { 12 }, min = 0, max = 100, scale = 100, to = SMLSIZE }, -- rcExpo[FD_YAW]
        -- Throttle
        { x = 70, y = 68,  vals = { 8 },  min = 0, max = 100, scale = 100, to = SMLSIZE }, -- thrMid8
        { x = 70, y = 76,  vals = { 9 },  min = 0, max = 100, scale = 100, to = SMLSIZE }, -- thrExpo8
        { x = 70, y = 84,  vals = { 16 }, min = 0, max = 2,   to = SMLSIZE, table = { [0] = "OFF", "SCALE", "CLIP" } }, -- throttle_limit_type
        { x = 70, y = 92,  vals = { 17 }, min = 25,max = 100, to = SMLSIZE }, -- throttle_limit_percent
        -- TPA
        { x = 70, y = 108, vals = { 7 },  min = 0, max = 100, scale = 100, to = SMLSIZE }, -- dynThrP
        { x = 70, y = 116, vals = { 10, 11 }, min = 1000, max = 2000, to = SMLSIZE }, -- tpa_breakpoint
        -- Rate Dynamics
        -- Rate Sensitivity
        { x = 39, y = 148, vals = { 22 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateSensCenter
        { x = 39, y = 156, vals = { 23 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateSensEnd
        -- Rate Correction
        { x = 70, y = 148, vals = { 24 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateCorrectionCenter
        { x = 70, y = 156, vals = { 25 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateCorrectionEnd
        -- Rate Weight
        { x = 94, y = 148, vals = { 26 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateWeightCenter
        { x = 94, y = 156, vals = { 27 }, min = 0, max = 255, to = SMLSIZE }, -- rateDynamics.rateWeightEnd
    },
}