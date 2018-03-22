class FavoritesController < ApplicationController
  def create
      favorite = current_user.favorites.create(restaurant_id: params[:restaurant_id])
      redirect_to restaurants_url, notice: "#{favorite.restaurant.name}をお気に入り登録しました"
  end 
  
  def destroy
	    favorite = current_user.favorites.find_by(restaurant_id: params[:restaurant_id]).destroy
	    redirect_to restaurants_url, notice: "#{favorite.restaurant.name}のお気に入りを解除しました"
  end 
end
