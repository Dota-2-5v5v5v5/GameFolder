-- This file contains all trialsofretribution-registered events and has already set up the passed-in parameters for your use.

-- Cleanup a player when they leave
function Trialsofretribution:OnDisconnect(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] Player Disconnected ' .. tostring(keys.userid))
  DebugPrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function Trialsofretribution:OnGameRulesStateChange(keys)
  DebugPrint("[TRIALSOFRETRIBUTION] GameRules State Changed")
  DebugPrintTable(keys)

  local newState = GameRules:State_Get()
end

-- An NPC has spawned somewhere in game.  This includes heroes
function Trialsofretribution:OnNPCSpawned(keys)
  DebugPrint("[TRIALSOFRETRIBUTION] NPC Spawned")
  DebugPrintTable(keys)

  local npc = EntIndexToHScript(keys.entindex)
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function Trialsofretribution:OnEntityHurt(keys)
  --DebugPrint("[TRIALSOFRETRIBUTION] Entity Hurt")
  --DebugPrintTable(keys)

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if keys.entindex_attacker ~= nil and keys.entindex_killed ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)

    -- The ability/item used to damage, or nil if not damaged by an item/ability
    local damagingAbility = nil

    if keys.entindex_inflictor ~= nil then
      damagingAbility = EntIndexToHScript( keys.entindex_inflictor )
    end
  end
end

-- An item was picked up off the ground
function Trialsofretribution:OnItemPickedUp(keys)
  DebugPrint( '[TRIALSOFRETRIBUTION] OnItemPickedUp' )
  DebugPrintTable(keys)

  local unitEntity = nil
  if keys.UnitEntitIndex then
    unitEntity = EntIndexToHScript(keys.UnitEntitIndex)
  elseif keys.HeroEntityIndex then
    unitEntity = EntIndexToHScript(keys.HeroEntityIndex)
  end

  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function Trialsofretribution:OnPlayerReconnect(keys)
  DebugPrint( '[TRIALSOFRETRIBUTION] OnPlayerReconnect' )
  DebugPrintTable(keys) 
end

