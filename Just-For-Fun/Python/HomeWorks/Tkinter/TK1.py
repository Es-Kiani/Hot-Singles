from tkinter import *

MainWindow = Tk()

MainWindow.title("My Application Window")
MainWindow.geometry("400x250")
MainWindow.resizable(width=False, height=True)



# label = Label(MainWindow, text="Hello 1 World")
# label.place(x=10, y=3)
#
# Label_1 = Label(MainWindow, text="Hello 2 World")
# Label_1.place(x=10, y=21.5)
#
# Label_2 = Label(MainWindow, text="Hello 3 World")
# Label_2.place(x=10, y=41)

def buttonFun():
    myText = StringVar(MainWindow, value="Test Val")
    myLabel = Label(MainWindow, textvariable=myText)
    myLabel.place(x=18.5, y=40)


Btn = Button(MainWindow, text="My Button", command=lambda: buttonFun())
Btn.place(x=12, y=10)

MainWindow.mainloop()
