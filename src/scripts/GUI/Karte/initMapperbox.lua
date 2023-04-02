function initMapperbox()
    GUI = GUI or {}
    GUI.Karte =
    -- GUI.Karte or
    {}

    local title_style = [[
        border-color: rgba(113, 75, 50, 100%);
        border-width: 1px; border-style: solid; border-radius: 10px;
        background-color:rgba(0, 0, 0, 100%);
    ]]
    local button_style = [[
        QLabel{ border-radius: 7px; background-color: rgba(140,140,140,20%);}
        QLabel::hover{ background-color: rgba(160, 160, 160, 50%);}
    ]]
    GUI.Karte.Frame =
    -- GUI.Karte.Frame or
    Adjustable.Container:new(
        {
        name = "GUI.Karte.Frame",
        x = -360, y = 0,
        padding = 2, width = 360, height = 240,
        adjLabelstyle = title_style,
        buttonstyle = button_style,
        lockStyle = "border",
        buttonFontSize = 8,
        buttonsize = 16,
        titleText = "Karte",
        titleTxtColor = "SaddleBrown",
        attached = "right",
        }
    )
    GUI.Karte.Frame:changeMenuStyle("dark")

    GUI.Karte.Mapper =
    --  GUI.Karte.Mapper or
    Geyser.Mapper:new(
        {
        name = "GUI.Karte.Mapper",
        x = "0", y = "12",
        width = "100%", height = "100%-17px",
        },
        GUI.Karte.Frame
    )

    setMapZoom(5)
    setConfig("mapperPanelVisible", false)
end