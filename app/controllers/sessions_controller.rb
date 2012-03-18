class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "invalid username/password"
      render 'new'
    else
      sign_in user
      redirect_to home_path
    end
  end

  def new
  end

  def destroy
    sign_out
    redirect_to home_path
  end

end
