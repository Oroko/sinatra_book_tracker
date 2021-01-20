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

  get '/login' do
    erb :'/users/login.html'
  end

  post '/login' do
    @user = User.find_by(
      email: params['email']
    )

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect '/books'
    else
      redirect '/'

    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
  helpers do
    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
      @user
    end

    def logged_in?
      !!current_user
    end
  end
end
