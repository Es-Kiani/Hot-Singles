from tkinter import *
from tkinter import messagebox

window = Tk()

window.title("Entry")
window.geometry("520x309+300+115")
window.resizable(width=False, height=False)


def Confirm_Box():
    messagebox.askquestion("Confirm", "Are You Sure Do You Want To Exit?")


Test_Btn = Button(window, text="Error", command=Show_Error)
Test_Btn.pack()

window.mainloop()
