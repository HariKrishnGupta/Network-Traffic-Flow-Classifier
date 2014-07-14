import thread,time
from socket import *

myHost='localhost'
myPort=50007
socketObj = socket(AF_INET,SOCK_DGRAM)
i = 1    
def main():
    socketObj.bind((myHost,myPort))
    dispatcher()
def dispatcher():
    while True:
        thread.start_new(handleClient,(i,))
        time.sleep(5)
def now():
    return time.ctime(time.time())
def handleClient(i):
    time.sleep(5)
    while True:
        data,address=socketObj.recvfrom(1024)
        if not data:break
        print('{} at {}'.format(data,now()))
if __name__ == "__main__": main()
