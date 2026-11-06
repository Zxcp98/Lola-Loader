local GAMES = {
    [994732206] = "https://raw.githubusercontent.com/Zxcp98/Lola-Games/refs/heads/main/Lola_BloxFruits.protected%20(1).lua",
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local url = GAMES[game.GameId]
if not url then return end

local success, response = pcall(function()
    return game:HttpGet(url)
end)

if not success or type(response) ~= "string" then
    warn("[Loader] Failed to fetch:", response)
    return
end

if #response == 0 then
    warn("[Loader] File kosong")
    return
end

local compiled, scriptFunction = pcall(loadstring, response)

if not compiled or type(scriptFunction) ~= "function" then
    warn("[Loader] Compile error:", scriptFunction)
    return
end

scriptFunction()
