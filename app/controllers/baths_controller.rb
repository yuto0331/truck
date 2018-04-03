class BathsController < ApplicationController
  before_action :set_bath, only: [:show, :edit, :update, :destroy]
  before_action :current_user_login, only: [:new, :edit, :show, :index, :destroy]
  
  def index
    @baths = Bath.all
  end

  def show
    @preference = current_user.preferences.find_by(bath_id: @bath.id)
  end

  def new
    @bath = Bath.new
  end

  def edit
  end

  def create
    @bath = Bath.new(bath_params)
    @bath.user_id = current_user.id

    respond_to do |format|
      if @bath.save
        format.html { redirect_to @bath, notice: 'お風呂情報が投稿されました' }
        format.json { render :show, status: :created, location: @bath }
      else
        format.html { render :new }
        format.json { render json: @bath.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bath.update(bath_params)
        format.html { redirect_to @bath, notice: '編集しました' }
        format.json { render :show, status: :ok, location: @bath }
      else
        format.html { render :edit }
        format.json { render json: @bath.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bath.destroy
    respond_to do |format|
      format.html { redirect_to baths_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_bath
      @bath = Bath.find(params[:id])
    end

    def bath_params
      params.require(:bath).permit(:user_id, :name, :place, :content, :image)
    end
    
    def current_user_login
     unless  current_user
      flash[:referer] = 'ログインしてください'
      render new_session_path     # redirect_to new_session_path          render? redirect?
     end
    end
end
