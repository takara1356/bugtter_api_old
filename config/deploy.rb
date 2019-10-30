# capistranoのバージョン固定
lock '3.4.0'

# デプロイするアプリケーション名
set :application, 'bugtter_api'

# cloneするgitのレポジトリ
set :repo_url, 'git@github.com:takara1356/bugtter_api.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'master'

# deploy先のディレクトリ。 
set :deploy_to, '/var/www/rails/bugtter_api'

# シンボリックリンクをはるファイル
set :linked_files, fetch(:linked_files, []).push('config/settings.yml')

# シンボリックリンクをはるフォルダ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョンの個数
set :keep_releases, 5

# rubyのバージョン
set :rbenv_ruby, '2.6.3'

# 出力するログのレベル。
set :log_level, :debug

namespace :deploy do

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
end