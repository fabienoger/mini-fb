class PublicController < ApplicationController
  before_action :authenticate_user!

  def wall
    @users = User.all
    @user = current_user
    @friends = User.where(id: @user.friends.map{|v| [v.friend_id]})
    @friendsPosts = []
    @friends.each do |friend|
      friend.posts.each do |post|
        if post.friend_id == nil || post.friend_id == current_user.id
          @friendsPosts.push(post)
        end
      end
    end

    @userPosts = @user.posts.reverse
    @mixedposts = @userPosts + @friendsPosts
    @posts = @mixedposts.sort_by! { |p| p.created_at }.reverse
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

  def friendPublish
    @user = current_user
    @post = Post.new message: params[:post][:message], user_id: @user.id, friend_id: params[:id]

    if @post.save
      redirect_to "/users/#{params[:id]}" || '/'
    else
      redirect_to "/users/#{params[:id]}" || '/'
    end
  end
end
