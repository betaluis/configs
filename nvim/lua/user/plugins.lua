local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTHSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocmmand that reloads neovim whenver you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
    print("Packer not installed")
    return
end

-- Have Packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    }
})

-- Install and manage your plugins here
return packer.startup(function(use)

    -- My Plugins
    use({ "wbthomason/packer.nvim", commit = "" })
    use({ "xiyaowong/nvim-transparent", commit = "" })

    -- My colorschemes
    use({ "EdenEast/nightfox.nvim", commit = "" })

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "" })

    -- Telescope
    use({ "nvim-lua/plenary.nvim", commit = "" })
    use({ "nvim-telescope/telescope.nvim", commit = "" })

    use({ "neovim/nvim-lspconfig", commit = "" })
    use({ "hrsh7th/cmp-nvim-lsp", commit = "" })
    use({ "hrsh7th/cmp-buffer", commit = "" })
    use({ "hrsh7th/cmp-path", commit = "" })
    use({ "hrsh7th/cmp-cmdline", commit = "" })
    use({ "hrsh7th/nvim-cmp", commit = "" })
    use({ "L3MON4D3/LuaSnip", commit = "" })
    use({ "saadparwaiz1/cmp_luasnip", commit = "" })

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- Statusline
    use({ 'hoob3rt/lualine.nvim', commit = '' })

    -- Pretier
    use({ 'jose-elias-alvarez/null-ls.nvim', commit = '' })
    use({ 'MunifTanjim/prettier.nvim', commit = '' })
end)