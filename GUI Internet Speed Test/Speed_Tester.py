# ================================== Imports ======================================
from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import speedtest

# ================================== Colors =======================================
Frame_bgColor = "#090d20"
Button_bgColor = "#f06700"
readonly_fgColor = "white"
fgColor = "#000000"

# =============================== Window Setting ==================================
window = Tk()
window.title("Internet Speed Tester")
window.geometry("340x325+360+140")
window.resizable(False, False)
window.configure(bg=Frame_bgColor)

# ================================= Variables =====================================
Download_Speed_Str = StringVar()
Upload_Speed_Str = StringVar()

# =================================== Frames ======================================
top_0 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_0.pack(side=TOP)

top_1 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_1.pack(side=TOP)

top_2 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_2.pack(side=TOP)

top_3 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_3.pack(side=TOP)

top_4 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_4.pack(side=TOP)

top_5 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_5.pack(side=TOP)

top_6 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_6.pack(side=TOP)

top_7 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_7.pack(side=TOP)

top_8 = Frame(window, width=350, height=50, bg=Frame_bgColor)
top_8.pack(side=TOP)

# ================================= Functions =====================================


def Download_Speed():
    try:
        Speed = speedtest.Speedtest()
        Down = Speed.download()
        Res_Down = Down/800000
        Rounded_Res_Down = round(Res_Down, 1)
        fRounded_Res_Down = f"{Rounded_Res_Down} Mbps"
        Download_Speed_Str.set(fRounded_Res_Down)
    except:
        ErrorBox()
        raise ConnectionError


def Upload_Speed():
    try:
        Speed = speedtest.Speedtest()
        Up = Speed.upload()
        Res_Up = Up/800000
        Rounded_Res_Up = round(Res_Up, 1)
        fRounded_Res_Up = f"{Rounded_Res_Up} Mbps"
        Upload_Speed_Str.set(fRounded_Res_Up)
    except:
        ErrorBox()
        raise ConnectionError


def Speed_Test():
    Download_Speed()
    Upload_Speed()


def Clear():
    Clean = ""
    Upload_Speed_Str.set(Clean)
    Download_Speed_Str.set(Clean)


def Confirm_Box():
    Cnf_Bx = messagebox.askquestion(
        "Confirm", "Are You Sure To Exit?")
    if Cnf_Bx == "yes":
        window.destroy()
    else:
        pass


def ErrorBox():
    messagebox.showwarning(
        "Warning", "You Are Not Connected To The Internet . . . !")


# ================================== Buttons ======================================
D_speed_test_Button = Button(
    top_5, text="Download Speed", width=13, bd=2, bg=Button_bgColor, fg=fgColor,
    cursor="hand2", command=Download_Speed)
D_speed_test_Button.pack(side=LEFT, padx=(0, 20), pady=(40, 13))

speed_test_Button = Button(top_5, text="Speed Test",
                           width=9, bd=2, bg=Button_bgColor, fg=fgColor,
                           cursor="hand2", command=Speed_Test)
speed_test_Button.pack(side=LEFT, padx=(0, 0), pady=(40, 13))

U_speed_test_Button = Button(
    top_5, text="Upload Speed", width=13, bd=2, bg=Button_bgColor, fg=fgColor,
    cursor="hand2", command=Upload_Speed)
U_speed_test_Button.pack(side=LEFT, padx=(20, 0), pady=(40, 13))

clear_Button = Button(top_6, text="Clear All", width=7,
                      bd=2, bg=Button_bgColor, fg=fgColor,
                      cursor="hand2", command=Clear)
clear_Button.pack(side=LEFT, pady=(0, 18))

clearExit_Button = Button(top_7, text="Exit", width=6, bd=3,
                          bg="brown", fg="white", command=Confirm_Box)
clearExit_Button.pack(side=LEFT, pady=(10, 12))

# ================================== Entries ======================================
upload_speed_Entry = Entry(
    top_2, textvariable=Upload_Speed_Str, readonlybackground=Frame_bgColor, fg=readonly_fgColor, state="readonly")

upload_speed_Entry.pack(side=LEFT)

download_speed_Entry = Entry(
    top_4, textvariable=Download_Speed_Str, readonlybackground=Frame_bgColor, fg=readonly_fgColor, state="readonly")
download_speed_Entry.pack(side=LEFT)

# ================================== Labels =======================================
welcome_Label = Label(top_0, text="Welcome To My Speed Tester",
                      font=(25), bg=Frame_bgColor, fg="#D7263D")
welcome_Label.pack(side=LEFT, padx=(0, 0), pady=(6, 10))

upload_speed_Label = Label(
    top_1, text="Your Upload Speed Is :", bg=Frame_bgColor, fg="#00d394")
upload_speed_Label.pack(side=LEFT, pady=(6, 1))

download_speed_Label = Label(
    top_3, text="Your Download Speed Is :", bg=Frame_bgColor, fg="#00d394")
download_speed_Label.pack(side=LEFT, pady=(6, 1))

CopyRight = Label(top_8, text="""
©2020 Esfandiar Kiani, All rights reserved.
""", bg=Frame_bgColor, fg="white")
CopyRight.pack(side=LEFT)

window.mainloop()
