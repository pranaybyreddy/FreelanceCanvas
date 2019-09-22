# Created & implemented by Yi
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # Helper functions for following instruction implemented by Yi
  def following
    @user = User.find(params[:id])
    @followings = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end


end
