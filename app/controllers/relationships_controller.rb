class RelationshipsController < ApplicationController

  # Created & implemented by Yi
  
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    # respond to Ajax request
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    # respond to Ajax request
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

end
