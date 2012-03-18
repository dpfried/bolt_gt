class PagesController < ApplicationController
  def home
    if signed_in_admin?
      render :action => "admin"
    elsif signed_in?
      redirect_to answer_path
    else
      redirect_to signin_path
    end
  end

  def admin
  end

end
