local EMCO = require("@PKGNAME@.resources.emco.emco")

GUI.Chatbox = GUI.Chatbox or {
    Object = {},
    Config = {
        Ebenen = {
            ShowInWindow = true,
            ShowInMain = true
        },
        Mitteilungen = {
            ShowInWindow = true,
            ShowInMain = true
        }
    }
}

function initChatbox()
    local active_stylesheet = [[
        background-color: rgba(201, 180, 123, 100%);
        border-width: 1px; 
        border-style: solid; 
        border-color: rgba(113, 75, 50, 100%); 
        border-radius: 8px;
    ]]
    local inactive_stylesheet = [[
        background-color:rgba(200, 200, 160, 20%);
        border-width: 1px; 
        border-style: solid; 
        border-color: rgba(113, 75, 50, 100%);
        border-radius: 8px;
    ]]

    GUI.Chatbox.Object.AdjCon = 
        -- GUI.Chatbox.Object.AdjCon or
        Adjustable.Container:new({
            name = "GUI.Chatbox.Object.AdjCon"
            x = -360, y = 240,
            padding = 2, width = 360, height = 100% - 240,
            adjLabelstyle = [[ 
                border-color: rgba(113, 75, 50, 100%);
                border-width: 1px; border-style: solid; border-radius: 8px; 
                background-color:rgba(0, 0, 0, 100%);
            ]],
            buttonstyle=[[
                QLabel{ border-radius: 7px; background-color: rgba(140,140,140,20%);}
                QLabel::hover{ background-color: rgba(160, 160, 160, 50%);}
            ]],
            buttonFontSize = 8,
            buttonsize = 16,
            titleText = "Kommunikation",
            titleTxtColor = "SaddleBrown",
            attached = "right",
    })  -- Position unterhalb Mapperbox!

    GUI.Chatbox.Object.EMCO = 
        -- GUI.Chatbox.Object.EMCO or
        EMCO:new({
            name = "GUI.Chatbox.Object.EMCO",
            x = "0",
            y = "0",
            width = "100%",
            height = "100%",
            allTab = true,
            allTabName = "Alles",
            consoleColor = "black",
            consoles = {"Alles", "Ebenen", "Mitteilungen"},
            mapTab = false,
            activeTabCSS = active_stylesheet,
            inactiveTabCSS = inactive_stylesheet,
            preserveBackground = true,
            blink = false
    }, GUI.Chatbox.Object.AdjCon)

    GUI.Chatbox.Object.AdjCon:connectToBorder("top")
    GUI.Chatbox.Object.AdjCon:connectToBorder("bottom")
end