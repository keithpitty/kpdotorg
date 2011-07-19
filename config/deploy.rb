require 'bundler/capistrano'

role :app, "keithpitty.org"
role :web, "keithpitty.org"
role :db, "keithpitty.org", :primary => true

set :application, "kpdotorg"
set :deploy_to, "/home/deploy/apps/#{application}"
set :repository, "git@github.com:keithpitty/#{application}.git"
set :branch, "master"
set :user, "deploy"

set :scm, :git
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true
set :use_sudo, false

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "mkdir -p #{release_path}/tmp && touch #{release_path}/tmp/restart.txt"
  end
end