import smtplib,sys,time

From = To = Subject = text = ""


def userInput():
    
    From = raw_input("From: ").strip()
    To = raw_input("To: ").strip()
    To.split(';')
    Subject = raw_input("Subj: ").strip()
    date = time.ctime(time.time())
    text = ('From: {} \n To: {} \n Subject: {} \n Date: {} \n '.format(From,To,Subject,date))
    line = 'ctrl+D'
    
    print ("Enter the mail text body, end the message with (ctrl+D)")
    
    while True:
        line = sys.stdin.readline()
        if not line:
            break
        text = text + line

def main():

    userInput()
    

    print ("Connecting...")
    
    smtpObj = smtplib.SMTP('localhost')
    sendingSmtpObj=smtpObj.sendmail(From,To,text)         
    smtpObj.quit()
    if sendingSmtpObj :
        print ("Failed Recipients: ", sendingSmtpObj)
    else:
        print ("No Errors...mail successfully sent")
        
if __name__ == "__main__": main()
  