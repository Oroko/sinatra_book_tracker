# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :status
      t.integer :pages
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
