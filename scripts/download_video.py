import os

def download_clip(youtube_url, start_time, duration, output_video="clip.mp4"):
    """
    Usa yt-dlp para descargar un segmento específico de un video en máxima calidad.
    """
    command = (
        f"yt-dlp -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]' --merge-output-format mp4 "
        f"--external-downloader ffmpeg --external-downloader-args "
        f"\"-ss {start_time} -t {duration}\" -o {output_video} {youtube_url}"
    )
    result = os.system(command)
    
    if result == 0:
        print(f"Clip descargado como: {output_video}")
        return output_video
    else:
        print("Error al descargar el clip.")
        return None

youtube_url = "https://www.youtube.com/watch?v=oOn0b-V_S9o"
start_time = "00:00:05"
duration = "00:00:05"

clip_path = download_clip(youtube_url, start_time, duration)
