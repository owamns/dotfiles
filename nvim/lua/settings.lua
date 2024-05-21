local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local o = vim.o

-- Establece el modo del ratón a activo
o.mouse = "a"

-- Establece que los split se abran hacia la derecha
o.splitright = true

-- Establece que los split se abran hacia abajo
o.splitbelow = true

-- Establece la codificación de caracteres a UTF-8
o.encoding = "utf-8"

-- Permite ocultar buffers en lugar de cerrarlos cuando se cambia a otro buffer
o.hidden = true

-- Desactiva la creación de archivos de respaldo
o.backup = false

-- Desactiva la creación de archivos de respaldo en la escritura
o.writebackup = false

-- Establece la altura de la línea de comandos a 2
-- o.cmdheight = 2

-- Establece la frecuencia de actualización del estado de la pantalla a 300ms
-- o.updatetime = 300

-- Oculta algunos mensajes de Vim para una experiencia más tranquila
-- o.shortmess = o.shortmess .. "c"

-- Desactiva las campanas de error
o.errorbells = false

-- Establece el ancho de la sangría a 4 espacios
o.shiftwidth = 4

-- Usa espacios en lugar de tabuladores para la sangría
o.expandtab = true

-- Activa la numeración de líneas
o.number = true

-- Activa la sangría inteligente
o.smartindent = true

-- Activa la numeración relativa
o.rnu = true

-- Establece el ancho de los números de línea a 1
o.numberwidth = 1

-- Desactiva el ajuste de línea
o.wrap = false

-- Desactiva la creación de archivos de intercambio
o.swapfile = false

-- Activa la búsqueda incremental
o.incsearch = true

-- Ignora las diferencias de mayúsculas y minúsculas al buscar
o.ignorecase = true

-- Permite el uso del portapapeles del sistema en Vim
o.clipboard = "unnamedplus"

-- Activa los colores en la interfaz de usuario
o.termguicolors = true

-- Establece el carácter que se usará para liderar los atajos de teclado personalizados
g.mapleader = ","
