# frozen_string_literal: true

class AddFieldsToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :street_1, :string, required: true
    add_column :businesses, :street_2, :string
    add_column :businesses, :city, :string, required: true
    add_column :businesses, :state, :string, required: true
    add_column :businesses, :zip, :string, required: true
    add_column :businesses, :phone, :string, required: true
  end
end
