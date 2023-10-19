import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import getpass
import os 

class SendEmail:
    def __init__(self, sender_email, sender_password, recipient_email, subject, message_file):
        self.sender_email = sender_email
        self.sender_password = sender_password
        self.recipient_email = recipient_email
        self.subject = subject
        self.message_file = message_file

    def smtp_connection(self, smtp_server, smtp_port):
        self.server = smtplib.SMTP(smtp_server, smtp_port)
        self.server.starttls()

    def login_and_send_mail(self):
        self.smtp_connection('smtp.gmail.com', 587)
        self.server.login(self.sender_email, self.sender_password)

        if self.check_file_existence():
            with open(self.message_file, 'r') as file:
                message_text = file.read()

            message = self.create_email_message(self.sender_email, self.recipient_email, self.subject, message_text)

            self.server.sendmail(self.sender_email, self.recipient_email, message.as_string())

            self.server.quit()
            print("Email sent successfully to", self.recipient_email)
        else:
            print(f"Please check file existence: '{self.message_file}' NOT FOUND.")

    def create_email_message(self, sender_email, recipient_email, subject, message_text):
        message = MIMEMultipart()
        message['From'] = sender_email
        message['To'] = recipient_email
        message['Subject'] = subject
        message.attach(MIMEText(message_text, 'plain'))
        return message

    def check_file_existence(self):
        return os.path.exists('message.txt')    
       # try:
       #     with open(self.message_file, 'r'):
       #         return True
       # except FileNotFoundError:
       #     return False

if __name__ == "__main__":
    sender_email = "mikayelyan.mikayel.007@gmail.com"  
    print("Dont forget you generate new password by Google account for old systems")
    sender_password = getpass.getpass("Enter your email password: ")
    recipient_email = "valeriamikaelyan@gmail.com"
    subject = "my first mail by python3"
    message_file = "message.txt"

    email_sender = SendEmail(sender_email, sender_password, recipient_email, subject, message_file)
    email_sender.login_and_send_email()

