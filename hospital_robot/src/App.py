from PyQt5 import QtWidgets, uic
import sys

class MyWindow(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        uic.loadUi("/home/huuhoa/hospital_robot/src/Qtapp/untitled.ui", self)

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MyWindow()
    window.show()
    sys.exit(app.exec_())