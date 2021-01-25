# frozen_string_literal: true

class BooksController < ApplicationController
  # GET: /books
  get '/books' do
    if logged_in?
      @books = current_user.books
      
      erb :"/books/index.html"
    else
      redirect '/login'

    end
  end

  get '/books/filter/:status' do
    @books = current_user.books.filter_status(params)

    erb :"/books/index.html"
  end

  # GET: /books/new
  get '/books/new' do
    erb :"/books/new.html"
  end

  # POST: /books
  post '/books' do
    @books = current_user.books.build(params)
    if @books.valid?

      @books.save

      redirect '/books'
    else
      flash[:missing] = 'You are missing some book details!'
      redirect '/books/new'
    end
  end

  # GET: /books/5
  get '/books/:id' do
    @book = current_user.books.find(params[:id])
    # @books = current_user.books
    # binding.pry
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get '/books/:id/edit' do
    @book = current_user.books.find(params[:id])
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch '/books/:id' do
    @book = current_user.books.find(params[:id])
    @book.update(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      status: params[:status],
      pages: params[:pages]
    )

    redirect "/books/#{params[:id]}"
  end

  # DELETE: /books/5/delete
  delete '/books/:id/delete' do
    @book = current_user.books.find(params[:id])
    @book.delete
    redirect '/books'
  end
end
