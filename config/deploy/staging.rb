server 'staging.vivieu.com', user: 'raj', roles: [:web, :app, :db], primary: true


set :domain_name, '.staging.vivieu.com'
set :deploy_stage, 'staging'
set :deploy_location, '/var/www/staging.vivieu.com'
set :puma_process_name, 'staging'
set :shared_path_app, '/var/www/staging.vivieu.com/shared'

set :deploy_to, -> { fetch(:deploy_location) }
set :puma_bind,       "unix://#{:shared_path_app}/tmp/sockets/staging-puma.sock"
set :puma_state,      "#{:shared_path_app}/tmp/pids/puma.state"
set :puma_pid,        "#{:shared_path_app}/tmp/pids/puma.pid"
set :puma_access_log, "#{:shared_path_app}/log/puma.error.log"
set :puma_error_log,  "#{:shared_path_app}/log/puma.access.log"
set :sidekiq_role, :app
set :sidekiq_config, "#{:shared_app_path}/config/sidekiq.yml"
set :sidekiq_env, 'staging'