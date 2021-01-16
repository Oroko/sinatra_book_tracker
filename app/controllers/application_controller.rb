# frozen_string_literal: true

require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, 'my_secret'
  end

  get '/' do
    erb :welcome
  end
end
