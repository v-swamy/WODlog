class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    login_user!(user)
  else
    flash[:error] = "There is something wrong with your email or password."
    redirect_to login_path
  end
end

def destroy
  session[:user_id] = nil
  flash[:notice] = "You've logged out!"
  redirect_to root_path
end

private

def login_user!(user)
  session[:user_id] = user.id 
  flash[:notice] = "You've logged in!"
  redirect_to user_wods_path(user)
end

end
