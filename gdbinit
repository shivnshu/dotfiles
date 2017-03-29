# Source all settings from the peda dir
source ~/peda/peda.py

# These are other settings I have found useful

# Intel syntax is more readable
set disassembly-flavor intel

# When inspecting large portions of code the scrollbar works better than 'less'
set pagination off


# Keep a history of all the commands typed. Search is possible using ctrl-r
set history save on
set history filename ~/.gdb_history
set history size 32768
set history expansion on

add-auto-load-safe-path /home/shivnshu/Courses/xv6-public/.gdbinit
