import os
import shutil
from datetime import datetime
source_dir = 'source_directory'
dest_dirs = {
    '.txt': 'TextFiles',
    '.csv': 'CSVFiles',
    '.pdf': 'PDFFiles'
}

for dest_dir in dest_dirs.values():
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)
def organize_files(source_dir, dest_dirs):
    for filename in os.listdir(source_dir):
        if os.path.isfile(os.path.join(source_dir, filename)):
            file_ext = os.path.splitext(filename)[1]
            if file_ext in dest_dirs:
                source_file = os.path.join(source_dir, filename)
                dest_dir = dest_dirs[file_ext]
                timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
                new_filename = f"{timestamp}_{filename}"
                dest_file = os.path.join(dest_dir, new_filename)
                shutil.move(source_file, dest_file)
                print(f"Moved {filename} to {dest_file}")

organize_files(source_dir, dest_dirs)
