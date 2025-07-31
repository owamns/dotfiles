#!/bin/bash

# Script para manejar la conexión/desconexión automática de monitores en Hyprland
# Configuración: HDMI izquierda, laptop derecha

LOG_FILE="/tmp/hyprland-monitor-switch.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Función para limpiar configuración de workspaces
cleanup_workspaces() {
    log "Limpiando configuración de workspaces..."
    
    # Resetear workspaces (eliminar asignaciones previas)
    for i in {1..6}; do
        hyprctl keyword workspace "$i,monitor:"
    done
}

configure_monitors() {
    log "Configurando monitores..."
    
    # Limpiar configuración previa
    cleanup_workspaces
    
    # Verificar si HDMI-A-2 está conectado
    if hyprctl monitors | grep -q "HDMI-A-2"; then
        log "HDMI-A-2 detectado - Configurando dual monitor"
        
        # Configurar HDMI a la izquierda y laptop a la derecha
        hyprctl keyword monitor "HDMI-A-2,3440x1440@60,0x0,1"
        hyprctl keyword monitor "eDP-1,1920x1080@60,3440x0,1"
        
        # Esperar un poco para que se apliquen los cambios de monitor
        sleep 1
        
        # Configurar workspaces: HDMI-A-2 con espacios 1-5, eDP-1 con espacio 6
        for i in {1..5}; do
            hyprctl keyword workspace "$i,monitor:HDMI-A-2"
        done
        hyprctl keyword workspace "6,monitor:eDP-1"
        
        # Mover todas las ventanas activas a los workspaces del HDMI
        hyprctl dispatch workspace 1
        
        log "Configuración dual monitor aplicada: HDMI (1-5), Laptop (6)"
    else
        log "HDMI-A-2 no detectado - Configurando solo laptop"
        
        # Usar solo la pantalla de la laptop con 5 espacios
        hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"
        
        # Esperar un poco para que se aplique el cambio
        sleep 1
        
        # Configurar workspaces 1-5 en la laptop
        for i in {1..5}; do
            hyprctl keyword workspace "$i,monitor:eDP-1"
        done
        
        # Mover al workspace 1
        hyprctl dispatch workspace 1
        
        log "Configuración solo laptop aplicada: eDP-1 (1-5)"
    fi
}

# Configuración inicial
log "Iniciando monitor-switch.sh"
configure_monitors

# Monitorear cambios usando udev
monitor_changes() {
    log "Iniciando monitoreo de cambios de monitor"
    
    # Usar udev para detectar cambios en el hardware
    udevadm monitor --udev --subsystem-match=drm | while read -r line; do
        if echo "$line" | grep -q "card0"; then
            log "Cambio detectado en tarjeta gráfica"
            sleep 2  # Pequeña pausa para asegurar que el cambio se ha procesado
            configure_monitors
        fi
    done
}

# Alternativamente, usar polling si udev no funciona bien
monitor_changes_polling() {
    log "Iniciando monitoreo por polling"
    
    PREVIOUS_STATE=""
    while true; do
        CURRENT_STATE=$(hyprctl monitors | grep -c "HDMI-A-2")
        
        if [ "$CURRENT_STATE" != "$PREVIOUS_STATE" ]; then
            log "Cambio de estado detectado: $PREVIOUS_STATE -> $CURRENT_STATE"
            configure_monitors
            PREVIOUS_STATE="$CURRENT_STATE"
        fi
        
        sleep 3
    done
}

# Ejecutar el monitoreo (usar udev por defecto, polling como fallback)
if command -v udevadm >/dev/null 2>&1; then
    monitor_changes
else
    log "udevadm no disponible, usando polling"
    monitor_changes_polling
fi
