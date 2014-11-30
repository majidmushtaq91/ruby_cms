class AlterSiteUsers < ActiveRecord::Migration
  def change
    rename_table("site_users", "users")
    rename_column("users", "password", "password_digest")
    add_index("users", "username")
  end
end
