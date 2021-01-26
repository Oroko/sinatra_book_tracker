# frozen_string_literal: true

class BooksController < ApplicationController
  # GET: /books
  get '/books' do
    redirect_if_not_logged_in
    @books = current_user.books

    erb :"/books/index.html"
  end

  get '/books/filter/:status' do
    redirect_if_not_logged_in
    @books = current_user.books.filter_status(params)

    erb :"/books/index.html"
  end

  # GET: /books/new
  get '/books/new' do
    redirect_if_not_logged_in
    erb :"/books/new.html"
  end

  # POST: /books
  post '/books' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @book = current_user.books.find(params[:id])
    # @books = current_user.books
    # binding.pry
    erb :"/books/show.html"
  end

  # GET: /books/5/edit
  get '/books/:id/edit' do
    redirect_if_not_logged_in
    @book = current_user.books.find(params[:id])
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch '/books/:id' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in

    @book = current_user.books.find(params[:id])
    if @book
      @book.delete
      redirect '/books'
    else
      redirect "/books/#{@book.id}"
    end
  end
end
