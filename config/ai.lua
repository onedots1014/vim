local ok, codecompanion = pcall(require, "codecompanion")
if not ok then
    return
end

codecompanion.setup({
    strategies = {
        chat = {
            adapter = "copilot",
        },
        inline = {
            adapter = "copilot",
        },
    },
    display = {
        chat = {
            window = {
                layout = "vertical",
                width = 0.3,
            },
        },
    },
})
