class PreferencesController < ApplicationController
  def create
      preference = current_user.preferences.create(bath_id: params[:bath_id])
      redirect_to baths_url, notice: "#{preference.bath.name}をお気に入り登録しました"
  end 
  
  def destroy
	    preference = current_user.preferences.find_by(bath_id: params[:bath_id]).destroy
	    redirect_to baths_url, notice: "#{preference.bath.name}のお気に入りを解除しました"
  end 
end
