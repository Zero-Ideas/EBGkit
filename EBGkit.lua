local function ebgkit_loader()
    local ebgkit = {}
    
    function ebgkit:GetMouse()
        return game.Players.LocalPlayer:GetMouse()
    end

    function ebgkit:GetPlayer(string)
        local lower = string:lower()
        for _, plr in next, game.Players:GetPlayers() do
            if plr.Name:sub(1,#string):lower() == lower or plr.DisplayName:sub(1,#string):lower() == lower then
                return plr
            end
        end
        return nil
    end

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
    
    function ebgkit:GetNearestPlayerToMouse(specifiedradius)
        local radius = specifiedradius or math.huge
        local p = nil
        for i,v in pairs(game.Players:GetPlayers()) do
            if v == game.Players.LocalPlayer then continue end
            if v.Character == nil or v.Character.Parent == nil or v.Character:FindFirstChild('HumanoidRootPart') == nil then continue end
            if v.Character.Humanoid.Health <= 0 then continue end
            local d = (game.Players.LocalPlayer:GetMouse().Hit.p - v.Character.HumanoidRootPart.Position).Magnitude
            print(d)
            if d < radius then
                radius = d
                p = v
            end
        end
        return p
    end

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

    function ebgkit:IsHitByAce()
        return getrenv()._G.MoveDirection <= 0
    end
    
    function ebgkit:IsHoldingMouse(player)
        if player then
            return getrenv()._G["ClientsData"][player]["Holding"]
        else
            return getrenv()._G["ClientsData"][game.Players.LocalPlayer]["Holding"]
        end
    end

    function ebgkit:FireSpell(element,spell,arguments,charge)
        game:GetService("ReplicatedStorage").Remotes.DoClientMagic:FireServer(element,spell)
        if charge then
            wait(charge)
        end
        if arguments then
            game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer(element,spell,arguments)
        else
            game:GetService("ReplicatedStorage").Remotes.DoMagic:InvokeServer(element,spell)
        end
    end

    function ebgkit:Punch(player)
        if game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character.Parent == nil or game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') == nil then return end
        local p = ebgkit:GetNearestPlayer(50)
        if p ~= nil then    
            game.ReplicatedStorage.Remotes.Combat:FireServer(1)
            game.ReplicatedStorage.Remotes.Combat:FireServer(workspace:FindFirstChild(p.Name))
        end
    end

    return ebgkit
end