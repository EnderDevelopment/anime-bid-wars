-- BattleSystem.lua

local BattleSystem = {}

-- Calculate the total power of a team
local function calculateTeamPower(team)
    local totalPower = 0
    for _, character in ipairs(team) do
        totalPower = totalPower + character.power
    end
    return totalPower
end

-- Determine the winner of the battle
function BattleSystem:determineWinner(player1Team, player2Team)
    local player1Power = calculateTeamPower(player1Team)
    local player2Power = calculateTeamPower(player2Team)

    if player1Power > player2Power then
        return "Player 1"
    elseif player2Power > player1Power then
        return "Player 2"
    else
        return "Tie"
    end
end

return BattleSystem