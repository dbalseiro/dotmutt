#!/usr/bin/python

import re, subprocess
def get_keychain_pass(account=None, server=None):
    params = {
            'security': '/usr/bin/security',
            'command': 'find-internet-password',
            'account': account,
            'server': server,
            'keychain': '/Users/diego/Library/Keychains/login.keychain'
    }
    command = "sudo -u diego $(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output = subprocess.check_output(command, shell = True, stderr = subprocess.STDOUT)

    return output

print get_keychain_pass('diego.balseiro@syntagma.com.ar', 'imap.gmail.com')
