local slugfy = require("lit-slugify")

-- ignore hammerspoon object
-- luacheck: ignore hs

-- global variables
-- luacheck: globals caffeine caffeine_clicked coffee_diagram_ascii
-- luacheck: globals coffee_diagram_off coffee_diagram_on command content fs_eye reload_config

-- TODO check why this function not pass
-- luacheck: globals set_caffeine_display

-- ##########
command = {"cmd", "alt", "ctrl"}

-- ##########
hs.hotkey.bind(command, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(command, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(command, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- ##########
coffee_diagram_ascii = [[ASCII:
..............
..A........B..
..............
..............
..............
..............
..............
..............
..............
..............
..............
....D....C....
..............
]]
coffee_diagram_off = hs.image.imageFromASCII(coffee_diagram_ascii, {
  { shouldClose = true },
  { fillColor = { alpha = 0 }},
})
coffee_diagram_on = hs.image.imageFromASCII(coffee_diagram_ascii, {
  { shouldClose = true },
  { fillColor = { alpha = 100 }},
})

caffeine = hs.menubar.new(true)
function set_caffeine_display(state)
    if state then
        caffeine:setIcon(coffee_diagram_on)
    else
        caffeine:setIcon(coffee_diagram_off)
    end
end

caffeine_clicked = function()
    set_caffeine_display(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeine_clicked)
    set_caffeine_display(hs.caffeinate.get("displayIdle"))
end

-- Water remind
hs.timer.doEvery(3600, function()
  hs.notify.new({title="Hammerspoon", informativeText="Drink water"}):send()
end)

-- ##########
hs.hotkey.bind(command, "c", function()
  local content = slugfy(hs.pasteboard.getContents())
  hs.pasteboard.setContents(content)
  hs.notify.new({title="Slugfy", informativeText=content, alwaysPresent=true}):send()
end)

-- ##########
hs.hotkey.bind(command, "s", function()
  local content = hs.pasteboard.getContents()

  local lines = {}
  for s in content:gmatch("[^\r\n]+") do
      table.insert(lines, s)
      print(s)
  end

  table.sort(lines)

  local lines_ordened = [[]]
  for _, v in pairs(lines) do
      lines_ordened = lines_ordened .. '\r\n' .. v
  end

  hs.pasteboard.writeObjects(lines_ordened)
  hs.notify.new({title="Sort", informativeText=content, alwaysPresent=true}):send()
end)

-- ##########
-- menubar = hs.menubar.new(true)
-- menubar:setTitle("Hidden Menu")
-- menubar:setMenu({
--        { title = "my menu item", fn = function() print("you clicked my menu item!") end },
--        { title = "-" },
--        { title = "other item", fn = some_function },
--        { title = "disabled item", disabled = true },
--        { title = "checked item", checked = true },
--    })

-- ##########
reload_config = function(files)
    local do_reload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            do_reload = true
        end
    end
    if do_reload then
        hs.reload()
    end
end

fs_eye = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

hs.notify.new({title="Hammerspoon", informativeText="Successful loaded"}):send()
