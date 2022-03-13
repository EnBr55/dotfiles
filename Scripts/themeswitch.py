#!/bin/python
import subprocess
import os
import sys

# For use with https://github.com/sos4nt/dynamic-colors

if len(sys.argv) < 2:
    print("Expected a theme argument")
    quit()
theme = sys.argv[1]

pts = os.listdir('/dev/pts/')
for p in pts:
     if p.isnumeric():
          subprocess.call(f'echo "`~/.dynamic-colors/bin/dynamic-colors switch {theme}`" > /dev/pts/{p}', shell=True)
