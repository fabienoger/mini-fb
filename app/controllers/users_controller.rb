class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @friends = User.where(id: @user.friends.map{|v| [v.friend_id]})
  end
end
