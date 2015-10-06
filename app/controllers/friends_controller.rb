class FriendsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    params[:rq_id] = JSON.parse params[:rq_id] if params[:rq_id].is_a? String
    params[:cr_id] = JSON.parse params[:cr_id] if params[:cr_id].is_a? String
    if params[:cr_id] != params[:rq_id]
      @friend = Friend.new user_id: params[:cr_id], friend_id: params[:rq_id]
      @friend.save
      @friend = Friend.new user_id: params[:rq_id], friend_id: params[:cr_id]
      @friend.save
    else
    end
    render :nothing => true, :status => 200
  end

  def destroy
    @user = current_user
    params[:rq_id] = JSON.parse params[:rq_id] if params[:rq_id].is_a? String
    params[:cr_id] = JSON.parse params[:cr_id] if params[:cr_id].is_a? String
    if @user.id != params[:id]
      f = Friend.where({user_id: @user.id, friend_id: params[:id]})
      Friend.find(f[0].id).destroy
      f = Friend.where({user_id: params[:id], friend_id: @user.id})
      Friend.find(f[0].id).destroy
      redirect_to request.referrer || '/'
    else
      redirect_to request.referrer || '/'
    end
    render :nothing => true, :status => 200
  end
end
