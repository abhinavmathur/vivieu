class Admin::CategoriesController < Admin::DashboardsController

  before_action :set_category, except: [:index, :new, :create]

  def index
    @categories = Category.order('title desc')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = 'Category was created successfully'
      redirect_to reviewer_category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.to_sentence
      redirect_to admin_categories_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category was updated successfully'
      redirect_to reviewer_category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.to_sentence
      redirect_to admin_categories_path
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Category was removed successfully'
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
