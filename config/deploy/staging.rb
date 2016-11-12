role :app, %w { yogoken@52.199.29.59}
role :web, %w {yogoken@52.199.29.59}
role :db, %w { yogoken@52.199.29.59}

set :ssh_options, {
  keys: %w(/home/kenta/.ssh/id_rsa) # ローカル環境の秘密鍵のパス
}
