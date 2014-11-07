class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer "page_id"
      t.string "widget_title"
      t.text "widget_content"
      t.timestamps
    end

    add_index("widgets", "page_id")
  end
end
