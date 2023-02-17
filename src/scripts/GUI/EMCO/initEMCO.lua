local EMCO = require("@PKGNAME@.resources.emco.emco")

GUI.Chatbox = GUI.Chatbox or {
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

    GUI.Chatbox.GUI.AdjCon = 
        GUI.Chatbox.GUI.AdjCon or
        Adjustable.Container:new({
            name = "GUI.Chatbox.GUI.AdjCon"
    })  -- Position unterhalb Mapperbox!

    GUI.Chatbox.GUI.EMCO = EMCO:new({
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
    }, GUI.Chatbox.GUI.AdjCon)
end