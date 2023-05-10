import sys
import os

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtQuick import QQuickWindow
from PyQt6.QtWidgets import QPushButton, QVBoxLayout, QApplication, QMainWindow, QPushButton

#sets backend for rendering the qml
QQuickWindow.setSceneGraphBackend('software')
# creates an instance of QGuiApp
app = QGuiApplication(sys.argv)
engine = QQmlApplicationEngine()
#connects the quit of the qml app to the QGui so they quit at the same time
engine.quit.connect(app.quit)
#loads the main qml file
engine.load('./app/qml/main.qml')
#starts the app
sys.exit(app.exec())

