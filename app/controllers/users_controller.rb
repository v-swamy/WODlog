class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:show, :edit, :update]
  
def home
  if logged_in?
    redirect_to user_wods_path(current_user)
  end
end

def show; end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Thank you for registering!"
    redirect_to user_wods_path(@user)
  else
    render 'new'
  end
end

def edit; end

def update
  if @user.update(user_params)
    flash[:notice] = "Your profile has been updated!"
    redirect_to user_wods_path(@user)
  else
    render 'edit'
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :phone, :password)
end

def set_user
  @user = User.find_by(slug: params[:id])
end

def require_same_user
  if current_user != @user
    access_denied
  end
end

end