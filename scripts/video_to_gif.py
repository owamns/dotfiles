import subprocess
import os
import sys

def video_a_gif_ffmpeg(input_path, output_path, fps=15, escala=None, max_colores=128):
    """
    Conversor altamente optimizado usando ffmpeg como motor
    Args:
        input_path (str): Ruta al video de entrada
        output_path (str): Ruta para el GIF de salida
        fps (int): Cuadros por segundo (default: 15)
        escala (tuple): Tamaño (ancho, alto) o None para original
        max_colores (int): Máximo de colores en paleta (128-256)
    """
    
    # Verificar si ffmpeg está instalado
    try:
        subprocess.run(['ffmpeg', '-version'], capture_output=True, check=True)
    except FileNotFoundError:
        print("Error: ffmpeg no está instalado. Instala con:")
        print("  Windows: choco install ffmpeg")
        print("  Linux: sudo apt install ffmpeg")
        print("  Mac: brew install ffmpeg")
        sys.exit(1)

    # Parámetros de escala
    scale_filter = f"scale={escala[0]}:{escala[1]}:flags=lanczos" if escala else ""

    # Archivo temporal de paleta
    palette = os.path.join(os.path.dirname(output_path), "palette_temp.png")

    try:
        # Paso 1: Generar paleta optimizada
        palette_cmd = [
            'ffmpeg',
            '-i', input_path,
            '-vf', f"{scale_filter},fps={fps},palettegen=stats_mode=diff:max_colors={max_colores}",
            '-y', palette
        ]
        
        # Paso 2: Crear GIF con la paleta
        gif_cmd = [
            'ffmpeg',
            '-i', input_path,
            '-i', palette,
            '-filter_complex', f"{scale_filter}[x];[x]fps={fps}[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=3",
            '-y', output_path
        ]

        # Ejecutar comandos
        print("Generando paleta optimizada...")
        subprocess.run(palette_cmd, check=True, stderr=subprocess.DEVNULL)
        
        print("Creando GIF comprimido...")
        subprocess.run(gif_cmd, check=True, stderr=subprocess.DEVNULL)

        print(f"GIF creado exitosamente: {output_path}")
        
    except subprocess.CalledProcessError as e:
        print(f"Error en la conversión: {str(e)}")
    finally:
        # Limpiar archivo temporal
        if os.path.exists(palette):
            os.remove(palette)

# Ejemplo de uso con parámetros óptimos
if __name__ == "__main__":
    video_a_gif_ffmpeg(
        input_path='clip.mp4',
        output_path='salida_optimizada.gif',
        fps=15,          # Reducción de FPS para tamaño
        escala=(1280,729), # Escala HD 16:9
        max_colores=128    # Paleta reducida
    )
