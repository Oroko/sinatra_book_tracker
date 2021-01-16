# frozen_string_literal: true

class UsersController < ApplicationController
  # GET: /users
  get '/users' do
    @user = User.find(session[:user_id])
    erb :"/users/index.html"
  end

  # GET: /users/new
  get '/signup' do
    erb :"/users/signup.html"
  end

  # POST: /users
  post '/signup' do
    
    @user = User.create(
      username: params['username'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = @user.id
    redirect '/users'
  end

  # GET: /users/5
  get '/users/:id' do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get '/users/:id/edit' do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch '/users/:id' do
    redirect '/users/:id'
  end

  # DELETE: /users/5/delete
  delete '/users/:id/delete' do
    redirect '/users'
  end
end
