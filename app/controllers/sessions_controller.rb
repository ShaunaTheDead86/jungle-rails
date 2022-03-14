class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by_email(user_params[:email])
    @user[:email].downcase!
    @user[:email].strip!

    # If the user exists AND the password entered is correct.
    if @user && User.authenticate_with_credentials(@user[:email], @user[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to [:new, :session]
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  def user_params
    params.require(:session).permit(
      :email,
      :password
    )
  end
end
