# config valid only for current version of Capistrano
lock '3.4.0'

set :application, "jeffreyandanna"
set :repo_url, 'git@jeffreyandanna.github.com:JeffreyATW/jeffreyandanna.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/jeffreyatw/webapps/jeffreyandannarails'

set :dotenv_role, [:app, :web]

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
set :default_env, {
  PATH: "#{fetch(:deploy_to)}/gems/bin:$PATH",
  GEM_PATH: "#{fetch(:deploy_to)}/gems",
  GEM_HOME: "#{fetch(:deploy_to)}/gems"
}

set :tmp_dir, "#{fetch(:deploy_to)}/tmp"

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{fetch(:deploy_to)}/bin/restart"
  end

  task :create_symlink do
    on roles(:app) do
        execute "cd #{fetch(:release_path)}; ln -s #{fetch(:deploy_to)}/shared/.env .env"
        info "Created environment file"
    end
  end
end

before 'deploy:assets:precompile', "deploy:create_symlink"

namespace :db do

  desc "Populates the Production Database"
  task :seed do
    puts "\n\n=== Populating the Production Database! ===\n\n"
    run "cd #{fetch(:current_path)}; rake db:seed RAILS_ENV=production"
  end

end
