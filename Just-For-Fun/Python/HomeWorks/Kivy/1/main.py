from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
#from kivy.uix.gridlayout import GridLayout
from kivy.uix.button import Button


#class MyGridLayout(GridLayout):
#    def __init__(self, **kwargs):
#        super().__init__(**kwargs)
#        for i in range(10):
#            size = dp(80)
#            btn = Button(text= str(i+1),size_hint= (None, None) , size= (size, size))
#            self.add_widget(btn)
#        pass
#    pass

class MyBoxLayout(BoxLayout):
    def __init__(self,**kwargs):
        super().__init__(**kwargs)
        self.orientation="vertical"

        btn1 = Button(text= "Btn1")
        btn2 = Button(text= "Btn2")
        lbl3 = Label(text= "Btn3")

        self.add_widget(btn1)
        self.add_widget(btn2)
        self.add_widget(lbl3)
#    pass

#class MainWidget(Widget):
#    pass


class MyGUIApp(App):
    pass


MyGUIApp().run()
