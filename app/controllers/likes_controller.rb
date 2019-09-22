class LikesController < ApplicationController

  # Created & implemented by Yi
  
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    # respond to Ajax request
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
    # respond to Ajax request
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

end
