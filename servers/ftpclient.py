import os,sys
from getpass import getpass
from ftplib import FTP
nonpassive = False;
filename = "flow.jpg"
dirname = "/"
sitename = "ftp.bhagvatkripa.org"
userinfo = ('anant@bhagvatkripa.org',getpass("Enter Password: "))

print ("Connecting...")

localfile = open(filename,'wb')
connection = FTP(sitename)
connection.login(*userinfo)
connection.cwd(dirname)

if nonpassive:
    connection.set_pasv(False)

print("Downloading...")

connection.retrbinary('RETR ' + filename, localfile.write, 1024)
connection.close()
localfile.close()

