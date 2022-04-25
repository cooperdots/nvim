                                    --[[--
                                                                           __
  _______  ___  ___  ___ ___________ ___ _  ___  ___ _______ ___ ____  ___/ /
 / __/ _ \/ _ \/ _ \/ -_) __/___/ _ `/  ' \/ _ \/ -_) __(_-</ _ `/ _ \/ _  /
 \__/\___/ .__/ .__/\__/_/      \_,_/_/_/_/ .__/\__/_/ /___/\_,_/_//_/\_,_/
        /_/  /_/                         /_ /

                                    --]]--

vim.g.mapleader = ","
function P(o) print(vim.inspect(o)) return o end

require("plugins")
require("settings")
require("tabi")

Kanagawa()
