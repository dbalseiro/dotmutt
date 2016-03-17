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

garbage =   account['[Gmail]/Todos']:contain_from('@recode.net') + 
            account['[Gmail]/Todos']:contain_from('@asana.com') +
            account['[Gmail]/Todos']:contain_from('@jumbo.com.ar') +
            account['[Gmail]/Todos']:contain_from('@twitter.com') +
            account['[Gmail]/Todos']:contain_from('@news.lan.com') +
            account['[Gmail]/Todos']:contain_from('@linkedin.com') +
            account['[Gmail]/Todos']:contain_from('@bancogalicia.com.ar') +
            account['[Gmail]/Todos']:contain_from('@directvla.com.ar') +
            account['[Gmail]/Todos']:contain_from('@updates.freelancer.com') +
            account['[Gmail]/Todos']:contain_from('@cloudbees.com') +
            account['[Gmail]/Todos']:contain_from('@zapier.com') +
            account['[Gmail]/Todos']:contain_from('@engage.redhat.com') +
            account['[Gmail]/Todos']:contain_from('@heroku.com') +
            account['[Gmail]/Todos']:contain_from('@harvestapp.com') +
            account['[Gmail]/Todos']:contain_from('@mails.santanderrio.com.ar') +
            account['[Gmail]/Todos']:contain_from('@mail.xmind.net') +
            account['[Gmail]/Todos']:contain_from('@connect.vmware.com') +
            account['[Gmail]/Todos']:contain_from('@newrelic.com') +
            account['[Gmail]/Todos']:contain_from('@getpostman.com') +
            account['[Gmail]/Todos']:contain_from('infombf@mercedes-benz.com.ar') +
            account['[Gmail]/Todos']:contain_from('@lucidchart.com') +
            account['[Gmail]/Todos']:contain_from('American Express') +
            account['[Gmail]/Todos']:contain_from('@mblox.com') +
            account['[Gmail]/Todos']:contain_from('@capacitarteuba.org') +
            account['[Gmail]/Todos']:contain_from('@codenvy.com') +
            account['[Gmail]/Todos']:contain_to('x@mail.asana.com')
            account['[Gmail]/Todos']:contain_subject('Inscripcion en Linea - ')
account['[Gmail]/Todos']:delete_messages(garbage)
