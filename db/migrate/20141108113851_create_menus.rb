class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer "page_id"
      t.string "title", :null => false
      t.integer "position", :null => false
      t.string "link", :null => false
      t.string "menu_class", :default => "main_menu"
      t.boolean "status", :default => false
      t.timestamps
    end
    add_index("menus", "page_id")
  end
end
