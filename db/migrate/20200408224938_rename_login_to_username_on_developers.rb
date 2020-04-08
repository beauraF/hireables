# frozen_string_literal: true

class RenameLoginToUsernameOnDevelopers < ActiveRecord::Migration[6.0]
  def change
    rename_column :developers, :login, :username
  end
end
