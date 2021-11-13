local A, L = ...

HAL_A = 'Interface\\AddOns\\oUF_Narden\\media\\HalA'
HAL_J = 'Interface\\AddOns\\oUF_Narden\\media\\HalJ'
HAL_K = 'Interface\\TargetingFrame\\UI-StatusBar.blp'
--HAL_K = 'Interface\\AddOns\\oUF_Narden\\media\\HalK'
BUTTON_BORDER = 'Interface\\AddOns\\!nCore\\media\\Button\\Normal_Square.tga'
INDICATOR = 'Interface\\AddOns\\oUF_Narden\\media\\borderIndicator'
HIGHLIGHT = 'Interface\\AddOns\\oUF_Narden\\media\\statusbar_highlight'

scale =1
--widthBig = 300 301.20
widthBig = 228
widthSmall = 95
heightSmall = 38
heightBig = 50
heightPower = 5

font = 'Fonts\\ARIALN.ttf'
fontsmall = 14
fontsize = 16
fontlarge = 22
fontoutline = 'THINOUTLINE'
	
playerPosition = {'BOTTOMRIGHT', UIParent, 'BOTTOM', -143, 331}
targetPosition = {'BOTTOMLEFT', UIParent, 'BOTTOM', 143, 331}
targettargetPosition = {'LEFT', 'oUF_NardenTarget', 'RIGHT', 3, 0}
focusPosition = {'RIGHT', UIParent, 'RIGHT', -302, -75}
petPosition = {'RIGHT', 'oUF_NardenPlayer', 'LEFT', -3, 0}
bossPosition = {'LEFT', UIParent, 'LEFT', 302, -75}
raidPosition = {'TOP', UIParent, 'BOTTOM', 0, 280} 
raidPositionDamage = {'TOPLEFT', UIParent, 'TOPLEFT', 34, -15}
