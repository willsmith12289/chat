class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
end
