from base64decoder import Base64Decode
from tkinter import *
from tkinter import ttk
from tkinter import messagebox

def encode():
    Outbox.config(state="normal")
    Outbox.delete("1.0", "end-1c")
    # print(f"-{Inputbox.get('1.0', 'end-1c')}-")
    # print(f"-{Base64Decode(Inputbox.get('1.0', 'end-1c'))}-")
    Outbox.insert(END, Base64Decode(Inputbox.get("1.0", "end-1c")))
    Outbox.config(state="disabled")
    
    
Window = Tk()
Window.title("Base64 Decoder")
Window.geometry("520x570+300+115")
Window.resizable(False, False)

Font = "Arial"
Title = Label(Window, text="Welcome To My Base64 Decoder", font=(24))
Inputbox = Text(Window, width=50, bd=3, font=(Font, 15))
Do_Btn = ttk.Button(Window, text="Decode", cursor="hand2", command=encode)
Outbox = Text(Window, width=50, bd=3, font=(Font, 15))
CopyRight = Label(Window, text="""
©2022 Esfandiar Kiani, All rights reserved.
""")

Title.place(x=145, y=20)
Inputbox.place(x=10, y=60, width=500, height=210)
Do_Btn.place(x=225, y=285)
Outbox.place(x=10, y=325, width=500, height=210)
CopyRight.place(x=150, y=533)

Window.mainloop()
