from kivy import *
from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout


class ex(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        btn = Button(text= "Button")
        self.add_widget(btn)

class exApp(App):
    pass


exApp().run()
