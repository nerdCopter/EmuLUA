return {
    read              = 92, -- MSP_FILTER_CONFIG
    write             = 93, -- MSP_SET_FILTER_CONFIG
    title             = "Filters",
    eepromWrite       = true,
    reboot            = false,
    minBytes          = 57,
    outputBytes       = 57,
    yMinLimit         = 11,
    yMaxLimit         = 52,

    text= {
        { t = "Gyro Lowpass 1",           x = 2,  y = 12, to = SMLSIZE },
        { t = "Type",                     x = 12, y = 20, to = SMLSIZE },
        { t = "Roll",                     x = 12, y = 28, to = SMLSIZE },
        { t = "Pitch",                    x = 12, y = 36, to = SMLSIZE },
        { t = "Yaw",                      x = 12, y = 44, to = SMLSIZE },
        { t = "Gyro Lowpass 2",           x = 2,  y = 52, to = SMLSIZE },
        { t = "Type",                     x = 12, y = 60, to = SMLSIZE },
        { t = "Roll",                     x = 12, y = 68, to = SMLSIZE },
        { t = "Pitch",                    x = 12, y = 76, to = SMLSIZE },
        { t = "Yaw",                      x = 12, y = 84, to = SMLSIZE },
        { t = "D Term Lowpass 1",         x = 2,  y = 92, to = SMLSIZE },
        { t = "Type",                     x = 12, y = 100,to = SMLSIZE },
        { t = "Roll",                     x = 12, y = 108,to = SMLSIZE },
        { t = "Pitch",                    x = 12, y = 116,to = SMLSIZE },
        { t = "Yaw",                      x = 12, y = 124,to = SMLSIZE },
        { t = "D Term Lowpass 2",         x = 2,  y = 132,to = SMLSIZE },
        { t = "Type",                     x = 12, y = 140,to = SMLSIZE },
        { t = "Roll",                     x = 12, y = 148,to = SMLSIZE },
        { t = "Pitch",                    x = 12, y = 156,to = SMLSIZE },
        { t = "Yaw",                      x = 12, y = 164,to = SMLSIZE },
        { t = "Gyro Notch 1",             x = 2,  y = 172,to = SMLSIZE },
        { t = "Center",                   x = 12, y = 180,to = SMLSIZE },
        { t = "Cutoff",                   x = 12, y = 188,to = SMLSIZE },
        { t = "Gyro Notch 2",             x = 2,  y = 196,to = SMLSIZE },
        { t = "Center",                   x = 12, y = 204,to = SMLSIZE },
        { t = "Cutoff",                   x = 12, y = 212,to = SMLSIZE },
        { t = "Dyn Notch",                x = 2,  y = 220,to = SMLSIZE },
        { t = "Q",                        x = 12, y = 228,to = SMLSIZE },
        { t = "Min Hz",                   x = 12, y = 236,to = SMLSIZE },
        { t = "Max Hz",                   x = 12, y = 244,to = SMLSIZE },
    },
    fields = {
        -- Gyro Lowpass 1
        { x = 87, y = 20, min = 0, max = 4, to = SMLSIZE, vals = { 31 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } }, -- gyro_lowpass_type
        { x = 87, y = 28, min = 0, max = 16000, to = SMLSIZE, vals = { 19, 20 } }, -- gyro_lowpass_hz[ROLL]
        { x = 87, y = 36, min = 0, max = 16000, to = SMLSIZE, vals = { 21, 22 } }, -- gyro_lowpass_hz[PITCH]
        { x = 87, y = 44, min = 0, max = 16000, to = SMLSIZE, vals = { 23, 24 } }, -- gyro_lowpass_hz[YAW]
        -- Gyro Lowpass 2
        { x = 87, y = 60, min = 0, max = 4, to = SMLSIZE, vals = { 32 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } }, -- gyro_lowpass2_type
        { x = 87, y = 68, min = 0, max = 16000, to = SMLSIZE, vals = { 25, 26 } }, -- gyro_lowpass2_hz[ROLL]
        { x = 87, y = 76, min = 0, max = 16000, to = SMLSIZE, vals = { 27, 28 } }, -- gyro_lowpass2_hz[PITCH]
        { x = 87, y = 84, min = 0, max = 16000, to = SMLSIZE, vals = { 29, 30 } }, -- gyro_lowpass2_hz[YAW]
        -- D Term Lowpass 1
        { x = 87, y = 100,min = 0, max = 4, to = SMLSIZE, vals = { 15 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } }, -- dterm_filter_type
        { x = 87, y = 108,min = 0, max = 1000, to = SMLSIZE, vals = { 1, 2 } }, -- dFilter[ROLL].dLpf
        { x = 87, y = 116,min = 0, max = 1000, to = SMLSIZE, vals = { 3, 4 } }, -- dFilter[PITCH].dLpf
        { x = 87, y = 124,min = 0, max = 1000, to = SMLSIZE, vals = { 5, 6 } }, -- dFilter[YAW].dLpf
        -- D Term Lowpass 2
        { x = 87, y = 140,min = 0, max = 4, to = SMLSIZE, vals = { 16 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } }, -- dterm_filter2_type
        { x = 87, y = 148,min = 0, max = 1000, to = SMLSIZE, vals = { 33, 34 } }, -- dFilter[ROLL].dLpf2
        { x = 87, y = 156,min = 0, max = 1000, to = SMLSIZE, vals = { 35, 36 } }, -- dFilter[PITCH].dLpf2
        { x = 87, y = 164,min = 0, max = 1000, to = SMLSIZE, vals = { 37, 38 } }, -- dFilter[YAW].dLpf2
        -- Gyro Notch 1
        { x = 87, y = 180,min = 0, max = 16000, to = SMLSIZE, vals = { 7, 8 } }, -- gyro_soft_notch_hz_1
        { x = 87, y = 188,min = 0, max = 16000, to = SMLSIZE, vals = { 9, 10 } }, -- gyro_soft_notch_cutoff_1
        -- Gyro Notch 2
        { x = 87, y = 204,min = 0, max = 16000, to = SMLSIZE, vals = { 11, 12 } }, -- gyro_soft_notch_hz_2
        { x = 87, y = 212,min = 0, max = 16000, to = SMLSIZE, vals = { 13, 14 } }, -- gyro_soft_notch_cutoff_2
        -- Dynamic Notch
        { x = 87, y = 228,min = 0, max = 1000, to = SMLSIZE, vals = { 40, 41 } }, -- dyn_notch_q
        { x = 87, y = 236,min = 0, max = 1000, to = SMLSIZE, vals = { 42, 43 } }, -- dyn_notch_min_hz
        { x = 87, y = 244,min = 0, max = 1000, to = SMLSIZE, vals = { 44, 45 } }, -- dyn_notch_max_hz
    },
}