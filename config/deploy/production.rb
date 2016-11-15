# EC2サーバーのIP, EC2サーバーにログインするユーザー名, サーバーのロールを記述
server '52.199.29.59', user: 'yogoken', roles: %w{ app db web }
# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/keypair_rsa'

Amazon::Ecs.configure do |options|
  options[:AWS_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
  options[:AWS_secret_key] = ENV['AWS_SECRET_ACCESS_KEY_ID']
  options[:associate_tag] = ENV['AMAZON_ASSOCIATE_ID']
end