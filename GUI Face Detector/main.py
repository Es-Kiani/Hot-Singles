from Module.GUIFaceDetector import GUIFaceDetector as faceDetector


webcam_URL = "https://192.168.1.13:8569/video"
xml = "haarcascade_frontalface_default.xml"


if __name__ == "__main__":
    faceDetector().run()
