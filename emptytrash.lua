options.timeout = 120
options.subscribe = true

user = 'diego.balseiro@syntagma.com.ar'
server = 'imap.gmail.com'

status, password = pipe_from('~/.mutt/getpass.py ' .. user .. ' ' .. server)

account = IMAP {
    server = server,
    username = user,
    password = password,
    ssl = 'tls1'
}

trash = account['[Gmail]/Papelera']:is_undeleted()
account['[Gmail]/Papelera']:delete_messages(trash)

spam = account['[Gmail]/Spam']:is_unanswered()
account['[Gmail]/Spam']:delete_messages(spam)
