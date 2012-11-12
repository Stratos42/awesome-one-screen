#!/usr/bin/python2.7

import imaplib

#first field is imap server, second - port (993 for gmail SSL IMAP)
M1=imaplib.IMAP4_SSL("imap.gmail.com", 993)
#first field is imap login (gmail uses login with domain and '@' character), second - password
M1.login("user@gmail.com","password")

#other imap server
# M2=imaplib.IMAP4_SSL("example.com", 993)
# M2.login("user@example.com","password")

statusM1, countsM1 = M1.status("Inbox","(MESSAGES UNSEEN)")
# statusM2, countsM2 = M2.status("Inbox","(MESSAGES UNSEEN)")

# print "Status M1 = " + statusM1
# print "Status M2 = " + statusM2

unreadM1 = int(countsM1[0].split()[4][:-1])
# unreadM2 = int(countsM2[0].split()[4][:-1])

print str(unreadM1) # + str(unreadM2)

M1.logout()
# M2.logout()
