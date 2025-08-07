import subprocess

def video_a_gif(input_path, output_path, fps=30):
    palette = "palette.png"
    
    # Generar paleta
    subprocess.run([
        'ffmpeg', '-i', input_path,
        '-vf', f'fps={fps},palettegen=stats_mode=diff',
        '-y', palette
    ])
    
    # Crear GIF
    subprocess.run([
        'ffmpeg', '-i', input_path, '-i', palette,
        '-filter_complex', f'fps={fps}[x];[x][1:v]paletteuse=dither=bayer',
        '-y', output_path
    ])

# Uso
video_a_gif('clip.mp4', 'salida.gif')
