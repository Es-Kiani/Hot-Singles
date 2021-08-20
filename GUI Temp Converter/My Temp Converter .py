# ================================== Imports =====================================

from tkinter import *
from tkinter import ttk
from tkinter import messagebox

# =============================== Window Setting ==================================

Window = Tk()
Window.title("Temp Converter")
Window.geometry("520x309+300+115")
Window.resizable(False, False)

# ================================= Variables =====================================

Faren_Input = IntVar()
Cels_Input = IntVar()
Cels_Res_Value = StringVar()
Farn_Res_Value = StringVar()

# ================================= Functions =====================================


def Convert_To_Cels():
    try:
        Farn = float(Faren_Input.get())
        Res_Temp = (Farn)*5/9-160/9
        Rounded_Res_Temp = round(Res_Temp, 2)
        Farn_Res_Value.set(Rounded_Res_Temp)
    except:
        Error_Box()
        Clear = ""
        Farn_Res_Value.set(Clear)
        Faren_Input.set(Clear)
        raise ValueError    # This line is not in first and second ".exe" file


def Convert_To_Farn():
    try:
        Cels = float(Cels_Input.get())
        Res_Temp2 = (Cels)*9/5+32
        Rounded_Res_Temp2 = round(Res_Temp2, 2)
        Cels_Res_Value.set(Rounded_Res_Temp2)
    except:
        Error_Box()
        Clear = ""
        Cels_Res_Value.set(Clear)
        Cels_Input.set(Clear)
        raise ValueError    # This line is not in first and second ".exe" file


def ClearFoarm():
    global Clear
    Clear = ""
    Zero = 0
    Farn_Res_Value.set(Clear)
    Cels_Res_Value.set(Clear)
    Faren_Input.set(Zero)
    Cels_Input.set(Zero)


def Error_Box():
    messagebox.showerror("Invalid Value", "You Must Input A Number . . . !")


def Confirm_Box():
    Cnf_Bx = messagebox.askquestion(
        "Confirm", "Are You Sure Do You Want To Exit?")
    if Cnf_Bx == "yes":
        Window.destroy()


# =================================== Labels =====================================


WelcomeLabel = Label(Window, text="Welcome To My Application", font=(19))
WelcomeLabel.grid(row=0, column=1, pady=(7, 7))

F1 = Label(Window, text="Fahrenheit Temperature : ")
F1.grid(row=1, column=0, padx=(7, 0), pady=(3, 0))

C1 = Label(Window, text="Celsius Temperature : ")
C1.grid(row=1, column=2, pady=(3, 0))

F_Res = Label(Window, text="Your Result In Celsius : ")
F_Res.grid(row=4, column=0, pady=(10, 0))

C_Res = Label(Window, text="Your Result In Fahrenheit : ")
C_Res.grid(row=4, column=2, pady=(10, 0))

CopyRight = Label(Window, text="""
©2020 Esfandiar Kiani, All rights reserved.
""")
CopyRight.grid(row=7, column=1)


# =================================== Buttons ====================================

To_C_Btn = ttk.Button(Window, text="Convert To Celsius",
                      cursor="hand2", command=Convert_To_Cels)
To_C_Btn.grid(row=3, column=0, pady=(7, 7))

To_F_Btn = ttk.Button(Window, text="Convert To Fahrenheit",
                      cursor="hand2", command=Convert_To_Farn)
To_F_Btn.grid(row=3, column=2, pady=(7, 7))

Clear_Btn = Button(Window, width=8, text="Clear All",
                   bd=4, font=(10), command=ClearFoarm)
Clear_Btn.grid(row=3, column=1, pady=(7, 7))

Exit_Btn = Button(Window, width=8, text="Exit", bd=3,
                  bg="brown", fg="white", command=Confirm_Box)
Exit_Btn.grid(row=6, column=2, pady=(15, 7))


# =================================== Entries ====================================

F1 = Entry(Window, width=12, textvariable=Faren_Input,
           bd=3, font=("Arial", 15))
F1.grid(row=2, column=0, padx=(3, 0), pady=(0, 12))

Res_F = Entry(Window, width=12, textvariable=Farn_Res_Value,
              bd=3, font=("Arial", 15))
Res_F.grid(row=5, column=0, pady=(0, 10))

C1 = Entry(Window, width=12, textvariable=Cels_Input, bd=3, font=("Arial", 15))
C1.grid(row=2, column=2, padx=(3, 0), pady=(0, 12))

Res_C = Entry(Window, width=12, textvariable=Cels_Res_Value,
              bd=3, font=("Arial", 15))
Res_C.grid(row=5, column=2, pady=(0, 10))


Window.mainloop()
