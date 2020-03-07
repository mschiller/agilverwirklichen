class ProfilesController < ApplicationController

  def show
    @user = User.where(slug: params[:id]).first
  end

  # def update
  #   authorize! :update, current_user
  #   @user = User.update(user_params)
  # end

  def change_password
    authorize! :update, current_user
    @user = current_user

    if request.put?
      resource_updated = @user.update_with_password(password_update_params)

      if resource_updated
        redirect_to profile_path(@user)
      else
        @user.clean_up_passwords
        respond_with @user
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def password_update_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
