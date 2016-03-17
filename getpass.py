#!/usr/bin/python

import sys
from offlineimap import get_keychain_pass

username = sys.argv[1]
server = sys.argv[2]

print get_keychain_pass(account=username, server=server)
