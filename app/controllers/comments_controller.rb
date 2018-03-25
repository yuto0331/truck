class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comments = @restaurant.comments
    #@comments.restaurant_id = Restaurant.find_by(params[:restaurant_id]).id
    #@comment.restaurant_id = Restaurant.find_by(params[:restaurant_id]).id #ココには不要、上段で入っている
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    # @comments = Comment.all
    # binding.pry
    # @comment.restaurant_id = Restaurant.find(params[:restaurant_id]).id
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    # @comment.restaurant_id = Restaurant.find(params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # GET /comments/1/edit
  def edit
    @restaurant = @comment.restaurant
    
  end

  # POST /comments
  # POST /comments.json
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

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: '編集しました' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_path(restaurant_id: @comment.restaurant.id), notice: 'メニューを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:restaurant_id, :user_id, :menu, :comment, :takeout, :image)
    end
end
