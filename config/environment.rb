# Load the rails application
require File.expand_path('../application', __FILE__)
require 'active_record/connection_adapters/mysql2_adapter'
require 'active_record/connection_adapters/postgresql_adapter'

# Initialize the rails application
CuberootLts::Application.initialize!

CuberootLts::Application.configure do
  config.gem "pg"
#  config.gem 'activerecord-postgresql-adapter'
end

