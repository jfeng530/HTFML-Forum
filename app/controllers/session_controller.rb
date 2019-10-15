class SessionController < ApplicationController
  def new

  end

  def create
    # byebug
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to "/admin/articles"
    else
      flash[:notice] = "Email or Password is Incorrect!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to "/"
  end

end
