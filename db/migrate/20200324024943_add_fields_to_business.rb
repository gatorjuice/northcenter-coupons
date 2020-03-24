# frozen_string_literal: true

class AddFieldsToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :street_1, :string, null: false, default: ''
    add_column :businesses, :street_2, :string
    add_column :businesses, :city, :string, null: false, default: ''
    add_column :businesses, :state, :string, null: false, default: ''
    add_column :businesses, :zip, :string, null: false, default: ''
    add_column :businesses, :phone, :string, null: false, default: ''
  end
end
