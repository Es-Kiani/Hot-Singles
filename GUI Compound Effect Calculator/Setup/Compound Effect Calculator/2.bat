@echo off

python-3.8.9-amd64.exe

pip install pyinstaller --user

mkdir bin && cd bin

pyinstaller --windowed --onefile ../main.py

cd dist

mklink "%USERPROFILE%/Desktop/Compound Effect Calculator" "main.exe"

exit