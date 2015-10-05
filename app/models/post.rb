class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  scope :personal, -> id { where("user_id = ? OR friend_id = ?", id, id )}
end
