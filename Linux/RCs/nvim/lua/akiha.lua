--[[
-- 一些辅助用的 Lua 函数及变量
--]]
Akiha = {}

Akiha.border = "rounded"

Akiha.color = {}
Akiha.color.red = "#bf717a"
Akiha.color.green = "#a3be8c"
Akiha.color.yellow = "#ebcb8b"
Akiha.color.blue = "#81a1c1"
Akiha.color.violet = "#b48ead"
Akiha.color.cyan = "#88c0d0"
Akiha.color.orange = "#d08770"

Akiha.color.black = "#2e3440"
Akiha.color.lightBlack = "#3b4252"

Akiha.color.gray = "#434c5e"
Akiha.color.lightGray = "#4c566a"

Akiha.color.white = "#eceff4"
Akiha.color.lightWhite = "#e5e9f0"
Akiha.color.grayWhite = "#d8dee9"

Akiha.color.deepDark = "#1a1a1f"
Akiha.color.cursorGray = "#444c5e"

function Akiha.getVisualSelection()
    vim.cmd([[noau normal! "vy"]])
    local text = vim.fn.getreg("v")
    vim.fn.setreg("v", {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ""
    end
end

function Akiha.isLocal()
    return not Akiha.isRemote()
end

function Akiha.isRemote()
    return os.getenv("SSH_CLIENT") or os.getenv("SSH_TTY") or os.getenv("SSH_CONNECTION")
end

function Akiha.notifyLSPError()
    return not os.getenv("NVIM_NOT_NOTIFY_LSP_ERROR")
end

function Akiha.wrapMsg(msg, maxWidth)
    maxWidth = maxWidth or 40
    local words = {}
    for word in msg:gmatch("%S+") do
        table.insert(words, word)
    end

    local lines = {}
    local currentLine = ""
    for _, word in ipairs(words) do
        local newLine = currentLine .. " " .. word
        if #newLine > maxWidth then
            table.insert(lines, currentLine)
            currentLine = word
        else
            currentLine = newLine
        end
    end
    table.insert(lines, currentLine)

    return table.concat(lines, "\n")
end

function Akiha.prequire(module)
    local ok, result = pcall(require, module)
    if ok then
        return result
    else
        return nil
    end
end

function Akiha.isBigFile(bufnr)
    local maxSize = 1024 * 1024 -- 1MB
    local maxLine = 2048
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    local lineCount = vim.api.nvim_buf_line_count(bufnr)
    if ok and stats then
        if stats.size > maxSize then
            return true
        end
        if lineCount > maxLine then
            return true
        end
    end
    return false
end

Akiha.notify = function(msg, level, title)
    local notify = Akiha.prequire("notify")
    if notify then
        notify(msg, level, { title = title, timeout = 1000 })
    else
        vim.notify(msg, level)
    end
end

Akiha.info = function(msg, title)
    Akiha.notify(msg, vim.log.levels.INFO, title)
end

Akiha.warn = function(msg, title)
    Akiha.notify(msg, vim.log.levels.WARN, title)
end

Akiha.error = function(msg, title)
    Akiha.notify(msg, vim.log.levels.ERROR, title)
end

Akiha.setKeymap = function(mode, lhs, rhs, opts)
    opts = opts or {}

    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end

    if type(rhs) == "function" then
        opts.callback = rhs
        rhs = ""
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

Akiha.setBufKeymap = function(buffer, mode, lhs, rhs, opts)
    opts = opts or {}

    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end

    if type(rhs) == "function" then
        opts.callback = rhs
        rhs = ""
    end

    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
end

Akiha.createAutocmd = vim.api.nvim_create_autocmd

Akiha.createCommand = vim.api.nvim_create_user_command

return Akiha
