
return {
    read              = 92, -- MSP_FILTER_CONFIG
    write             = 93, -- MSP_SET_FILTER_CONFIG
    title             = "Filters",
    eepromWrite       = true,
    reboot            = false,
    minBytes          = 60, -- Approximate
    yMinLimit         = 11,
    yMaxLimit         = 52,
    text= {
        { t = "DTerm LPF 1 R/P/Y", x = 2, y = 12, to = SMLSIZE },
        { t = "Gyro Notch 1 HZ/CF", x = 2, y = 20, to = SMLSIZE },
        { t = "Gyro Notch 2 HZ/CF", x = 2, y = 28, to = SMLSIZE },
        { t = "DTerm LPF Type", x = 2, y = 36, to = SMLSIZE },
        { t = "Gyro LPF Type", x = 2, y = 44, to = SMLSIZE },
    },
    fields = {
        -- D Term Lowpass 1 (3x U16)
        { x = 87, y = 12, min = 0, max = 1000, to = SMLSIZE, vals = { 1, 2 } },
        -- Gyro Notch 1 (2x U16)
        { x = 87, y = 20, min = 0, max = 16000, to = SMLSIZE, vals = { 7, 8 } },
        { x = 87, y = 20, min = 0, max = 16000, to = SMLSIZE, vals = { 9, 10 } },
        -- Gyro Notch 2 (2x U16)
        { x = 87, y = 28, min = 0, max = 16000, to = SMLSIZE, vals = { 11, 12 } },
        { x = 87, y = 28, min = 0, max = 16000, to = SMLSIZE, vals = { 13, 14 } },
        -- Dterm LPF type (U8)
        { x = 87, y = 36, min = 0, max = 4, to = SMLSIZE, vals = { 15 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } },
        -- Gyro LPF type (U8)
        { x = 87, y = 44, min = 0, max = 4, to = SMLSIZE, vals = { 32 }, table = { "PT1", "BIQUAD", "PT2", "PT3", "PT4" } },
    },
}