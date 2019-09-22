class CommentsController < ApplicationController

  # Created and implemented by Pranay

  before_action :set_comment, only: [:show, :edit, :update, :destroy]



  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
   @comment = Comment.new(params.require(:comment).permit(:body, :post_id))
   @comment.user_id = current_user.id
   @time = @comment.created_at
    if @comment.save
      redirect_to "/posts/#{params[:post_id]}"
    else
      render 'new'
    end

  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comments = Post.find(params[:post_id]).comments
    @comments.find(params[:id]).destroy
    redirect_to "/posts/#{params[:post_id]}"
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.permit(:user_name, :body, :idea_id)
    end
end
