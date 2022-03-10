class Admin::CategoriesController < ApplicationController

  before_filter :authorize
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:categories, :admin]
    else
      redirect_to [:new, :session]
    end
  end

  private 
  
  def category_params
    params.require(:category).permit(
      :id,
      :name,
      :created_at,
      :updated_at
    )
  end
end
