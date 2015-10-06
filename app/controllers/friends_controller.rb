class FriendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    if @user.id != params[:id]
      @friend = Friend.new user_id: @user.id, friend_id: params[:id]
      @friend.save
      @friend = Friend.new user_id: params[:id], friend_id: @user.id
      @friend.save
    end
    render :nothing => true, :status => 200
  end

  def destroy
    @user = current_user
    if @user.id != params[:id]
      f = Friend.where({user_id: @user.id, friend_id: params[:id]})
      Friend.find(f[0].id).destroy
      f = Friend.where({user_id: params[:id], friend_id: @user.id})
      Friend.find(f[0].id).destroy
    end
    render :nothing => true, :status => 200
  end
end
