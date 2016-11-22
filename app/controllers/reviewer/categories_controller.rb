class Reviewer::CategoriesController < ApplicationController

  def index
    #raise params[:order].to_s.inspect
    @categories = Category.select_order(params[:order].to_s)
  end

  def show
    @category = Category.friendly.find(params[:id])
  end
end
