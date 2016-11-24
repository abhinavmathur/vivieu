class Reviewer::TagsController < ApplicationController

  def create
    final_tags = []
    category_id = params[:category_id]
    tags = params[:tag_box]
    tag_array = tags.split(',')
    tag_array.each do |tag|
      tags = Tag.create(title: tag, owner: current_user, category_id: category_id)
      unless tags.errors.any?
        final_tags.push(tags.title)
      end
    end

    respond_to do |format|
      format.js {
        flash[:success] = 'Your tags were added successfully !'
        @category = Category.find(category_id)
      }
    end
  end
end
