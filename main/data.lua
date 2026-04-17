local M = {}

M.STATE_NULL = -1
M.STATE_MENU = 1
M.STATE_LEVEL = 2
M.STATE_CREDITS = 3

M.STATE_PLAYING = 10
M.STATE_PAUSE = 11
M.STATE_CLEAR = 12
M.STATE_GAMEOVER = 13

M.state = M.STATE_MENU

M.SCR_W = 0
M.SCR_H = 0
M.TILE = 16
M.PIXEL = 4
M.NUM_LEVELS = 9
M.GATE = 1/25

M.APP_NAME = "parcel-master"
M.FILE_NAME = "game.sav"

M.level = 1
M.time = 0
M.parcels = 0
M.home = 0
M.stars = 0
M.diff = 0
M.gate = {}
M.bin = {}
M.vp = vmath.vector4()
M.mouse = vmath.vector3()

M.save = {
	sfx = 1,
	music = 1,
	progress = {{}, {}, {}},
	fullscreen = false,
}

function M.loadgamefile()
	local file = sys.load(sys.get_save_file(M.APP_NAME, M.FILE_NAME))
	if next(file) ~= nil then
		M.save = file
		return true
	end
	return false
end

function M.savegamefile()
	sys.save(sys.get_save_file(M.APP_NAME, M.FILE_NAME), M.save)
end

function M.progress()
	local n = M.stars
	if M.save.progress[M.diff][M.level] then
		if M.save.progress[M.diff][M.level] > n then
			n = M.save.progress[M.diff][M.level]
		end
	end
	M.save.progress[M.diff][M.level] = n
end

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE) / M.TILE), math.floor((p.y + M.TILE) / M.TILE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE) - (M.TILE / 2), (p.y * M.TILE) - (M.TILE / 2), p.z)
end

function M.hex2rgba(hex)
	hex = hex:gsub("#","")
	local rgba = vmath.vector4(tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255, 1)
	return rgba
end

function M.clamp(v, min, max)
	if type(v) ~= "number" then v = 0 end
	if v < min then v = min
	elseif v > max then v = max
	end
	return v
end

function M.wrap(v, min, max)
	if type(v) ~= "number" then v = 0 end
	if v < min then v = max
	elseif v > max then v = min
	end
	return v
end

function M.diff(a, b)
	return math.abs(a - b)
end

function M.ms2str(time)
	local day = math.floor(time / 86400)
	local rem = time % 86400
	local hr = math.floor(rem / 3600)
	rem = rem % 3600
	local min = math.floor(rem / 60)
	rem = rem % 60
	local sec = rem

	local str = ""
	if day > 0 then str = tostring(day) .. "d " end
	if hr > 0 or day > 0 then str = str .. tostring(hr) .. ":" end

	str = string.format("%s%02d:%02d", str, min, math.floor(sec))
	return str
end

function M.sound(id, gate, vol, speed)
	vol = vol or 1
	speed = speed or 1
	if M.save.sfx > 0 then
		local t = M.gate[id] or 0
		t = os.clock() - t
		if t > (gate or M.GATE) then
			M.gate[id] = os.clock()
			msg.post("main:/sound", "play", {id = id, vol = vol, speed = speed})
		end
	end
end

function M.playmusic(id)
	if id ~= nil then
		msg.post("main:/sound", "music", {id = id})
	end
end

function M.pausemusic(pause)
	msg.post("main:/sound", "pause", {pause = pause})
end

function M.stopmusic()
	msg.post("main:/sound", "stopmusic")
end

function M.setmusicvol(vol)
	msg.post("main:/sound", "setmusicvol", {gain = vol})
end

function M.fullscreen()
	M.save.fullscreen = not defos.is_fullscreen()
	defos.set_fullscreen(M.save.fullscreen)
	defos.set_cursor_visible(not defos.is_fullscreen())
end

return M
