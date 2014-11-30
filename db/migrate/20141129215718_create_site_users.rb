class CreateSiteUsers < ActiveRecord::Migration
  def change
    create_table :site_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "username", :limit => 10
      t.string "email"
      t.boolean "status", :default => false
      t.string "password"
      t.timestamp
    end
  end
end
