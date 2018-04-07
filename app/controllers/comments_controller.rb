class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comments = @restaurant.comments
  end

  def show
  end

  def new
    @comment = Comment.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def edit
    @restaurant = @comment.restaurant
    
  end


  def create
    @comment = current_user.comments.build(comment_params)
    @restaurant = @comment.restaurant
    @comment.restaurant_id= @restaurant.id
  
      if @comment.save
        redirect_to comments_path(restaurant_id: @restaurant.id), notice: '食べたメニューを投稿しました' 
      else
        render :new
      end
    
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: '編集しました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path(restaurant_id: @comment.restaurant.id), notice: 'メニューを削除しました' }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:restaurant_id, :user_id, :menu, :comment, :takeout, :image)
    end
end
