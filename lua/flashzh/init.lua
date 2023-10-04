local flash = require("flash")
local flypy = require("flashzh.flypy")

local M = {}

function M.jump()
    flash.jump({
        labels = "1234567890",
        search = {
            mode = M._zh_mode,
        },
    })
end

function M._zh_mode(str)
    print(string.format("str: %s", str))
    local regexs = {}
    while string.len(str) > 1 do
        regexs[#regexs + 1] = flypy.char2patterns[string.sub(str, 1, 2)]
        str = string.sub(str, 3)
    end
    if string.len(str) == 1 then
        regexs[#regexs + 1] = flypy.char1patterns[str]
    end
    local ret = table.concat(regexs)
    return ret, ret
end

return M
