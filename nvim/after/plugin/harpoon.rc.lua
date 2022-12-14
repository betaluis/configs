local status, harpoon_ui = pcall(require, 'harpoon.ui')
if (not status) then return end

local status2, harpoon_mark = pcall(require, "harpoon.mark")
if (not status2) then return end

local status3, harpoon = pcall(require, "harpoon")
if (not status3) then return end

harpoon.setup {}
