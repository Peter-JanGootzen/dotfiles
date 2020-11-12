#!/usr/bin/bash

if [[ $MONITOR_SETUP == "desktop" ]]; then
    export DPI=144
    CURSOR_SIZE=36
    # Set QT scaling to 150%
    export QT_AUTO_SCREEN_SCALE_FACTOR=0
    export QT_SCALE_FACTOR="1.5"
else
    export DPI=96
    CURSOR_SIZE=0
fi

# Set the DPI
sed -i -e "s/\*dpi: .*/\*dpi: $DPI/g" ~/.Xresources
sed -i -e "s/Xft.dpi: .*/Xft.dpi: $DPI/g" ~/.Xresources
# Set the cursor size
# Xresources
sed -i -e "s/Xcursor.size: .*/Xcursor.size: $CURSOR_SIZE/g" ~/.Xresources
# GTK3
sed -i -e "s/gtk-cursor-theme-size=.*/gtk-cursor-theme-size=$CURSOR_SIZE/g" ~/.config/gtk-3.0/settings.ini
# GTK2
sed -i -e "s/gtk-cursor-theme-size=.*/gtk-cursor-theme-size=$CURSOR_SIZE/g" ~/.gtkrc-2.0
