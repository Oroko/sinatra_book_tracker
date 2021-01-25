# frozen_string_literal: true

class Book < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :author, :genre, :status, :pages

  def self.filter_status(params)
    where(status: params[:status])
  end
end
