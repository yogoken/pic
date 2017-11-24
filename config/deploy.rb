# capistranoのバージョン固定
lock "3.6.1"

# デプロイするアプリケーション名に変更してください
set :application, "pic"

# cloneするgitのレポジトリに変更してください
set :repo_url, "git@github.com:yogoken/pic.git"

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, "master"

# deploy先のディレクトリに変更してください
set :deploy_to, "/home/yogoken/pic/"

# シンボリックリンクをはるファイル。(※後述)
set :linked_files, fetch(:linked_files, []).push("config/secrets.yml")

# シンボリックリンクをはるフォルダ。(※後述)
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system")

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# rubyのバージョン（ruby -vコマンドで確認し、ご自身が使用しているバージョンを指定してください。）
set :rbenv_ruby, "2.3.1"

# 出力するログのレベル。
set :log_level, :debug
#
# namespace :deploy do
#   desc 'Restart application'
#   task :restart do
#     invoke 'unicorn:restart'
#   end
#
#   desc 'Create database'
#   task :db_create do
#     on roles(:db) do |host|
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:create'
#         end
#       end
#     end
#   end
#
#   desc 'Run seed'
#   task :seed do
#     on roles(:app) do
#       with rails_env: fetch(:rails_env) do
#         within current_path do
#           execute :bundle, :exec, :rake, 'db:seed'
#         end
#       end
#     end
#   end
#
#   after :publishing, :restart
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#     end
#   end
# end
