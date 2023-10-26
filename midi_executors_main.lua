-- ********************************************************
-- **************** Midi Executors v1.0.0 *****************
-- ******************** by LenschCode *********************
-- ********************************************************
-- ******* Allows to map Midi Remotes to Executors ********
-- ********************************************************

-- ***************** Configuration Guide ******************
-- *** https://github.com/lenschcode/MA3-Midi-Executors ***
-- ********************************************************

-----------------------------------------------------------
----------------------- Refreshrate -----------------------
-- Determines how often the Midi assignment gets updated --
------------ Rate in seconds, 0.5 Recommended -------------
------------- Note: Incoming midi is instant --------------
                    local rate = 0.5
-----------------------------------------------------------

-----------------------------------------------------------
----------------------- Program Code ----------------------
---------------- Don't change anything here ---------------
-----------------------------------------------------------
------ Basically checks the name of Midi Remotes for ------
--- Executor information and then assigns the Executors ---
--- Target and Key and Fader Actions to the Midi Remote ---
-----------------------------------------------------------


local running = false

local function checkExecutor(name)
    local exec = {}
    exec.page = CurrentExecPage().no
    exec.id, exec.type = name:match("Executor (%d+) (%a+)")

    if exec.page and exec.id and exec.type == "Key" or exec.type == "Fader" then
        return exec
    else
        return nil
    end
end

local function getExecKey(page, id)
    local exec = ObjectList("page " .. page .. "." .. id)[1]

    if exec ~= nil then
        return exec.key
    else
        return nil
    end
end

local function getExecFader(page, id)
    local exec = ObjectList("page " .. page .. "." .. id)[1]

    if exec ~= nil then
        return exec.fader
    else
        return nil
    end

end

local function getExecObject(page, id)
    local exec = ObjectList("page " .. page .. "." .. id)[1]

    if exec ~= nil then
        return exec.object
    else
        return nil
    end
end

local function parseMidiRemotes()
    for key, remote in pairs(Root().ShowData.Remotes.MIDIRemotes:Children()) do
        local exec = checkExecutor(remote.name)
        if exec ~= nil then
            if remote.target ~= getExecObject(exec.page, exec.id) then
                remote.target = getExecObject(exec.page, exec.id)

            end
            if remote.target == nil then
                if remote.key ~= "" then
                    remote.key = ""
                end
                if remote.fader ~= "" then
                    remote.fader = ""
                end
            else
                if exec.type == "Key" then
                    if remote.key ~= getExecKey(exec.page, exec.id) then
                        remote.key = getExecKey(exec.page, exec.id)
                    end
                    if remote.fader ~= "" then
                        remote.fader = ""
                    end
                else
                    if remote.key ~= "" then
                        remote.key = ""
                    end
                    if remote.fader ~= getExecFader(exec.page, exec.id) then
                        remote.fader = getExecFader(exec.page, exec.id)
                    end
                end
            end
        end
    end
end

local function loop()
    while running do
        parseMidiRemotes()
        coroutine.yield(rate)
    end
end

local function StartGui(config)
	local descTable = {
		title = "Midi Executors",
		caller = GetFocusDisplay(),
		items = {"Start","Stop","Run Once"},
		selectedValue = "Start",
		add_args = {FilterSupport="Yes"},
	}
	if running then
		descTable.items = {"Stop"}
	else
		descTable.items = {"Start","Run Once"}
	end

	local index, name = PopupInput(descTable)
    return index, name;
end

function main()
    local index, name = StartGui()

    if name == "Start" then
        if not running then
            running = true
            loop()
        end
    elseif name == "Stop" then
        running = false
    elseif name == "Run Once" then
        parseMidiRemotes()
    end

end

return main