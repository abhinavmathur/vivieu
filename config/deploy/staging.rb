server 'staging.vivieu.com', user: 'raj', roles: [:web, :app, :db], primary: true


set :domain_name, '.staging.vivieu.com'
set :deploy_stage, 'staging'
set :deploy_location, '/var/www/staging.vivieu.com'


set :deploy_to, -> { fetch(:deploy_location) }
set :puma_bind,       "unix:///var/www/staging.vivieu.com/shared/tmp/sockets/staging-puma.sock"
set :puma_state,      "/var/www/staging.vivieu.com/shared/tmp/pids/puma.state"
set :puma_pid,        "/var/www/staging.vivieu.com/shared/tmp/pids/puma.pid"
set :puma_access_log, "/var/www/staging.vivieu.com/shared/log/puma.error.log"
set :puma_error_log,  "/var/www/staging.vivieu.com/shared/log/puma.access.log"
set :sidekiq_role, :app
set :sidekiq_config, "/var/www/staging.vivieu.com/shared/config/sidekiq.yml"
set :sidekiq_env, 'staging'