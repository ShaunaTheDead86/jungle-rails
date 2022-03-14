class UsersController < ApplicationController

  def new
  end

  def create
    @params = @user_params
    @params.email = @params.email.downcase
    @params.email = @params.email.strip!

    user = User.new(@params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to [:new, :user]
    end
  end


  private 
  
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
