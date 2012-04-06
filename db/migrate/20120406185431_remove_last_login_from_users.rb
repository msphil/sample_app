class RemoveLastLoginFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :last_login
  end

  def self.down
    add_column :users, :last_login, :datetime
  end
end
