class PublicController < ApplicationController
  def wall
    @users = User.all
  end
end
