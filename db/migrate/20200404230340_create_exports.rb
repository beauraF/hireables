# frozen_string_literal: true

class CreateExports < ActiveRecord::Migration[6.0]
  def change
    create_table :exports do |t|
      t.string :status, null: false, default: 'pending'
      t.uuid :uuid, null: false
      t.string :email, null: false
      t.string :location
      t.string :language

      t.timestamps
    end
  end
end
