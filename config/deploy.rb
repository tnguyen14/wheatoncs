set :application, "wheatoncs"
set :repository,  "git@github.com:tnguyen14/wheatoncs.git"
set :deploy_to, "/home/tringuyen/webapps/wheatoncs"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, "git"

role :web, "web319.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web319.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web319.webfaction.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# alternatively
# server "web319.webfaction.com", :app, :web, :db, :primary => true

set :user, "tringuyen"
set :scm_user, "tnguyen14"

# set up for webfaction
# http://docs.webfaction.com/software/rails.html
set :use_sudo, false
default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end