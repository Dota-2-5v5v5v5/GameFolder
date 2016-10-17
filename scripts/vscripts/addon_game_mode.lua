require('internal/util')
require('trialsofretribution')

function Precache( context )
end

function Activate()
  GameRules:GetGameModeEntity():SetCameraDistanceOverride(1700)
end
