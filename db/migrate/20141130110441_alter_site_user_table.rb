class AlterSiteUserTable < ActiveRecord::Migration
  def change
    #rename_table("site_users", "users")
    add_timestamps("users")

  end
end
