local ok, twilight = pcall(require, "twilight")
if not ok then
    return
end

twilight.setup {
    {
        dimming = {
            alpha = 0.25, 
            color = {"Normal", "#ffffff"}, 
            inactive = true
        },
        context = 20,
        treesitter = true,
        expand = {
            "function",
            "method",
            "table",
            "if_statement"
        }
    }
}
