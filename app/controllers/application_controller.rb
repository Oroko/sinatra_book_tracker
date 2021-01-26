# frozen_string_literal: true

require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    register Sinatra::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, 'my_secret'
  end

  get '/' do
    erb :welcome
  end

  get '/login' do
    if !logged_in?
     erb :'/users/login.html'
    else
      redirect '/books'
    end
  end

  post '/login' do
    @user = User.find_by(
      email: params['email']
    )
    if @user&.authenticate(params[:password])

      session[:user_id] = @user.id

      redirect '/books'
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect '/login'

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

    def redirect_if_not_logged_in
      redirect '/' unless logged_in?
    end
  end
end
