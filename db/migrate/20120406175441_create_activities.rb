class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user
      t.datetime :last_login
      t.datetime :last_activity

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
