class FriendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @friend = Friend.new user_id: @user.id, friend_id: params[:id]
  end
end
