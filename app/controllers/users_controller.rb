class UsersController < ApplicationController
  before_action :authenticate_user!
  autocomplete :users, :name, :full => true
  def show
    @posts = Post.personal(params[:id]).reverse
    @other = User.find(params[:id])
    @friends = User.where(id: @other.friends.map{|v| [v.friend_id]})
    @my_friends = User.where(id: current_user.friends.map{|v| [v.friend_id]})
    @my_friends.each do |f|
      if f.id == @other.id
        @we_are_friends = 1
      end
    end
  end

  def search
    @search = User.where(['name LIKE ? OR email LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
  end
end
