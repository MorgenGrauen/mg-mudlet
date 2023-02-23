local EMCO = require("@PKGNAME@.demonnic.emco")

GUI = GUI or {}
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
    }
}

function initChatbox()
    local tab_active_style = [[
        border-color: rgba(113, 75, 50, 100%);
        border-width: 1px; border-style: solid; border-radius: 8px;
        background-color: rgba(201, 180, 123, 100%);
    ]]
    local tab_inactive_style = [[
        border-color: rgba(113, 75, 50, 100%);
        border-width: 1px; border-style: solid; border-radius: 8px;
        background-color:rgba(200, 200, 160, 20%);
    ]]
    local title_style = [[
        border-color: rgba(113, 75, 50, 100%);
        border-width: 1px; border-style: solid; border-radius: 10px;
        background-color:rgba(0, 0, 0, 100%);
    ]]
    local button_style = [[
        QLabel{ border-radius: 7px; background-color: rgba(140,140,140,20%);}
        QLabel::hover{ background-color: rgba(160, 160, 160, 50%);}
    ]]

    GUI.Chatbox.AdjCon =
        -- GUI.Chatbox.AdjCon or
        Adjustable.Container:new({
            name = "GUI.Chatbox.AdjCon",
            x = -360, y = 240,
            padding = 2, width = 360, height = "100%-240px",
            adjLabelstyle = title_style,
            buttonstyle = button_style,
            buttonFontSize = 8,
            buttonsize = 16,
            titleText = "Kommunikation",
            titleTxtColor = "SaddleBrown",
            attached = "right",
    })  -- Position unterhalb Mapperbox!

    GUI.Chatbox.EMCO =
        -- GUI.Chatbox.EMCO or
        EMCO:new({
            name = "GUI.Chatbox.EMCO",
            x = "0", y = "12",
            width = "100%",
            height = "100%-17px",
            gap = 5,
            consoleColor = "black",
            consoles = {
                "Alles",
                "Ebenen",
                "Mitteilungen",
                "Debug"
            },
            allTab = true,
            allTabName = "Alles",
            allTabExclusions = { "Debug" },
            mapTab = false,
            activeTabFGColor = "black",
            activeTabCSS = tab_active_style,
            inactiveTabCSS = tab_inactive_style,
            preserveBackground = true,
            blink = false
    }, GUI.Chatbox.AdjCon)

    tempTimer(0, function()
        GUI.Chatbox.AdjCon:connectToBorder("top")
        GUI.Chatbox.AdjCon:connectToBorder("bottom")
    end)
end