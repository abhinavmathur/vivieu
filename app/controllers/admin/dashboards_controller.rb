class Admin::DashboardsController < ApplicationController
  layout 'admin'
  def index
  end

  def tags
    @categories = Category.order('title desc')
  end

  def manage_tags
    if params[:search].present?
      return @tags = Tag.search(params[:search].to_s)
    end
    if params[:category].present?
      @tags = Category.friendly.find(params[:category].to_s.split(' ').join('-').downcase).tags
    else
      @tags = Tag.order('title desc')
    end

  end
end
