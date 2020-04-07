# frozen_string_literal: true

class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.bigint :external_id, null: false
      t.string :login, null: false
      t.string :name
      t.text :bio
      t.string :company
      t.string :location
      t.string :email
      t.string :blog
      t.boolean :hireable, null: false, default: false

      t.timestamps
    end

    add_index :developers, :external_id, unique: true
    add_index :developers, :login, unique: true
  end
end
