class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column "first_name", :string, :limit => 30, :null => false
      t.column "last_name", :string, :limit => 30, :null => false
      #Short commands
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40

      # t.datetime "created_at"
      # t.datetime "updated_at"
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
