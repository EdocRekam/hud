--
-- Missing documentation
--
HudReader = {}

--
-- Returns the unit current health percentage, DEAD or N/A
--
function HudReader:ReadUnitHealthString(unit, dead, na)
    local maxHealth=UnitHealthMax(unit)
    if (0 == maxHealth) then
      return na
    end

    local health = UnitHealth(unit)
    if (0 == health and UnitIsDead(unit)) then
      return dead
    end

    return ("%03i"):format(health/maxHealth*100)
end

--
-- Returns the unit current power percentage, DEAD or N/A
--
function HudReader:ReadUnitPowerString(unit, dead, na)
    local maxPower = UnitPowerMax(unit)
    if (0 == maxPower) then
      return na
    end

    local power = UnitPower(unit)
    if (0 == power and UnitIsDead(unit)) then
      return dead
    end

    return ("%03i"):format(power/maxPower*100)
end

--
-- Returns the player current health percentage, DEAD or N/A
--
function HudReader:ReadPlayerHealth()
    return "H "..HudReader:ReadUnitHealthString("player", "DEAD", "N/A")
end

--
-- Returns the target current health percentage, DEAD or N/A
--
function HudReader:ReadTargetHealth()
  return "TH "..HudReader:ReadUnitHealthString("target", "DEAD", "N/A")
end

--
-- Returns the target current power percentage if the unit
-- is alive; otherwise an empty string.
--
function HudReader:ReadPlayerPower()
  return "P "..HudReader:ReadUnitPowerString("player", "", "")
end

--
-- Returns the focus current health percentage, DEAD or N/A
--
function HudReader:ReadFocusHealth()
  return "FH "..HudReader:ReadUnitHealthString("focus", "DEAD", "N/A")
end

--
-- Returns various status indicators
-- L indicates that combat is logged
-- B indicates that major incoming damage is coming and the tank should block/barrier/move
-- I indicates that the target should be interrupted
-- T indicates to taunt off other tank
--
function HudReader:ReadStatus()
  local logging
  if LoggingCombat() then logging = "L" else logging = "-" end
  return ("%s---"):format(logging)
end

--
-- Returns the current player threat on her target.
--
function HudReader:ReadTargetThreat()
  local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation("player", "target")
  if threatpct == nil then threatpct = 0 end
  return (" T %03i"):format(threatpct)
end