class PublicController < ApplicationController
  before_action :authenticate_user!

  def wall
    @users = User.all
    @user = current_user
    @posts = @user.posts.reverse
  end

  def publish
    @user = current_user
    @post = Post.new message: params[:post][:message], user_id: @user.id

    if @post.save
      redirect_to '/'
    else
      render 'wall'
    end

  end
end
