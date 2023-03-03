GUI = GUI or {}
GUI.Drache = GUI.Drache or {
    Config = {
        ImageFile = getMudletHomeDir() .. "/@PKGNAME@/drache/drache_bunt_60x50_transparent.png",
        ImageWidth = 60,
        ImageHeight = 50,
        PaddingWidth = 30,
        PaddingHeight = 10,
        MenuFontAlignment = "c", -- centered, all options: "clr",.
        MenuFontSize = 8,
        MenuHeight = 20,
        MenuNames =
          {
            "Hilfe",
            "GUI",
            {
              "Reset"
            }
          },
        MenuActions = "defined below"
    }
}
GUI.Drache.Actions = GUI.Drache.Actions or {}

function initDrache()

    -- Configure layout
    local PaddingWidth = GUI.Drache.Config.PaddingWidth
    local PaddingHeight = GUI.Drache.Config.PaddingHeight
    local ImageWidth = GUI.Drache.Config.ImageWidth
    local ImageHeight = GUI.Drache.Config.ImageHeight
    local ImagePosX = -PaddingWidth - ImageWidth - getBorderRight()
    local ImagePosY = PaddingHeight + getBorderTop()

    -- Setup the menu icon
    GUI.Drache.Frame = Geyser.Label:new({
        name = "GUI.Drache.Frame",
        x = ImagePosX,
        y = ImagePosY,
        width = ImageWidth,
        height = ImageHeight,
        fillBg = 0
    })
    GUI.Drache.Frame:setTiledBackgroundImage(GUI.Drache.Config.ImageFile)

    -- Fill the menu
    local MenuFontAlignment = GUI.Drache.Config.MenuFontAlignment
    local MenuFontSize = GUI.Drache.Config.MenuFontSize
    local MenuWidth = PaddingWidth + ImageWidth + 5
    GUI.Drache.Frame:createRightClickMenu({
        MenuItems = GUI.Drache.Config.MenuNames,
        Style = "dark",
        MenuWidth =  MenuWidth,
        MenuFormat = MenuFontAlignment .. MenuFontSize,
        MenuHeight = GUI.Drache.Config.MenuHeight,
    })

    -- Connect the actions
    GUI.Drache.Frame:setMenuAction("Hilfe", Hilfe)
    GUI.Drache.Frame:setMenuAction("GUI.Reset", GUIReset)
end


function GUI.Drache.dontMove(event, x, y)
    local PaddingWidth = GUI.Drache.Config.PaddingWidth
    local PaddingHeight = GUI.Drache.Config.PaddingHeight
    local ImageWidth = GUI.Drache.Config.ImageWidth
    local ImagePosX = -PaddingWidth - ImageWidth - getBorderRight()
    local ImagePosY = PaddingHeight + getBorderTop()

    GUI.Drache.Frame:move(ImagePosX, ImagePosY)
end
registerAnonymousEventHandler("sysWindowResizeEvent", GUI.Drache.dontMove, false)