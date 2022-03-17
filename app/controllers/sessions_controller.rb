class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to [:new, :session]
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  def session_params
    params.require(:session).permit(
      :email,
      :password
    )
  end
end
