--
-- Missing documentation
--
HudEvents = {}

--
-- Missing documentation
--
function HudEvents:New()
  local object = {}
  setmetatable(object, self)
  self.__index = self
  return object
end

--
-- Missing documentation
--
local function EventHandler(frame, event, arg1, ...)
  local eventManager = frame.EventManager

  if (("UNIT_HEALTH" == event) or ("UNIT_MAXHEALTH" == event)) then
    if ("player" == arg1) then
      eventManager:RaisePlayerHealthChanged()
    elseif("target" == arg1) then
      eventManager:RaiseTargetHealthChanged()
    elseif("focus" == arg1) then
      eventManager:RaiseFocusHealthChanged()
    end
  elseif (("UNIT_POWER" == event) or ("UNIT_MAXPOWER" == event) or ("UNIT_DISPLAYPOWER" == event)) then
    if ("player" == arg1) then
      eventManager:RaisePlayerPowerChanged()
    end
  elseif ("PLAYER_TARGET_CHANGED" == event) then
    eventManager:RaiseTargetHealthChanged()
    eventManager:RaiseTargetThreatChanged()
  elseif ("PLAYER_FOCUS_CHANGED" == event) then
    eventManager:RaiseFocusHealthChanged()
  elseif ("PLAYER_LEVEL_UP" == event) or ("PLAYER_UNGHOST" == event) then
    eventManager:RaisePlayerHealthChanged()
  elseif ("PLAYER_ENTERING_WORLD") then
    eventManager:RaisePlayerHealthChanged()
    eventManager:RaisePlayerPowerChanged()
    eventManager:RaiseTargetHealthChanged()
    eventManager:RaiseFocusHealthChanged()
    eventManager:RaiseTargetThreatChanged()
  elseif ("UNIT_THREAT_LIST_UPDATE") then
    if ("player" == arg1) then
      eventManager:RaiseTargetThreatChanged()
    end
  end
end

--
-- Missing documentation
--
function HudEvents:Create(parent)
  local hudEvents = HudEvents:New()

  hudEvents.Host = parent
  hudEvents.Host.Frame:SetScript("OnEvent", EventHandler)
  hudEvents:Register()

  return hudEvents;
end

--
-- Missing documentation
--
function HudEvents:Register()
  local frame = self.Host.Frame;
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
  frame:RegisterEvent("PLAYER_TARGET_CHANGED")
  frame:RegisterEvent("UNIT_DISPLAYPOWER")
  frame:RegisterEvent("UNIT_HEALTH")
  frame:RegisterEvent("UNIT_MAXHEALTH")
  frame:RegisterEvent("UNIT_MAXPOWER")
  frame:RegisterEvent("UNIT_POWER")
  frame:RegisterEvent("UNIT_THREAT_LIST_UPDATE")
end

--
-- Missing documentation
--
function HudEvents:RaisePlayerPowerChanged()
    local oldValue = self.Host.Data.PlayerPower
    local newValue = HudReader.ReadPlayerPower()
    if (oldValue == newValue) then return end
    self.Host:PlayerPowerChanged(oldValue, newValue)
end

--
-- Missing documentation
--
function HudEvents:RaisePlayerHealthChanged()
    local oldValue = self.Host.Data.PlayerHealth
    local newValue = HudReader.ReadPlayerHealth()
    if (oldValue == newValue) then return end
    self.Host:PlayerHealthChanged(oldValue, newValue)
end

--
-- Missing documentation
--
function HudEvents:RaiseTargetHealthChanged()
    local oldValue = self.Host.Data.TargetHealth
    local newValue = HudReader.ReadTargetHealth()
    if (oldValue == newValue) then return end
    self.Host:TargetHealthChanged(oldValue, newValue)
end

--
-- Missing documentation
--
function HudEvents:RaiseFocusHealthChanged()
    local oldValue = self.Host.Data.FocusHealth
    local newValue = HudReader.ReadFocusHealth()
    if (oldValue == newValue) then return end
    self.Host:FocusHealthChanged(oldValue, newValue)
end

--
-- Missing documentation
--
function HudEvents:RaiseTargetThreatChanged()
    local oldValue = self.Host.Data.TargetThreat
    local newValue = HudReader.ReadTargetThreat()
    if (oldValue == newValue) then return end
    self.Host:TargetThreatChanged(oldValue, newValue)
end