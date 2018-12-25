import XMonad
import XMonad.Config.Gnome

-- Declare config preferences
config_terminal = "Terminal"        -- Default terminal to run
config_focusFollowsMouse :: Bool      -- Have focus not follow mouse
config_focusFollowsMouse = False

-- Run xmonad with the specified configuration
main = xmonad myConfig

-- Use the gnomeConfig, but change a couple things
myConfig = gnomeConfig {
	terminal = config_terminal,
	modMask = mod4Mask,
	focusFollowsMouse = config_focusFollowsMouse
}
