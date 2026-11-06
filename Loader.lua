local GAMES = {
    [994732206] = "https://raw.githubusercontent.com/Zxcp98/Lola-Games/refs/heads/main/Lola_BloxFruits.protected%20(1).lua"
}

local function run(url)
    task.wait(2)

    local success, err = pcall(function()
        local source = game:HttpGet(url)
        local script = loadstring(source)

        if not script then
            error("Gagal mengompilasi script")
        end

        script()
    end)

    if not success then
        warn("[Loader] Gagal:", err)
    end
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local url = GAMES[game.GameId]

if url then
    run(url)
else
    warn("[Loader] Game tidak terdaftar:", game.GameId)
end
