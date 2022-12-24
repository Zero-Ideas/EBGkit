
local ebgkit = {}

--[[ 
FUNCTION: ebgkit:GetMouse()
ACCEPTED ARGUMENTS: <nil> (accepts no arguments)
RETURNS: <Mouse>
gets your mouse

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetMouse() -- returns your mouse
]]
function ebgkit:GetMouse()
    return game.Players.LocalPlayer:GetMouse()
end


--[[
FUNCTION: ebgkit:GetPlayer(player)
ACCEPTED ARGUMENTS: player: <String> (mandatory)
RETURNS: <Instance: Player>
gets a player from a complete or incomplete name

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetPlayer("test") -- returns game.Players.testdummy123

the function will return nil if the player is not found
]]
function ebgkit:GetPlayer(string)
    local lower = string:lower()
    for _, plr in next, game.Players:GetPlayers() do
        if plr.Name:sub(1,#string):lower() == lower or plr.DisplayName:sub(1,#string):lower() == lower then
            return plr
        end
    end
    return nil
end


--[[
FUNCTION: ebgkit:GetCharacter(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <Instance: Model>
gets a player's character model from a complete or incomplete name
if no argument is given, it will return your character

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetCharacter("test") -- returns game.Workspace.testdummy123 OR game.Players.testdummy123.Character
ebgkit:GetCharacter(game.Players.testdummy123) -- returns game.Workspace.testdummy123 OR game.Players.testdummy123.Character


]]

function ebgkit:GetCharacter(player)
    if player then
        if type(player) == "string" then
            player = ebgkit:GetPlayer(player)
        end
        return player.Character
    else
        return game.Players.LocalPlayer.Character
    end
end



--[[
FUNCTION: ebgkit:GetServerMousePos(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <Vector3> (player's mouse position)
gets a player's character model from a complete or incomplete name
if no argument is given, it will return your mouse position

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()

ebgkit:GetServerMousePos("test") -- returns testdummy123's mouse position
ebgkit:GetServerMousePos(game.Players.testdummy123) -- returns testdummy123's mouse position
ebgkit:GetServerMousePos() -- returns your mouse position

]]

function ebgkit:GetServerMousePos(player)
    if player then
        if type(player) == "string" then
            player = ebgkit:GetPlayer(player)
        end
        return getrenv()._G["ClientsData"][player]["Mouse"]
    else
        return getrenv()._G["ClientsData"][game.Players.LocalPlayer]["Mouse"]
    end
end




--[[
FUNCTION: ebgkit:GetServerCameraPos(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <Vector3> (player's camera position)
gets a player's character model from a complete or incomplete name
if no argument is given, it will return your camera position

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()

ebgkit:GetServerCameraPos("test") -- returns testdummy123's camera position
ebgkit:GetServerCameraPos(game.Players.testdummy123) -- returns testdummy123's camera position
ebgkit:GetServerCameraPos() -- returns your Camera position

]]


function ebgkit:GetServerCameraPos(player)
    if player then
        if type(player) == "string" then
            player = ebgkit:GetPlayer(player)
        end
        return getrenv()._G["ClientsData"][player]["Camera"]
    else
        return getrenv()._G["ClientsData"][game.Players.LocalPlayer]["Camera"]
    end
end





--[[
FUNCTION: ebgkit:GetNearestPlayer(specifiedradius)
ACCEPTED ARGUMENTS: specifiedradius: <Integer> (number) (optional)
RETURNS: <Instance: Player> (nearest player)
gets the nearest player within a specified radius
if no radius is specified, it will get the nearest player in the game

example:
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetNearestPlayer(100) -- returns the nearest player within 100 studs
ebgkit:GetNearestPlayer() -- returns the nearest player in the game

]]

function ebgkit:GetNearestPlayer(specifiedradius)
    local radius = specifiedradius or math.huge
    local p = nil
    for i,v in pairs(game.Players:GetPlayers()) do
        if v == game.Players.LocalPlayer then continue end
        if v.Character == nil or v.Character.Parent == nil or v.Character:FindFirstChild('HumanoidRootPart') == nil then continue end
        if v.Character.Humanoid.Health <= 0 then continue end
        local d = game.Players.LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
        if d < radius then
            radius = d
            p = v
        end
    end
    return p
end


--[[
FUNCTION: ebgkit:GetNearestPlayerToMouse(specifiedradius)
ACCEPTED ARGUMENTS: specifiedradius: <Integer> (number) (optional)
RETURNS: <Instance: Player> (nearest player)
gets the nearest player to your mouse within a specified radius
if no radius is specified, it will get the nearest player to your mouse in the game

example:
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetNearestPlayerToMouse(100) -- returns the nearest player within 100 studs
ebgkit:GetNearestPlayerToMouse() -- returns the nearest player in the game

]]

function ebgkit:GetNearestPlayerToMouse(specifiedradius)
    local radius = specifiedradius or math.huge
    local mouse = game.Players.LocalPlayer:GetMouse()
    local p = nil
    for i,v in pairs(game.Players:GetPlayers()) do
        if v == game.Players.LocalPlayer then continue end
        if v.Character == nil or v.Character.Parent == nil or v.Character:FindFirstChild('HumanoidRootPart') == nil then continue end
        if v.Character.Humanoid.Health <= 0 then continue end
        local d = (mouse.Hit.p - v.Character.HumanoidRootPart.Position).Magnitude
        if d < radius then
            radius = d
            p = v
        end
    end
    return p
end


--[[
FUNCTION: ebgkit:GetPlayerData(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <Table> (player's data)
gets a player's game data from a complete or incomplete name
if no argument is given, it will return your game data

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()

ebgkit:GetPlayerData("test") -- returns testdummy123's data
ebgkit:GetPlayerData(game.Players.testdummy123) -- returns testdummy123's data
]]
function ebgkit:GetPlayerData(player)
    if player then
        if type(player) == "string" then
            player = ebgkit:GetPlayer(player)
        end
        return getrenv()._G["PlayersData"][player]
    else
        return getrenv()._G["PlayersData"][game.Players.LocalPlayer]
    end
end


--[[
FUNCTION: ebgkit:IsHitByAce()
ACCEPTED ARGUMENTS: : <nil> (accepts no arguments)
RETURNS: <Boolean> (true if you are hit by ace, false if not)

example:

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:IsHitByAce() -- returns true if you are hit by ace, false if not
]]
function ebgkit:IsHitByAce()
    return getrenv()._G.MoveDirection <= 0
end

--[[
FUNCTION: ebgkit:SetMoveDirection(MoveDirection)
ACCEPTED ARGUMENTS: MoveDirection: <Integer> (number)
RETURNS: <Boolean> (true if the the movedirection was set, false if not)
if the movedirection is positive, you will move as normal
if the movedirection is negative, your movement will be reversed
if the movedirection is 0, you will be unable to move

example:

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:SetMoveDirection(1) - returns true 
]]
function ebgkit:SetMoveDirection(MoveDirection)
    local success, response = pcall(function()
        local x = tonumber(tostring(MoveDirection))
    end)
    if success then
        getrenv()._G.MoveDirection = MoveDirection
    end
    return success
end

--[[
FUNCTION: ebgkit:IsHoldingMouse(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <Boolean> (true if the player is holding their mouse, false if not)
if no argument is given, it will return wether you are holding your mouse or not.

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()

ebgkit:IsHoldingMouse("test") -- returns true if testdummy123 is holding their mouse, false if not
ebgkit:IsHoldingMouse(game.Players.testdummy123) -- returns true if testdummy123 is holding their mouse, false if not
ebgkit:IsHoldingMouse() -- returns true if you are holding your mouse, false if not
]]
function ebgkit:IsHoldingMouse(player)
    if player then
        if type(player) == "string" then
            player = ebgkit:GetPlayer(player)
        end
        return getrenv()._G["ClientsData"][player]["Holding"]
    else
        return getrenv()._G["ClientsData"][game.Players.LocalPlayer]["Holding"]
    end
end

--[[
FUNCTION: ebgkit:FireSpell(element, spell, arguments, charge)
ACCEPTED ARGUMENTS: element: <String> (mandatory) spell: <String> (mandatory) arguments: <Table> <Any> (optional) charge: <Integer> (optional)
RETURNS: <nil> (no arguments are returned)
fires a spell
if arguments is a table, it will fire the DoClientMagic remote with the first element in the table. It will then fire the DoMagic remote with second element in the table
if a charge is specified, it will wait for that amount of time before firing the DoMagic remote to simulate charging

example:
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:FireSpell("Fire","Great Fire Blast") -- will activate great fire blast

]]
function ebgkit:FireSpell(element,spell,arguments,charge)
    local usetable = false
    if type(arguments) == "table" then
        if #arguments == 2 then
            for i,v in pairs(arguments) do
                usetable = (type(i) == "number")
            end
        end
    end
    if usetable then
        game:GetService("ReplicatedStorage").Remotes.DoClientMagic:FireServer(element,spell,arguments[1])
    else
        game:GetService("ReplicatedStorage").Remotes.DoClientMagic:FireServer(element,spell)
    end
    
    if charge then
        wait(charge)
    end
    if arguments then
        if usetable then
            game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer(element,spell,arguments[2])
        else
            game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer(element,spell,arguments)
        end
    else
        game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer(element,spell)
    end
end


--[[
FUNCTION: ebgkit:Punch(player)
ACCEPTED ARGUMENTS: player: <Instance> <String> (optional)
RETURNS: <nil> (no arguments are returned)
attempts to punch a player
if no argument is given, it will attempt to punch the nearest player within 50 studs

example:
there is a player called testdummy123

local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:Punch() -- will attempt to punch the nearest player within 50 studs
ebgkit:Punch("test") -- will attempt to punch testdummy123
ebgkit:Punch(game.Players.testdummy123) -- will attempt to punch testdummy123

]]
function ebgkit:Punch(player)
    if game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character.Parent == nil or game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') == nil then return end
    local p = player or ebgkit:GetNearestPlayer(50)
    if type(p) == "string" then
        p = ebgkit:GetPlayer(p)
    end
    if p ~= nil then    
        game.ReplicatedStorage.Remotes.Combat:FireServer(1)
        game.ReplicatedStorage.Remotes.Combat:FireServer(workspace:FindFirstChild(p.Name))
    end
end

return ebgkit
