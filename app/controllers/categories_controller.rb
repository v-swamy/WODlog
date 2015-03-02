class CategoriesController < ApplicationController
  before_action :set_category, only:  [:show, :update, :destroy] 

def index
  @categories = Category.all.sort
  @category = Category.new
end

def show; end

def new
  @category = Category.new
end

def create
  @category = Category.new(cat_params)
  @category.creator = current_user

  if @category.save
    flash[:notice] = "Your category has been saved!"
    redirect_to user_categories_path
  else
    @categories = Category.all.sort
    render 'index'
  end
end

def edit; end

def update
  @category.creator = current_user

  if @category.update(cat_params)
    flash[:notice] = "Your category has been updated!"
    redirect_to user_categories_path
  else
    @categories = Category.all.sort
    render 'index'
  end
end

def destroy
  @category.destroy
  flash[:error] = "Your category has been deleted."
  redirect_to user_categories_path
end

private

def cat_params
  params.require(:category).permit(:name)
end

def set_category
  @category = Category.find_by(slug: params[:id], user_id: current_user.id)
  access_denied if current_user.slug != params[:user_id]
end

end

