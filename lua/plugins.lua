_G.a   = vim.api
_G.c   = vim.cmd
_G.d   = vim.diagnostic
_G.f   = vim.fn
_G.g   = vim.g
_G.l   = vim.lsp
_G.o   = vim.o
_G.O   = vim.opt
_G.S   = vim.schedule
_G.tc  = vim.tbl_contains
_G.npc = vim.F.npcall

require("colors")
require("options")
S(function()
  require("utils")
  require("keymaps")
  require("autocmds")
end)

return {
  {"nvim-tree/nvim-web-devicons", lazy = false},
  {
    "feline-nvim/feline.nvim",
    lazy = false,
    config = function()
      local lsp = require("feline.providers.lsp")
      local lsp_severity = d.severity
      local icons = {left = "", right = " ", main = "󰀘 ", vi_mode = " ", position = " "}
      local components = {active = {{}, {}, {}}, inactive = {{}, {}, {}}}
      components.active[1][1] = {
        provider = icons.main,
        hl = {fg = colors.black2, bg = colors.blue},
        right_sep = {
          str = icons.right,
          hl = {fg = colors.blue, bg = colors.lightbg},
        },
      }
      components.active[1][2] = {
        provider = function()
          local filename = f.expand("%:t")
          local icon = require("nvim-web-devicons").get_icon(filename, f.expand("%:e"))
          return icon and (" "..icon.." "..filename.." ") or " "
        end,
        enabled = function() return a.nvim_win_get_width(0) > 70 end,
        hl = {fg = colors.white, bg = colors.lightbg},
        right_sep = {
          str = icons.right,
          hl = {fg = colors.lightbg, bg = colors.lightbg2},
        },
      }
      components.active[1][3] = {
        provider = function() return " 󰉖 "..f.fnamemodify(f.getcwd(), ":t").." " end,
        enabled = function() return a.nvim_win_get_width(0) > 80 end,
        hl = {fg = colors.grey_fg, bg = colors.lightbg2},
        right_sep = {
          str = icons.right,
          hi = {fg = colors.lightbg2, bg = colors.black2},
        },
      }
      components.active[1][4] = {
        provider = function() return require("nvim-navic").get_location() end,
        enabled = function()
          local module = npc(require, "nvim-navic")
          return module and module.is_available()
        end,
        hl = {fg = colors.grey_fg},
      }
      components.active[1][5] = {
        provider = "diagnostic_errors",
        enabled = function() return lsp.diagnostics_exist(lsp_severity.ERROR) end,
        hl = {fg = colors.red},
        icon = "  ",
      }
      components.active[1][6] = {
        provider = "diagnostic_warnings",
        enabled = function() return lsp.diagnostics_exist(lsp_severity.WARN) end,
        hl = {fg = colors.yellow},
        icon = "  ",
      }
      components.active[1][7] = {
        provider = "diagnostic_hints",
        enabled = function() return lsp.diagnostics_exist(lsp_severity.HINT) end,
        hl = {fg = colors.grey_fg},
        icon = " 󰌶 ",
      }
      components.active[1][8] = {
        provider = "diagnostic_info",
        enabled = function() return lsp.diagnostics_exist(lsp_severity.INFO) end,
        hl = {fg = colors.green},
        icon = "  ",
      }
      components.active[3][1] = {
        provider = function()
          local last_search = f.getreg("/")
          if not last_search or last_search == "" then return "" end
          local searchcount = f.searchcount({maxcount = 0})
          return last_search.."("..searchcount.current.."/"..searchcount.total..") "
        end,
        enabled = function() return vim.v.hlsearch == 1 end,
        hl = {fg = colors.dark_purple, bg = colors.black2},
      }
      components.active[3][2] = {
        provider = function() return l.get_clients() and "  LSP" or "" end,
        enabled = function() return a.nvim_win_get_width(0) > 70 end,
        hl = {fg = colors.grey_fg, bg = colors.black2},
      }
      components.active[3][3] = {
        provider = "git_branch",
        enabled = function() return a.nvim_win_get_width(0) > 70 end,
        hl = {fg = colors.grey_fg, bg = colors.black2},
        icon = "  ",
      }
      components.active[3][4] = {
        provider = "git_diff_added",
        hl = {fg = colors.green, bg = colors.black2},
        icon = "  ",
      }
      components.active[3][5] = {
        provider = "git_diff_changed",
        hl = {fg = colors.yellow, bg = colors.black2},
        icon = "  ",
      }
      components.active[3][6] = {
        provider = "git_diff_removed",
        hl = {fg = colors.baby_pink, bg = colors.black2},
        icon = "  ",
      }
      components.active[3][7] = {
        provider = " "..icons.left,
        hl = {fg = colors.one_bg2, bg = colors.black2},
      }
      local mode_colors = {
        ["n"] = {"NORMAL", colors.red},
        ["no"] = {"N-PENDING", colors.red},
        ["i"] = {"INSERT", colors.darkpurple},
        ["ic"] = {"INSERT", colors.darkpurple},
        ["t"] = {"TERMINAL", colors.green},
        ["nt"] = {"T-PENDING", colors.green},
        ["v"] = {"VISUAL", colors.cyan},
        ["V"] = {"V-LINE", colors.cyan},
        ["\22"] = {"V-BLOCK", colors.cyan},
        ["R"] = {"REPLACE", colors.orange},
        ["Rv"] = {"V-REPLACE", colors.orange},
        ["s"] = {"SELECT", colors.blue},
        ["S"] = {"S-LINE", colors.blue},
        ["\19"] = {"S-BLOCK", colors.blue},
        ["c"] = {"COMMAND", colors.pink},
        ["cv"] = {"COMMAND", colors.pink},
        ["ce"] = {"COMMAND", colors.pink},
        ["r"] = {"PROMPT", colors.teal},
        ["rm"] = {"MORE", colors.teal},
        ["r?"] = {"CONFIRM", colors.teal},
        ["!"] = {"SHELL", colors.green},
      }
      components.active[3][8] = {
        provider = icons.left,
        hl = function() return {fg = mode_colors[a.nvim_get_mode().mode][2], bg = colors.one_bg2} end,
      }
      components.active[3][9] = {
        provider = icons.vi_mode,
        hl = function() return {fg = colors.black2, bg = mode_colors[a.nvim_get_mode().mode][2]} end,
      }
      components.active[3][10] = {
        provider = function() return " "..mode_colors[a.nvim_get_mode().mode][1].." " end,
        hl = function() return {fg = mode_colors[a.nvim_get_mode().mode][2], bg = colors.one_bg} end,
      }
      components.active[3][11] = {
        provider = icons.left,
        enabled = function() return a.nvim_win_get_width(0) > 90 end,
        hl = {fg = colors.grey, bg = colors.one_bg},
      }
      components.active[3][12] = {
        provider = icons.left,
        enabled = function() return a.nvim_win_get_width(0) > 90 end,
        hl = {fg = colors.green, bg = colors.grey},
      }
      components.active[3][13] = {
        provider = icons.position,
        enabled = function() return a.nvim_win_get_width(0) > 90 end,
        hl = {fg = colors.black, bg = colors.green},
      }
      components.active[3][14] = {
        provider = "position",
        hl = {fg = colors.green, bg = colors.one_bg},
      }
      components.active[3][15] = {
        provider = function()
          local current_line = f.line(".")
          if current_line == 1 then
            return " 󰘣󰘣"
          elseif current_line == f.line("$") then
            return "󰘡󰘡󰘡"
          end
          local result, _ = math.modf((current_line / f.line("$")) * 100)
          return " "..result.."%%"
        end,
        enabled = function() return a.nvim_win_get_width(0) > 90 end,
        hl = {fg = colors.green, bg = colors.one_bg},
      }
      require("feline").setup({
        theme = {fg = colors.grey_fg, bg = colors.black2},
        components = components,
        force_inactive = {},
      })
    end,
  },
  {
    "romgrk/barbar.nvim",
    lazy = false,
    config = true,
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function() vim.g.barbar_auto_setup = false end,
  },
  {"nvim-lua/plenary.nvim",       lazy = false},
  {"lewis6991/gitsigns.nvim",     lazy = false, config = true, opts = {trouble = true}},
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {enable = true},
        ensure_installed = "all",
      })
    end,
  },
  {"nvim-treesitter/nvim-treesitter-context",     event = "VeryLazy", config = true},
  {"nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy", main = "nvim-treesitter.configs", config = true},
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = true,
    opts = {
      indent = {char = "▏"},
      exclude = {
        buftypes = {"terminal"},
        filetypes = {"help", "terminal", "dashboard", "lspinfo", "TelescopePrompt", "TelescopeResults", "noice", "lazy"},
      }
    },
  },
  {"lewis6991/nvim-colorizer.lua", lazy = false,       config = true, opts = {"*"}},
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        bt_ignore = {"terminal", "nofile"},
        relculright = true,
        segments = {
          {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
          {
            sign = {name = {"Diagnostic"}, maxwidth = 2, colwidth = 1, auto = true},
            click = "v:lua.ScSa"
          },
          {text = {builtin.lnumfunc}, click = "v:lua.ScLa"},
          {
            sign = {name = {".*"}, namespace = {".*"}, maxwidth = 2, colwidth = 1, wrap = true, auto = true},
            click = "v:lua.ScSa",
          },
          {text = {"│"}, condition = {builtin.not_empty}},
        },
      })
    end,
  },
  {
    "luukvbaal/nnn.nvim",
    lazy = false,
    cond = function()
      local buf = a.nvim_buf_get_name(0)
      return buf == "" or f.isdirectory(buf)
    end,
    config = function()
      local nnn = require("nnn")
      nnn.setup({
        explorer = {cmd = "nnn -GoH", session = "shared", side = "topleft"},
        picker = {cmd = "tmux new-session nnn -GPp", style = {border = "rounded"}, tabs =false},
        replace_netrw = "explorer",
        windownav = {left = "<C-h>", right = "<C-l>"},
        auto_open = {setup = "explorer", tabpage = "explorer", empty = true},
        auto_close = true,
        offset = true,
        quitcd = "tcd",
        mappings = {
          {"<C-t>", nnn.builtin.open_in_tab},       -- open file(s) in tab
          {"<C-s>", nnn.builtin.open_in_split},     -- open file(s) in split
          {"<C-v>", nnn.builtin.open_in_vsplit},    -- open file(s) in vertical split
          {"<C-y>", nnn.builtin.copy_to_clipboard}, -- copy file(s) to clipboard
          {"<C-w>", nnn.builtin.cd_to_path},        -- cd to file directory
          {"<C-p>", nnn.builtin.open_in_preview},   -- open file in preview split keeping nnn focused
          {"<C-e>", nnn.builtin.populate_cmdline},  -- populate cmdline (:) with file(s)
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {"MunifTanjim/nui.nvim", {"smjonas/inc-rename.nvim", config = true}},
    config = true,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
  },
  {"folke/todo-comments.nvim",     event = "VeryLazy", config = true},
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "SmiteshP/nvim-navic",
        event = "VeryLazy",
        config = true,
        opts = {separator = "  ", icons = {["container-name"] = "󰅩 "}},
      },
    },
    config = function()
      f.sign_define("DiagnosticSignError", {text = "󰅙", texthl = "DiagnosticError"})
      f.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticHint"})
      f.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticInfo"})
      f.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticWarn"})
      l.buf.rename = {
        float = function()
          local currName = f.expand("<cword>")
          local tshl = vim.treesitter.get_captures_at_cursor(0)
          if tshl and #tshl > 0 then
            tshl = "@"..tshl[#tshl]
            local allowed = {"@variable", "@function.builtin", "@function.call", "@function", "@field", "@property"}
            if not tc(allowed, tshl) then return end
          else
            return
          end

          local buf = a.nvim_create_buf(false, true)
          --- @diagnostic disable-next-line:assign-type-mismatch
          a.nvim_buf_set_lines(buf, 0, 1, false, {currName})
          local win = a.nvim_open_win(buf, true, {
            title = "New Name",
            title_pos = "center",
            style = "minimal",
            border = "rounded",
            relative = "cursor",
            focusable = true,
            width = 25,
            height = 1,
            row = 2,
            col = 1,
          })
          a.nvim_set_option_value("winhighlight", "Normal:"..tshl, {win = win})

          local map_opts = {noremap = true, silent = true, buffer = 0}
          map("i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
          map("n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
          map("i", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
          map("n", "<CR>", "<cmd>stopinsert | lua l.buf.rename.apply('"..currName.."',"..win..")<CR>", map_opts)
        end,
        apply = function(curr, win)
          local newName = vim.trim(f.getline("."))
          a.nvim_win_close(tonumber(win), true)
          if #newName > 0 and newName ~= curr then
            local params = l.util.make_position_params()
            params.newName = newName
            l.buf_request(0, "textDocument/rename", params, function(err, res, ctx)
              if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end
              if res and res.changes then
                local msg = ""
                for file, change in pairs(res.changes) do
                  local new = change[1].newText
                  msg = msg..("%d changes -> %s"):format(#change, file:gsub("file://", ""):gsub(f.getcwd(), ".")).."\n"
                  msg = msg:sub(1, #msg - 1)
                  vim.notify(msg, vim.log.levels.INFO, {title = ("Rename: %s -> %s"):format(f.expand("<cword>"), new)})
                end
              end
              l.util.apply_workspace_edit(res, l.get_client_by_id(ctx.client_id).offset_encoding)
            end)
          end
        end,
      }
      d.config({virtual_text = false, float = {show_header = false, border = "rounded"}})
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.bashls.setup({capabilities = capabilities})
      lspconfig.pyright.setup({capabilities = capabilities})
      lspconfig.rust_analyzer.setup({capabilities = capabilities})
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {version = "LuaJIT"},
            diagnostics = {
              disable = {"missing-parameter", "param-type-mismatch", "cast-local-type"},
              globals = {"vim"},
            },
            workspace = {
              ignoreDir = {"test/", "!test/functional/helpers.lua", "!test/functional/ui/screen.lua"},
              library = {
                vim.api.nvim_get_runtime_file("", true),
                "/usr/lib/lua-language-server/meta/3rd/busted/library",
              },
              checkThirdParty = false,
            },
            telemetry = {enable = false},
          },
        },
      })
      lspconfig.texlab.setup({capabilities = capabilities})
      capabilities.offsetEncoding = {"utf-16"}
      lspconfig.clangd.setup({capabilities = capabilities})
      local win = require("lspconfig.ui.windows")
      local _default_opts = win.default_opts
      win.default_opts = function(options)
        local opts = _default_opts(options)
        opts.border = "rounded"
        return opts
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      local ls = require("null-ls")
      local sources = {
        ls.builtins.formatting.shfmt,
        ls.builtins.diagnostics.vale.with({args = '--config="$XDG_CONFIG_HOME/vale/vale.ini"'}),
      }
      ls.setup({sources = sources})
    end,
  },
  {
    url = "https://gitlab.com/yorickpeterse/nvim-dd.git",
    name = "nvim-dd",
    event = "VeryLazy",
    config = true,
    opts = {timeout = 1},
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    config = true,
    opts = {
      auto_open = true,
      auto_close = true,
      padding = false,
      signs = {error = "󰅙", warning = "", hint = "󰌵", information = "", other = ""},
      track_cursor = true,
    },
  },
  {"j-hui/fidget.nvim", branch = "legacy",         event = "VeryLazy", config = true},
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    config = function()
      local icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      }
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered({winhighlight = ""}),
          documentation = cmp.config.window.bordered({winhighlight = ""}),
        },
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
          ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                f.feedkeys(a.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end,
            {"i", "c"}
          ),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                f.feedkeys(a.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                  "")
              else
                fallback()
              end
            end,
            {"i", "c"}
          ),
          ["<C-o>"] = cmp.mapping(function(fallback)
            local fallback_key = a.nvim_replace_termcodes("<Tab>", true, true, true)
            local resolved_key = vim.fn["copilot#Accept"](fallback)
            if fallback_key == resolved_key then
              cmp.confirm({select = true})
            else
              a.nvim_feedkeys(resolved_key, "n", true)
            end
          end),
        },
        sources = {
          {name = "nvim_lsp"},
          {name = "luasnip"},
          {name = "nvim_lua"},
          {name = "buffer",       keyword_length = 5},
          {name = "path"},
          {name = "latex_symbols"},
        },
        formatting = {
          format = function(_, item)
            item.kind = icons[item.kind]
            return item
          end,
          fields = {"kind", "abbr", "menu"},
        },
      })
      cmp.setup.cmdline({"/", "?"}, {sources = {{name = "buffer"}}})
      cmp.setup.cmdline(":", {sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    dependencies = {"rafamadriz/friendly-snippets"},
    config = function()
      require("luasnip").config.set_config({history = true, updateevents = "TextChanged,TextChangedI"})
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  {"saadparwaiz1/cmp_luasnip",   event = "VeryLazy"},
  {"hrsh7th/cmp-nvim-lua",       event = "VeryLazy"},
  {"hrsh7th/cmp-cmdline",        event = "VeryLazy"},
  {"hrsh7th/cmp-buffer",         event = "VeryLazy"},
  {"hrsh7th/cmp-path",           event = "VeryLazy"},
  {"kdheepak/cmp-latex-symbols", event = "VeryLazy"},
  {"windwp/nvim-autopairs",      event = "VeryLazy", config = true},
  {"kylechui/nvim-surround",     event = "VeryLazy", config = true},
  {"numToStr/Comment.nvim",      event = "VeryLazy", config = true},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({icons = {separator = "➡"}})
      wk.register({}, {})
    end,
  },
  {"github/copilot.vim",              cmd = "Copilot"},
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function() return "/usr/bin/python" end,
        },
      }
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb",
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return f.input({
              prompt = "Path to executable: ",
              default = f.getcwd().."/",
              completion = "file",
            })
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        },
        {
          name = "Attach",
          type = "lldb",
          request = "attach",
          pid = require("dap.utils").pick_process,
          args = {},
        },
      }
      dap.listeners.after.event_initialized["dapui_config"] = function()
        require("trouble").setup({
          auto_open = false,
          auto_close = true,
          padding = false,
          height = 5,
          signs = {error = "󰅙", warning = "", hint = "󰌵", information = "", other = ""},
          track_cursor = true,
        })
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        require("trouble").setup({
          auto_open = true,
          auto_close = true,
          padding = false,
          height = 5,
          signs = {error = "󰅙", warning = "", hint = "󰌵", information = "", other = ""},
          track_cursor = true,
        })
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
      f.sign_define("DapBreakpoint", {text = "", texthl = "DiagnosticError", linehl = "", numhl = ""})
      f.sign_define("DapBreakpointCondition", {text = "", texthl = "DiagnosticError", linehl = "", numhl = ""})
      f.sign_define("DapBreakpointRejected", {text = "", texthl = "DiagnosticError", linehl = "", numhl = ""})
      f.sign_define("DapLogPoint", {text = "󰌑", texthl = "DiagnosticHint", linehl = "", numhl = ""})
      f.sign_define("DapStopped", {text = "", texthl = "DiagnosticInfo", linehl = "", numhl = ""})
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = true,
    opts = {
      layouts = {
        {
          elements = {"scopes", "breakpoints", "stacks", "watches"},
          size = 40,
          position = "left",
        },
        {
          elements = {"repl", "console"},
          size = 10,
          position = "bottom",
        },},
    },
  },
  {"theHamsta/nvim-dap-virtual-text", config = true},
  {
    "lervag/vimtex",
    cmd = "VimtexInverseSearch",
    ft = "tex",
    config = function()
      g.vimtex_view_method = "zathura"
      g.vimtex_compiler_latexmk = {
         aux_dir = '',
         out_dir = '',
         callback = 1,
         continuous = 1,
         executable = 'latexmk',
         hooks = {},
         options = {
           "-verbose",
           "-file-line-error",
           "-synctex=1",
           "-interaction=nonstopmode",
           "-lualatex",
         },
        }
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = "NeoGit",
    dependencies = {"sindrets/diffview.nvim", cmd = { "DiffviewFileHistory" }},
    config = true,
    opts = {
      disable_commit_confirmation = true,
      signs = {section = {"", ""}, item = {"", ""}},
      integrations = {diffview = true},
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close,
              ["<C-h>"] = "which_key",
            },
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
        },
        pickers = {fd = {find_command = {"fd", ".", "~", "--type", "f", "-H"}}},
      })
      require("telescope").load_extension("fzf")
    end,
  },
  {"Pocco81/true-zen.nvim", cmd = "TZAtaraxis",          config = true},
  {
    "vimwiki/vimwiki",
    cmd = "VimwikiIndex",
    init = function() g.vimwiki_list = {{path = "~/vimwiki/", syntax = "markdown", ext = ".md"}} end,
  },
  {"michaelb/sniprun",      build = "bash ./install.sh", cmd = {"SnipRun", "SnipInfo"}},
}
