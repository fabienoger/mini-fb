class FriendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    if @user.id != params[:friend][:id]
      @friend = Friend.new user_id: @user.id, friend_id: params[:friend][:id]
      if @friend.save
        flash[:friend_success] = true
      else
        flash[:friend_success] = false
      end
      @friend = Friend.new user_id: params[:friend][:id], friend_id: @user.id
      if @friend.save
        flash[:friend_success] = true
      else
        flash[:friend_success] = false
      end
    end
    #render :nothing => true, :status => 200
  end

  def destroy
    @user = current_user
    if @user.id != params[:friend][:id]
      f = Friend.where({user_id: @user.id, friend_id: params[:friend][:id]})
      if f != nil
        if Friend.find(f[0].id).destroy
          flash[:friend_success] = true
        else
          flash[:friend_success] = false
        end
      end
      f = Friend.where({user_id: params[:friend][:id], friend_id: @user.id})
      if f != nil
        if Friend.find(f[0].id).destroy
          flash[:friend_success] = true
        else
          flash[:friend_success] = false
        end
      end
    end
    #render :nothing => true, :status => 200
  end
end
