class PublicController < ApplicationController
  def wall
    @user = current_user
    @posts = @user.posts
  end

  def publish
    @user = current_user
    @post = Post.new message: params[:post][:message], user_id: @user.id

    if @post.save
      render 'wall'
    else
      render 'wall'
    end

  end
end
