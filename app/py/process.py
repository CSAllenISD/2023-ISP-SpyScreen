import sys
print(sys.executable)
from PyQt5.QtCore import QProcess

class MyProcess(QProcess):
    def __init__(self, parent=None):
        super().__init__(parent)
        
    def run_command(self, command):
        if command == 'take_photo':
            self.start('python', ['../facialRec/takePhoto.py'])
            self.waitForFinished()
