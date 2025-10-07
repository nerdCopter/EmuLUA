return {
    read           = 88, -- MSP_VTX_CONFIG
    write          = 89, -- MSP_SET_VTX_CONFIG
    eepromWrite    = true,
    reboot         = false,
    title          = "VTX",
    minBytes       = 8,
    prevBandVal    = 0,
    prevChanVal    = 0,
    prevFreqVal    = 0,
    lastFreqUpdTS  = 0,
    freqModCounter = 0,

    text = {
        { t = "Band",      x = 10, y = 14, sp = 30 },
        { t = "Chan",      x = 10, y = 24, sp = 30 },
        { t = "Power",     x = 10, y = 34, sp = 30 },
        { t = "Pit",       x = 10, y = 44, sp = 30 },
        { t = "LP Disarm", x = 10, y = 54, sp = 30 },
        { t = "Dev",       x = 70, y = 14, sp = 25 },
        { t = "Freq",      x = 70, y = 24, sp = 25 },
    },

    fields = {
        { t = "Band",    x = 10,  y = 14, sp = 30, min=0, max=5, vals = { 2 }, to = SMLSIZE, table = { [0]="U", "A", "B", "E", "F", "R" }, upd = function(self) self.handleBandChanUpdate(self) end },
        { t = "Chan",    x = 10,  y = 24, sp = 30, min=1, max=8, vals = { 3 }, to = SMLSIZE, upd = function(self) self.handleBandChanUpdate(self) end },
        { t = "Power",   x = 10,  y = 34, sp = 30, min=1, vals = { 4 }, to = SMLSIZE, upd = function(self) self.updatePowerTable(self) end },
        { t = "Pit",     x = 10,  y = 44, sp = 30, min=0, max=1, vals = { 5 }, to = SMLSIZE, table = { [0]="OFF", "ON" } },
        { t = "LP Disarm", x = 10, y = 54, sp = 30, min=0, max=1, vals = { 8 }, to = SMLSIZE, table = { [0]="OFF", "ON" } },
        { t = "Dev",     x = 70,  y = 14, sp = 25, write = false, ro = true, vals = { 1 }, to = SMLSIZE , table = { [1]="6705",[3]="SA",[4]="Tramp",[255]="None"} },
        { t = "Freq",    x = 70,  y = 24, sp = 25, min = 5000, max = 5999, vals = { 6, 7 }, to = SMLSIZE, upd = function(self) self.handleFreqValUpdate(self) end },
    },

    freqLookup = {
        { 5865, 5845, 5825, 5805, 5785, 5765, 5745, 5725 }, -- Boscam A
        { 5733, 5752, 5771, 5790, 5809, 5828, 5847, 5866 }, -- Boscam B
        { 5705, 5685, 5665, 5645, 5885, 5905, 5925, 5945 }, -- Boscam E
        { 5740, 5760, 5780, 5800, 5820, 5840, 5860, 5880 }, -- FatShark
        { 5658, 5695, 5732, 5769, 5806, 5843, 5880, 5917 }, -- RaceBand
    },

    postLoad = function (self)
        if (self.values[2] or 0) < 0 or (self.values[3] or 0) == 0 or (self.values[4] or 0) == 0 then
            self.values = {}
        else
            self.prevBandVal = 0
            self.prevChanVal = 0
            self.prevFreqVal = 0
            local rFreq = (self.values[6] or 0) + ((self.values[7] or 0) * 256)

            if rFreq > 0 then
                self.prevFreqVal = rFreq
                self.fields[6].value = rFreq
                if (self.values[2] or 0) > 0 then -- band != 0
                    self.prevBandVal = self.values[2]
                    self.prevChanVal = self.values[3]
                    self.fields[1].min = 0
                else -- band == 0
                    self.fields[1].min = 0
                    self.prevChanVal = clipValue(math.floor((rFreq - 5100) / 100), self.fields[2].min, self.fields[2].max)
                    self.fields[2].value = self.prevChanVal
                    self.values[3] = self.prevChanVal
                end
            else
                self.values = {}
            end
        end
    end,

    preSave = function(self)
        local valsTemp = {}
        if self.values then
            local channel
            if self.values[2] > 0 then
                channel = (self.values[2]-1)*8 + self.values[3]-1
            elseif self.fields[6].value then
                channel = self.fields[6].value
            else
                channel = 24
            end
            valsTemp[1] = bit32.band(channel,0xFF)
            valsTemp[2] = bit32.rshift(channel,8)
            valsTemp[3] = self.values[4]
            valsTemp[4] = self.values[5]
            valsTemp[5] = self.values[8] or 0
        end
        return valsTemp
    end,

    findNextInFreqTable = function(self, newFreq)
        local startBand, endBand, incFlag
        if newFreq > self.prevFreqVal then
            incFlag = 1
            startBand = 1
            endBand = self.fields[1].max
        else
            incFlag = -1
            startBand = self.fields[1].max
            endBand = 1
        end
        local curBand = self.values[2]
        local curChan = self.values[3]
        local selBand, selChan, selFreq = 0, 0, 0
        local diffVal = 9999
        for band=startBand,endBand,incFlag do
            for chan=self.fields[2].min,self.fields[2].max do
                if band ~= curBand or chan ~= curChan then
                    local fVal = self.freqLookup[band][chan]
                    if incFlag > 0 then
                        if fVal >= self.prevFreqVal and fVal - self.prevFreqVal < diffVal then
                            if fVal ~= self.prevFreqVal or band > curBand then
                                selBand, selChan, selFreq, diffVal = band, chan, fVal, fVal - self.prevFreqVal
                            end
                        end
                    else
                        if fVal <= self.prevFreqVal and self.prevFreqVal - fVal < diffVal then
                            if fVal ~= self.prevFreqVal or band < curBand then
                                selBand, selChan, selFreq, diffVal = band, chan, fVal, self.prevFreqVal - fVal
                            end
                        end
                    end
                end
            end
        end
        return selFreq, selBand, selChan
    end,

    getNextUserFreqValue = function(self, newFreq)
        local now = getTime()
        if now < self.lastFreqUpdTS + 15 then
            self.freqModCounter = self.freqModCounter + (15-(self.lastFreqUpdTS-now))
        else
            self.freqModCounter = 0
        end
        local uFreq
        if self.freqModCounter > 65 then
            local delta = math.floor(self.freqModCounter / 65)
            uFreq = clipValue(newFreq > self.prevFreqVal and newFreq + delta or newFreq - delta, self.fields[6].min, self.fields[6].max)
        else
            uFreq = newFreq
        end
        self.lastFreqUpdTS = now
        return uFreq
    end,

    updatePowerTable = function(self)
        if self.values and not self.fields[3].table then
            local dev, tbl, pMax, pitT, pitTbl
            if self.values[1] == 1 then -- RTC6705
                tbl, pMax, pitT, pitTbl = { 25, 200 }, 2, nil, { [0]="", "" }
            elseif self.values[1] == 3 then -- SmartAudio
                tbl, pMax = { 25, 200, 500, 800 }, 4
            elseif self.values[1] == 4 then -- Tramp
                tbl, pMax = { 25, 100, 200, 400, 600 }, 5
            elseif self.values[1] == 255 then -- None/Unknown
                self.fields[3].t, pMax, self.fields[3].table = nil, 1, { [1]="" }
                pitT, pitTbl = nil, { [0]="", "" }
            end
            self.fields[3].table, self.fields[3].max, self.fields[4].t, self.fields[4].table = tbl, pMax, pitT, pitTbl
        end
    end,

    handleBandChanUpdate = function(self)
        if (#(self.values) or 0) >= self.minBytes and (self.values[3] or 0) > 0 then
            if self.values[2] ~= self.prevBandVal or self.values[3] ~= self.prevChanVal then
                if self.values[2] > 0 then
                    self.prevFreqVal = self.freqLookup[self.values[2]][self.values[3]]
                else
                    self.prevFreqVal = math.floor(5100 + (self.values[3] * 100))
                end
                self.fields[6].value = self.prevFreqVal
                self.values[6] = bit32.band(self.prevFreqVal, 0xFF)
                self.values[7] = bit32.rshift(self.prevFreqVal, 8)
                self.prevBandVal = self.values[2]
                self.prevChanVal = self.values[3]
            end
        end
    end,

    handleFreqValUpdate = function(self)
        if (#(self.values) or 0) >= self.minBytes and (self.fields[6].value or 0) > 0 then
            local newFreq = self.fields[6].value
            if newFreq ~= self.prevFreqVal then
                if self.values[2] == 0 then
                    local uFreq = self.getNextUserFreqValue(self, newFreq)
                    self.prevFreqVal = uFreq
                    if uFreq ~= newFreq then
                        self.fields[6].value = uFreq
                    end
                    self.prevChanVal = clipValue(math.floor((self.prevFreqVal - 5100) / 100), self.fields[2].min, self.fields[2].max)
                    self.fields[2].value = self.prevChanVal
                    self.values[3] = self.prevChanVal
                else
                    local selFreq, selBand, selChan = self.findNextInFreqTable(self, newFreq)
                    if selFreq > 0 then
                        self.prevFreqVal, self.prevBandVal, self.prevChanVal = selFreq, selBand, selChan
                        self.fields[6].value = selFreq
                        self.fields[1].value = selBand
                        self.fields[2].value = selChan
                    else
                        self.fields[6].value = self.prevFreqVal
                    end
                end
            end
        end
    end
}