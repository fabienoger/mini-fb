class AddFriendPost < ActiveRecord::Migration
  def change
    add_column :posts, :friend_id, :integer
  end
end
