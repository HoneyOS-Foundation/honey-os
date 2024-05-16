"""
Setup the rootfs
"""

import tempfile
import shutil
import os

DIRS = [
    "bin",
    "boot",
    "home",
    "home/Desktop",
    "home/Downloads",
    "home/Documents",
    "home/Pictures",
    "home/Music",
    "home/Videos",
]

# Create a temp dir
temp = tempfile.TemporaryDirectory()

print("Creating the root directories")
for dirname in DIRS:
    os.makedirs(temp.name + "/" + dirname)

print("Create the archive")
shutil.make_archive("pkg/rootfs", 'zip', temp.name)

# Clear the temp dir
temp.cleanup()
