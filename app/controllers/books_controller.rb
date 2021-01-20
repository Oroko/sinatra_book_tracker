# frozen_string_literal: true

class BooksController < ApplicationController
  # GET: /books
  get '/books' do
    @books = current_user.books
    
    erb :"/books/index.html"
  end

  # GET: /books/new
  get '/books/new' do
    erb :"/books/new.html"
  end

  # POST: /books
  post '/books' do
    @books = current_user.books.build(params)
    @books.save
    
    redirect '/books'
  end

  # GET: /books/5
  get '/books/:id' do
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get '/books/:id/edit' do
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch '/books/:id' do
    redirect '/books/:id'
  end

  # DELETE: /books/5/delete
  delete '/books/:id/delete' do
    redirect '/books'
  end
end
