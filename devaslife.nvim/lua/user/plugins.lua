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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer not installed")
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    }
})

-- Install and manage your plugins here
return packer.startup(function(use)

    -- My plugins here
    use({ "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" })
    use({ 'svrana/neosolarized.nvim', requires = ({ 'tjdevries/colorbuddy.nvim' }) })
    use({ 'karb94/neoscroll.nvim', commit = "" })

    -- Colorschemes
    use({ 'shaunsingh/nord.nvim' })
    use({ "EdenEast/nightfox.nvim", commit = "" })
    use({ "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" })

    -- vscode-like pictograms
    use({ "onsails/lspkind-nvim" })

    -- CMP
    use({ "hrsh7th/cmp-buffer" }) -- nvim-cmp source for buffer words
    use({ "hrsh7th/cmp-nvim-lsp" }) -- nvim-cmp source for neovim's built in LSP
    use({ "hrsh7th/nvim-cmp" }) -- completion
    use({ "L3MON4D3/LuaSnip" }) -- snippet

    -- Statusline
    use({ 'hoob3rt/lualine.nvim' })

    -- LSP
    use({ 'neovim/nvim-lspconfig' })
    use({ 'glepnir/lspsaga.nvim' })
    use({ "williamboman/nvim-lsp-installer", commit = "d6d564b21167161d85f41c2033ccc19a97b39a39" }) -- simple to use language server installer

    -- Prettier
    use({ 'jose-elias-alvarez/null-ls.nvim' }) -- Use neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use({ 'MunifTanjim/prettier.nvim' })

    -- Mason
    use({ 'williamboman/mason.nvim' })
    use({ 'williamboman/mason-lspconfig.nvim' })

    -- Treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    -- Autopairs and autotags
    use({ 'windwp/nvim-autopairs' })
    use({ 'windwp/nvim-ts-autotag' })

    -- Telescope
    use({ 'nvim-lua/popup.nvim' })
    use({ 'nvim-lua/plenary.nvim' })
    use({ 'nvim-telescope/telescope.nvim' })
    use({ 'nvim-telescope/telescope-media-files.nvim' })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })

    -- Nvim-tree
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "kyazdani42/nvim-tree.lua" })

    -- Bufferline
    -- use({ "akinsho/nvim-bufferline.lua" })
    -- use({ "famiu/bufdelete.nvim", commit = "46255e4a76c4fb450a94885527f5e58a7d96983c" })

    -- Colorizer
    use({ 'norcalli/nvim-colorizer.lua' })

    -- Gitsigns
    use({ 'lewis6991/gitsigns.nvim' })

    -- Git
    use({ 'dinhhuy258/git.nvim' })

    -- Toggleterm
    use({ 'akinsho/toggleterm.nvim' })

    -- Comments
    use({ "numToStr/Comment.nvim" })

end)
