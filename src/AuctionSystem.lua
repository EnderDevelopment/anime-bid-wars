-- AuctionSystem.lua

local AuctionSystem = {}

-- Initialize auction with starting coins and max characters
function AuctionSystem:init(startingCoins, maxCharacters)
    self.startingCoins = startingCoins
    self.maxCharacters = maxCharacters
    self.players = {}
end

-- Add a player to the auction
function AuctionSystem:addPlayer(playerId, playerName)
    self.players[playerId] = {
        name = playerName,
        coins = self.startingCoins,
        characters = {},
        currentBid = 0
    }
end

-- Place a bid for a character
function AuctionSystem:placeBid(playerId, characterId, bidAmount)
    local player = self.players[playerId]
    if player.coins >= bidAmount and #player.characters < self.maxCharacters then
        player.coins = player.coins - bidAmount
        player.currentBid = bidAmount
        table.insert(player.characters, characterId)
        return true
    end
    return false
end

-- Check if auction is over
function AuctionSystem:isAuctionOver()
    for _, player in pairs(self.players) do
        if #player.characters < self.maxCharacters and player.coins > 0 then
            return false
        end
    end
    return true
end

return AuctionSystem