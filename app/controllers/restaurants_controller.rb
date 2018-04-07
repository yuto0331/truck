class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :current_user_login, only: [:new, :edit, :show, :index, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @favorite = current_user.favorites.find_by(restaurant_id: @restaurant.id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
   @restaurant = current_user.restaurants.build(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'レストラン情報を新しく投稿しました' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: '編集しました' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_path, notice: '投稿を削除しました' }
    end
  end

  private
  
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:image, :name, :place, :user_id)
    end
    def current_user_login
     unless  current_user
      flash[:referer] = 'ログインしてください'
      redirect_to new_session_path
     end
    end
end
