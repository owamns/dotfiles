import os
import subprocess

def capture_screenshot_ffmpeg(video_path, timestamp, output_folder):
    """
    Captura una captura de pantalla en un tiempo específico de un video usando FFmpeg.
    
    :param video_path: Ruta del video.
    :param timestamp: Tiempo en segundos donde tomar la captura.
    :param output_folder: Carpeta donde guardar la captura.
    """
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)
    
    output_filename = os.path.join(output_folder, f'screenshot_{timestamp:.2f}.png')
    command = [
        'ffmpeg', '-i', video_path, '-ss', str(timestamp), '-vframes', '1', '-q:v', '2', output_filename
    ]
    subprocess.run(command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    print(f'Captura guardada: {output_filename}')

# Ejemplo de uso
video_path = "clip.mp4"  # Reemplaza con la ruta de tu video
timestamp = 1  # Segundo en el que tomar la captura
output_folder = "screenshots"

capture_screenshot_ffmpeg(video_path, timestamp, output_folder)
