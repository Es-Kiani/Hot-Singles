import os


os.system('cmd /c "color 1f && pip install --upgrade pip"')

os.system('cmd /c "color 1f && pip install pyinstaller --user"')

os.system('cmd /c "color 1f && mkdir bin && cd bin && pyinstaller --windowed --onefile ../main.py"')

os.system("exit")

return 0
