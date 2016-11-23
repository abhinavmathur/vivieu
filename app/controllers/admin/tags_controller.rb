class Admin::TagsController < Admin::DashboardsController

  before_action :set_tag, only: [:edit, :update, :destroy]

  def create
    @tag = Tag.create(tag_params)
    if @tag.save
      flash[:success] = 'Tag was created successfully'
      respond_to do |format|
        format.html {
          redirect_to admin_manage_tags_path(category: @tag.category.title)
        }
        format.js
      end
    else
      flash[:danger] = @tag.errors.full_messages.to_sentence
      redirect_to admin_manage_tags_path
    end
  end

  def edit

  end

  def update
    if @tag.update(tag_params)
      flash[:success] = 'Tag was edited successfully'
      redirect_to admin_tags_path
    else
      flash[:danger] = @tag.errors.full_messages.to_sentence
      redirect_to admin_manage_tags_path(category: @tag.category.title)
    end

  end

  def destroy
    category = @tag.category.title
    @tag.destroy
    flash[:success] = 'Tag was deleted'
    redirect_to admin_manage_tags_path(category: category)
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :category_id, :owner)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
