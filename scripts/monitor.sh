
#!/bin/sh

# Verifica si HDMI-1-0 está conectado
if xrandr | grep -q "HDMI-1-0 connected"; then
  # Si está conectado, aplica las configuraciones para ambos monitores
  xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal --output HDMI-1-0 --mode 1600x900 --pos 1920x90 --rotate normal
else
  # Si no está conectado, solo aplica las configuraciones para eDP-1
  xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal
fi