-- An item was purchased by a player
function Trialsofretribution:OnItemPurchased( keys )
  DebugPrint( '[TRIALSOFRETRIBUTION] OnItemPurchased' )
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function Trialsofretribution:OnAbilityUsed(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] AbilityUsed')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function Trialsofretribution:OnNonPlayerUsedAbility(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnNonPlayerUsedAbility')
  DebugPrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function Trialsofretribution:OnPlayerChangedName(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerChangedName')
  DebugPrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function Trialsofretribution:OnPlayerLearnedAbility( keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerLearnedAbility')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function Trialsofretribution:OnAbilityChannelFinished(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnAbilityChannelFinished')
  DebugPrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function Trialsofretribution:OnPlayerLevelUp(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerLevelUp')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function Trialsofretribution:OnLastHit(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnLastHit')
  DebugPrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local killedEnt = EntIndexToHScript(keys.EntKilled)
end

-- A tree was cut down by tango, quelling blade, etc
function Trialsofretribution:OnTreeCut(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnTreeCut')
  DebugPrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function Trialsofretribution:OnRuneActivated (keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnRuneActivated')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_BOUNTY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function Trialsofretribution:OnPlayerTakeTowerDamage(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerTakeTowerDamage')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function Trialsofretribution:OnPlayerPickHero(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerPickHero')
  DebugPrintTable(keys)

  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

-- A player killed another player in a multi-team context
function Trialsofretribution:OnTeamKillCredit(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnTeamKillCredit')
  DebugPrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end


-- An entity died
function Trialsofretribution:_OnEntityKilled( keys )
  DebugPrint( '[TRIALSOFRETRIBUTION] OnEntityKilled Called' )
  DebugPrintTable( keys )

  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  -- The ability/item used to kill, or nil if not killed by an item/ability
  local killerAbility = nil

  if keys.entindex_inflictor ~= nil then
    killerAbility = EntIndexToHScript( keys.entindex_inflictor )
  end

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if killedUnit:IsFort() then
    --TODO: Uncomment this when bugfixing OnFortKilled
    Trialsofretribution:OnFortKilled( keys )
  end

  -- Put code here to handle when an entity gets killed
end

function Trialsofretribution:OnFortKilled( keys )
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  local killedTeam = killedUnit:GetTeamNumber()

  local all_units = Entities:FindAllInSphere(Vector(0,0,0), 12000.0)
  local remainingFort
  local fortCount = 0
  local players = {}

  --Destroy all units from team that lost, find all players on that team
  for number,entity in pairs(all_units) do

    if entity:GetTeamNumber() == killedTeam then
      --print("number", number, "entity", entity:GetName())
      if entity ~= killedUnit then
        --Record all the players on the killed team
        if entity:IsHero() then
          local contains = false
          for _, value in pairs(players) do
            if value == entity:GetPlayerId() then
              contains = true
            end
          end
          if contains == false then
            table.insert(players, entity:GetPlayerId())
          end
        end
        --print("removing unit..", entity:GetName())
        entity:RemoveSelf()
      end
    end
    if IsValidEntity(entity) and entity ~= killedUnit and isAncient(entity) then
      fortCount = fortCount + 1
      remainingFort = entity
    end
  end
  if fortCount == 1 then
    GameRules:SetGameWinner(remainingFort:GetTeamNumber())
    GameRules:SetSafeToLeave(true)
    GameRules:Defeated()
  end

  --puts all the players on the lost team on custom team 3
  for _, player in pairs(players) do
    PlayerResource:SetCustomTeamAssignment( player:GetPlayerId(), DOTA_TEAM_CUSTOM_3 )
  end


  --todo: make custom 3 spectator like

end

function isAncient(entity)
  local name = entity:GetName()
  return name == "tempestancient" or name == "kanikancient" or name == "radiantancient" or name == "direancient"
end


-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function Trialsofretribution:PlayerConnect(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] PlayerConnect')
  DebugPrintTable(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function Trialsofretribution:OnConnectFull(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnConnectFull')
  DebugPrintTable(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever illusions are created and tells you which was/is the original entity
function Trialsofretribution:OnIllusionsCreated(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnIllusionsCreated')
  DebugPrintTable(keys)

  local originalEntity = EntIndexToHScript(keys.original_entindex)
end

-- This function is called whenever an item is combined to create a new item
function Trialsofretribution:OnItemCombined(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnItemCombined')
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end
  local player = PlayerResource:GetPlayer(plyID)

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
end

-- This function is called whenever an ability begins its PhaseStart phase (but before it is actually cast)
function Trialsofretribution:OnAbilityCastBegins(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnAbilityCastBegins')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityName = keys.abilityname
end

-- This function is called whenever a tower is killed
function Trialsofretribution:OnTowerKill(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnTowerKill')
  DebugPrintTable(keys)

  local gold = keys.gold
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local team = keys.teamnumber
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function Trialsofretribution:OnPlayerSelectedCustomTeam(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnPlayerSelectedCustomTeam')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end

-- This function is called whenever an NPC reaches its goal position/target
function Trialsofretribution:OnNPCGoalReached(keys)
  DebugPrint('[TRIALSOFRETRIBUTION] OnNPCGoalReached')
  DebugPrintTable(keys)

  local goalEntity = EntIndexToHScript(keys.goal_entindex)
  local nextGoalEntity = EntIndexToHScript(keys.next_goal_entindex)
  local npc = EntIndexToHScript(keys.npc_entindex)
end

-- This function is called whenever any player sends a chat message to team or All
function Trialsofretribution:OnPlayerChat(keys)
  local teamonly = keys.teamonly
  local userID = keys.userid
  --TODO: Fix, This line was throwing a null value error so I commented it out for now
  --local playerID = self.vUserIds[userID]:GetPlayerID()

  local text = keys.text
end

function printTable(t)

  function printTableHelper(t, spacing)
    for k,v in pairs(t) do
      print(spacing..tostring(k), v)
      if (type(v) == "table") then
        printTableHelper(v, spacing.."\t")
      end
    end
  end

  printTableHelper(t, "");
end
