local EMCO = require("@PKGNAME@.resources.emco.emco")

Chatbox = Chatbox or {
    Config = {
        Ebenen = {
            ShowInWindow = true,
            ShowInMain = true
        },
        Mitteilungen = {
            ShowInWindow = true,
            ShowInMain = true
        }
    },
    GUI = {}
}

function initChatbox()
     -- Angleichen an MG Farben!
    local active_stylesheet = [[background-color: rgb(240,198,32,255); border-width: 1px; border-style: solid; border-color: rgb(113,75,50,255); border-radius: 10px;]]
    local inactive_stylesheet = [[background-color: rgb(50,76,113,255); border-width: 1px; border-style: solid; border-color: rgb(113,75,50,255); border-radius: 10px;]]

    Chatbox.GUI.UW = Chatbox.GUI.UW or
        Geyser.UserWindow:new({name = "Chat"})  -- Adjustable maybe?

    Chatbox.GUI.EMCO = EMCO:new({
        name = "Chatbox.GUI.EMCO",
        allTab = true,
        allTabName = "Alles",
        x = "0",
        y = "0",
        width = "100%",
        height = "100%",
        consoleColor = "black",
        consoles = {"Alles", "Ebenen", "Mitteilungen"},
        mapTab = false,
        activeTabCSS = active_stylesheet,
        inactiveTabCSS = inactive_stylesheet,
        preserveBackground = true,
        blink = false
    }, Chatbox.GUI.UW)
end