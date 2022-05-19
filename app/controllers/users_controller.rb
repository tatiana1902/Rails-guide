class UsersController < ApplicationController
  
     
  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_back(fallback_location: root_path)
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_back(fallback_location: root_path)
  end
  
end
