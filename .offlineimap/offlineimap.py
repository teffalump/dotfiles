#!/usr/bin/python
# Decrypt mail password, and return the plaintext password
import re, subprocess

def get_password(account=None):
    accounts = {
            'gmail-work': '/home/cz/usr/mail_pwds/gmail-work.gpg',
            'ris': '/home/cz/usr/mail_pwds/ris.gpg',
            'gmail-def': '/home/cz/usr/mail_pwds/gmail-def.gpg'
            }
    command = "gpg --use-agent --batch -dq {}".format(accounts[account])
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    text=[ line for line in output.splitlines() if not line.startswith('gpg') ][0]
    return text
