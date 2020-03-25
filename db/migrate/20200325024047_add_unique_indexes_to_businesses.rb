# frozen_string_literal: true

class AddUniqueIndexesToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_index :businesses, :name, unique: true
    add_index :businesses, :street_1, unique: true
    add_index :businesses, :phone, unique: true
  end
end
