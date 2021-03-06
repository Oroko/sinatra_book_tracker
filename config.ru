# frozen_string_literal: true

require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride # patch, delete, put
run ApplicationController

use BooksController
use UsersController
