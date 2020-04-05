# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"

set :application, "voteaward"
set :repo_url, "git@github.com:wouldyouparty/voteaward.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/home/deployer/#{fetch :application}"

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :puma do
  task :make_dirs do
    execute "mkdir -p #{shared_dir}/tmp/sockets"
    execute "mkdir -p #{shared_dir}/tmp/pids"
  end
end

namespace :deploy do
  after :compile_assets, :db_migrate
  after :finished, :web_restart

  desc 'db setup'
  task :db_setup do
    on roles(:web) do
      execute "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} #{fetch(:rbenv_prefix)} bundle exec rake db:setup"
    end
  end

  desc 'db migrate'
  task :db_migrate do
    on roles(:web) do
      execute "cd #{current_path} && RAILS_ENV=#{fetch(:rails_env)} #{fetch(:rbenv_prefix)} bundle exec rake db:migrate"
    end
  end

  desc 'restart nginx web server'
  task :web_restart do
    on roles(:web) do
      execute "sudo service nginx restart"
    end
  end
end
