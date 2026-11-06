local GAMES = {
	[994732206] = "https://raw.githubusercontent.com/Zxcp98/Lola-Games/refs/heads/main/Lola_BloxFruits.protected%20(1).lua", --Blox Fruit
}

local function run(url)
	task.wait(2)
	local ok, res = pcall(function()
		return loadstring(game:HttpGet(url))()
	end)
	if not ok then
		warn("[Loader] Gagal:", res)
	end
end

while not game:IsLoaded() do
	task.wait(0.5)
end

local url = GAMES[game.GameId]
if url then
	run(url)
else
	game.Loaded:Connect(function()
		local u = GAMES[game.GameId]
		if u then run(u) end
	end)
end
