class CreateUsers < ActiveRecord::Migration
    def up
    create_table :users do |t|
	t.column "username", :string, :limit=>10, :null=>false
	t.string "password", :limit=>20, :null =>false
	t.string "email", :default=>""
	t.string "gender", :default=>"M"
	t.string "major", :default=>""
	t.string "nationality", :default=>""
	t.string "nickname", :default=>"anonymous"
	t.string "dateofbirth"
	t.string "image",:default=>"dafaultimage.png"
	t.timestamps
    end
  end
  def down
	drop_table :users
  end
end
