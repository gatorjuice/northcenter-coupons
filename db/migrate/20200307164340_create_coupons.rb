# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :business_id, null: false
      t.string :code

      t.timestamps
    end

    add_index :coupons, :business_id
  end
end
