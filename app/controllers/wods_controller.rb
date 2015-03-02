class WodsController < ApplicationController
before_action :require_user
before_action :set_user, only: [:edit, :update, :trash, :destroy]
before_action :set_wod, only: [:edit, :update, :trash, :destroy]
before_action :require_same_user, only: [:edit, :update, :trash, :destroy]


def index 
  @wods = current_user.wods.reverse
  access_denied if current_user.slug != params[:user_id]
end

def new
  @user = current_user
  @wod = Wod.new
end

def create
  @wod = Wod.new(wod_params)
  @wod.creator = current_user
  @wod.created_at = DateTime.now

    if @wod.save
      flash[:notice] = "Your WOD has been logged."
      redirect_to user_wods_path
    else
      render 'new'
    end
end

def edit
end

def update
  if @wod.update(wod_params)
    flash[:notice] = "Your WOD has been updated!"
    redirect_to user_wods_path
  else
    render 'edit'
  end
end


def destroy
  @wod.destroy
  flash[:error] = "Your WOD has been deleted."
  redirect_to user_wods_path
end

private

def set_user
  @user = User.find_by(slug: params[:user_id])
end

def set_wod
  @wod = Wod.find_by(slug: params[:id])
end

def wod_params
  params.require(:wod).permit(:workout, category_ids: [])
end

def require_same_user
  if current_user != @wod.creator
    access_denied
  end
end


end

