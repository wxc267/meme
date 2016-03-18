class CreateFriends < ActiveRecord::Migration
  def up
      create_table :friends do |t|
	t.column "username", :string, :limit=>10
	t.string "friendname", :string, :limit=>10
    end
  end
  def down
	drop_table :friends
  end
end
