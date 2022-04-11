#!/bin/bash

# This is the representation of empty
export RECT_DISABLED_SHORTCUT='{length = 135, bytes = 0x62706c69 73743030 d4010203 04050607 ... 00000000 0000005b }'

# Modifier key values can be ORed together.
# The use of multiple keys can be represented by the sum of the values
# of the numeric column 
#
# | Modifier Key | Integer Value |
# |--------------|---------------|
# | cmd          | 1048576       |
# | option       | 524288        |
# | ctrl         | 262144        |
# | shift        | 131072        |
# | fn           | 8388608       |

#To disable the top (maximize) snap area, execute:
defaults write com.knollsoft.Rectangle ignoredSnapAreas -int 1

# To disable the Top Half and Bottom Half snap areas, the bit field would be 1111 0000 0000, or 3840
defaults write com.knollsoft.Rectangle ignoredSnapAreas -int 3840

defaults write com.knollsoft.Rectangle launchOnLogin -int 1
defaults write com.knollsoft.Rectangle hideMenubarIcon -int 0

# Shortcuts
defaults write com.knollsoft.Rectangle maximize '{
    keyCode = 126;
    modifierFlags = 1179648;
}'

defaults write com.knollsoft.Rectangle restore '{
    keyCode = 125;
    modifierFlags = 1179648;
}'

defaults write com.knollsoft.Rectangle rightHalf '{
    keyCode = 124;
    modifierFlags = 1179648;
}'

defaults write com.knollsoft.Rectangle leftHalf '{
    keyCode = 123;
    modifierFlags = 1179648;
}'

defaults write com.knollsoft.Rectangle firstTwoThirds '{
    keyCode = 123;
    modifierFlags = 1572864;
}'

defaults write com.knollsoft.Rectangle lastTwoThirds '{
    keyCode = 124;
    modifierFlags = 1572864;
}'

defaults write com.knollsoft.Rectangle previousDisplay '{
    keyCode = 123;
    modifierFlags = 1835008;
}'

defaults write com.knollsoft.Rectangle nextDisplay '{
    keyCode = 124;
    modifierFlags = 1835008;
}'

# Disabled commands
defaults write com.knollsoft.Rectangle bottomHalf '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle bottomLeft '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle bottomRight '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle center '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle centerThird '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle firstThird '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle larger '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle lastThird '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle maximizeHeight '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle smaller '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle topHalf '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle topLeft '$RECT_DISABLED_SHORTCUT'
defaults write com.knollsoft.Rectangle topRight '$RECT_DISABLED_SHORTCUT'
