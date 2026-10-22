-- GameManager.lua

local AuctionSystem = require(script.Parent.AuctionSystem)
local BattleSystem = require(script.Parent.BattleSystem)

local GameManager = {}

-- Initialize the game
function GameManager:init(startingCoins, maxCharacters)
    self.auctionSystem = AuctionSystem:init(startingCoins, maxCharacters)
    self.battleSystem = BattleSystem
end

-- Add players to the game
function GameManager:addPlayers(player1Id, player1Name, player2Id, player2Name)
    self.auctionSystem:addPlayer(player1Id, player1Name)
    self.auctionSystem:addPlayer(player2Id, player2Name)
end

-- Place a bid for a character
function GameManager:placeBid(playerId, characterId, bidAmount)
    return self.auctionSystem:placeBid(playerId, characterId, bidAmount)
end

-- Check if the auction is over
function GameManager:isAuctionOver()
    return self.auctionSystem:isAuctionOver()
end

-- Start the battle and determine the winner
function GameManager:startBattle(player1Team, player2Team)
    return self.battleSystem:determineWinner(player1Team, player2Team)
end

-- Add sound effects and visual effects
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Load sound effects
local auctionSound = Instance.new("Sound")
auctionSound.SoundId = "rbxassetid://YOUR_AUCTION_SOUND_ID"
auctionSound.Parent = SoundService

local battleSound = Instance.new("Sound")
battleSound.SoundId = "rbxassetid://YOUR_BATTLE_SOUND_ID"
battleSound.Parent = SoundService

-- Add visual effects
local function playAuctionEffect()
    local effect = Instance.new("ParticleEmitter")
    effect.Texture = "rbxassetid://YOUR_AUCTION_EFFECT_TEXTURE_ID"
    effect.Parent = workspace
    effect:Emit(10)
    game:GetService("Debris"):AddItem(effect, 2)
end

local function playBattleEffect()
    local effect = Instance.new("ParticleEmitter")
    effect.Texture = "rbxassetid://YOUR_BATTLE_EFFECT_TEXTURE_ID"
    effect.Parent = workspace
    effect:Emit(20)
    game:GetService("Debris"):AddItem(effect, 3)
end

-- Play sound effects and visual effects during auction
function GameManager:playAuctionEffects()
    auctionSound:Play()
    playAuctionEffect()
end

-- Play sound effects and visual effects during battle
function GameManager:playBattleEffects()
    battleSound:Play()
    playBattleEffect()
end

return GameManager