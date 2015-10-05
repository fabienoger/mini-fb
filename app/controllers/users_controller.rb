class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
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
    search = User.where(['name LIKE ? OR email LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
    @user = search[0]
  end
end
