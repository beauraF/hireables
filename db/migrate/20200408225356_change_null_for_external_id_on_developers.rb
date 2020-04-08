# frozen_string_literal: true

class ChangeNullForExternalIdOnDevelopers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :developers, :external_id, true
  end
end
