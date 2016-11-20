class Reviewer::CategoriesController < ApplicationController

  def index
    @categories = Category.order('title desc')
  end

  def show
    @category = Category.friendly.find(params[:id])
  end
end
