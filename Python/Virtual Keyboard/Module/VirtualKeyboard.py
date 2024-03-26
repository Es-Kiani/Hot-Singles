import cv2 as cv
import mediapipe as mp


class VirtualKeyboard:
    def __init__(self, webcam_URL=0) -> None:
        self._webcam_URL = webcam_URL

        keyboard_Gray_with_BG_FilePath = "./gray-keyboard-qwerty_crop.jpg"
        keyboard_Gray_without_BG_FilePath = "./gray-keyboard-qwerty_crop.png"
        keyboard_White_with_BG_FilePath = "./white-keyboard-qwerty_crop.jpg"

        self._keyboard = self._load_Img(keyboard_Gray_without_BG_FilePath)
        return

    def _load_Img(self, imgFile) -> cv.IMREAD_COLOR:
        BGR_Img = cv.imread(imgFile)
        RGBA_Img = cv.cvtColor(BGR_Img, cv.COLOR_BGR2RGBA)
        return RGBA_Img

    def _fit_Image_To_Screen(self, webcam, Img) -> None:
        isRead, frame = webcam.read()

        # TODO Try Catch
        h, w = frame.shape[1], frame.shape[0]
        Img = cv.resize(Img, (h, w))
        return

    def _detect_Hand(self, frame) -> None:
        RGB_Frame = cv.cvtColor(frame, cv.COLOR_BGR2RGB)

        mpHands = mp.solutions.hands
        hand = mpHands.Hands(max_num_hands=1)
        mpDraw = mp.solutions.drawing_utils

        result = hand.process(RGB_Frame)
        print(result)
        if result.multi_hand_landmarks:
            print(result.multi_hand_landmarks)
            for hand_Lm in result.multi_hand_landmarks:
                print(hand_Lm)
                mpDraw.draw_landmarks(frame, hand_Lm, mpHands.HAND_CONNECTIONS)

        return

    def _start(self) -> None:
        webcam = cv.VideoCapture(self._webcam_URL)

        self._fit_Image_To_Screen(webcam, self._keyboard)

        while True:
            isRead, BGR_Frame = webcam.read()
            # TODO Try Catch

            self._detect_Hand(BGR_Frame)

            RGBA_Frame = cv.cvtColor(BGR_Frame, cv.COLOR_BGR2RGBA)
            merged_Frame = cv.addWeighted(
                RGBA_Frame, 0.6, self._keyboard, 0.4, 0)

            BGR_Frame = cv.cvtColor(merged_Frame, cv.COLOR_RGBA2BGR)

            cv.imshow("name", BGR_Frame)
            key = cv.waitKey(1)
            if key == 81 or key == 113:
                break

        webcam.release()
        cv.destroyAllWindows()
        return

    def run(self) -> None:
        self._start()
        return
