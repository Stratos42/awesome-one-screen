#!/usr/bin/python2.7

import imaplib

#first field is imap server, second - port (993 for gmail SSL IMAP)
M=imaplib.IMAP4_SSL("imap.gmail.com", 993)
#first field is imap login (gmail uses login with domain and '@' character), second - password
M.login("user@gmail.com","password")

status, counts = M.status("Inbox","(MESSAGES UNSEEN)")

unread = int(counts[0].split()[4][:-1])
if unread == 0:
    print "0"
else:
    print str(unread)

M.logout()
