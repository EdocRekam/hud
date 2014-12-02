--
-- Represents the formatted data displayed in the HUD
--
HudData = {}

--
-- Missing Documentation
--
function HudData:Create()
  return
  {
    PlayerHealth = "",
    PlayerPower  = "",
    TargetHealth = "",
    TargetThreat = "",
    Status       = "",
    FocusHealth  = ""
  }
end

--
-- Creates a deep copy of this hudData instance
--
function HudData:Copy()
  return
  {
    PlayerHealth = self.PlayerHealth,
    PlayerPower  = self.PlayerPower,
    TargetHealth = self.TargetHealth,
    TargetThreat = self.TargetThreat,
    Status       = self.Status,
    FocusHealth  = self.FocusHealth
  }
end

--
-- Creates a deep copy of this hudData instance
--
function HudData:Write(destination)
  destination.PlayerHealth = self.PlayerHealth
  destination.PlayerPower  = self.PlayerPower
  destination.TargetHealth = self.TargetHealth
  destination.TargetThreat = self.TargetThreat
  destination.Status       = self.Status
  destination.FocusHealth  = self.FocusHealth
end
