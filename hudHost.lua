--
-- Missing documentation
--
HudHost = {}

--
-- Missing documentation
--
function HudHost:New()
  local object = {}
  setmetatable(object, self)
  self.__index = self
  return object
end

--
-- Missing documentation
--
function HudHost:Create()
  local host = HudHost:New()

  host.Font               = "interface\\addons\\hud\\fonts\\Inconsolata-Regular.ttf"
  host.FontSize           = 11
  host.Frame              = HudHost:CreateMainFrame()
  host.PlayerHealth       = host:CreateLabel(-100, 100)
  host.PlayerPower        = host:CreateLabel(-100, 85)
  host.Status             = host:CreateLabel(-100, 60)
  host.TargetHealth       = host:CreateLabel(100, 100)
  host.TargetThreat       = host:CreateLabel(100, 85)
  host.FocusHealth        = host:CreateLabel(100, 60)
  host.Data               = HudData:Create()
  host.Frame.EventManager = HudEvents:Create(host)

  return host
end

--
-- Missing documentation
--
function HudHost:CreateMainFrame()
    local frame = CreateFrame("Frame", nil, UIParent)

    frame:SetFrameStrata("BACKGROUND")
    frame:SetWidth(256)
    frame:SetHeight(256)
    frame:SetPoint("CENTER", 0, 0)

    return frame;
end

--
-- Missing documentation
--
function HudHost:CreateLabel(top, left)
    local label = self.Frame:CreateFontString(nil,"OVERLAY")

    label:SetPoint("CENTER", UIParent, "CENTER", top, left)
    label:SetFont(self.Font, self.FontSize)
    label:SetTextColor(.51,1,.28)
    label:SetJustifyH("LEFT")
    return label
end

--
-- Missing Documentation
--
function HudHost:PlayerHealthChanged(old, new)
  self.PlayerHealth:SetText(new)
end

--
-- Missing Documentation
--
function HudHost:PlayerPowerChanged(old, new)
  self.PlayerPower:SetText(new)
end

--
-- Missing Documentation
--
function HudHost:TargetHealthChanged(old, new)
  self.TargetHealth:SetText(new)
end

--
-- Missing Documentation
--
function HudHost:FocusHealthChanged(old, new)
  self.FocusHealth:SetText(new)
end

--
-- Missing Documentation
--
function HudHost:TargetThreatChanged(old, new)
  self.TargetThreat:SetText(new)
end