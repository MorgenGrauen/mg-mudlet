function initMapperbox()
    GUI = GUI or {}
    GUI.Karte =
    -- GUI.Karte or
    {}

    GUI.Karte.Frame =
    -- GUI.Karte.Frame or
    Adjustable.Container:new(
        {
        name = "MapFrame",
        x = -360, y = 0,
        padding = 2, width = 360, height = 240,
        adjLabelstyle = [[
            border-color: rgba(113, 75, 50, 100%);
            border-width: 1px; border-style: solid; border-radius: 10px;
            background-color:rgba(0, 0, 0, 100%);
        ]],
        buttonstyle=[[
            QLabel{ border-radius: 7px; background-color: rgba(140,140,140,20%);}
            QLabel::hover{ background-color: rgba(160, 160, 160, 50%);}
        ]],
        buttonFontSize = 8,
        buttonsize = 16,
        titleText = "Karte",
        titleTxtColor = "SaddleBrown",
        attached = "right",
        }
    )

    GUI.Karte.Mapper =
    --  GUI.Karte.Mapper or
    Geyser.Mapper:new(
        {
        name = "Mapper",
        x = "0", y = "12",
        width = "100%",
        height = "100%-17px",
        },
        GUI.Karte.Frame
    )

    setMapZoom(5)

    tempTimer(0, function()
        GUI.Karte.Frame:connectToBorder("top")
        GUI.Karte.Frame:connectToBorder("bottom")
    end)

end