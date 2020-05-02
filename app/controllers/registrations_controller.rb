class RegistrationsController < Devise::RegistrationsController
helper_method  :current_user
helper_method :logged_in?
  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end