deploy_staging = '/var/www/staging.vivieu.com'
deploy_production = '/var/www/vivieu.com'

workers  1

threads 1, 16

rackup      DefaultRackup
environment ENV['RAILS_ENV']
daemonize   true

if ENV['RAILS_ENV'] == 'staging'
  bind "unix:/var/www/staging.vivieu.com/shared/tmp/sockets/staging-puma.sock"
  pidfile "/var/www/staging.vivieu.com/shared/tmp/pids/puma.pid"
  state_path "/var/www/staging.vivieu.com/shared/tmp/sockets/puma.state"

  stdout_redirect "/var/www/staging.vivieu.com/shared/log/puma.stdout.log", "#{deploy_staging}/shared/log/puma.stderr.log", true
  activate_control_app "unix:/var/www/staging.vivieu.com/shared/tmp/sockets/pumactl.sock", { no_token: true }
else
  bind "unix:#{deploy_production}/shared/tmp/sockets/production-puma.sock"
  pidfile "#{deploy_production}/shared/tmp/pids/puma.pid"
  state_path "#{deploy_production}/shared/tmp/sockets/puma.state"

  stdout_redirect "#{deploy_production}/shared/log/puma.stdout.log", "#{deploy_production}/shared/log/puma.stderr.log", true
  activate_control_app "unix:#{deploy_production}/shared/tmp/sockets/pumactl.sock", { no_token: true }
end

on_worker_boot do
  require 'active_record'
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection
end