# EC2サーバーのIP, EC2サーバーにログインするユーザー名, サーバーのロールを記述
server '52.199.29.59', user: 'yogoken', roles: %w( app db web )
# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/keypair_rsa'
