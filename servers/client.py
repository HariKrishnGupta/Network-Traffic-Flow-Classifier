from socket import *
import sys

serverHost='localhost'
serverPort=50007

message = ['Hello World']

def main():
    clientSocketObject = socket(AF_INET,SOCK_DGRAM)
    while True:
        messageToBeSent = raw_input(" Enter string to be sent(Enter 'q' or 'Q' to exit): ")
        if(messageToBeSent =='q' or messageToBeSent=='Q'):
            break
        else:
            clientSocketObject.sendto(messageToBeSent,(serverHost,serverPort))
    clientSocketObject.close()
if __name__ == "__main__": main()