class Reviewer::ReviewsController < ApplicationController

  before_action :set_review, except: [:create, :youtube_videos]

  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    if @review.save
      respond_to do |format|
        format.html {
          flash[:success] = 'Review was created successfully.'
          redirect_to edit_reviewer_review_path(@review)
        }
        format.json {
          render json: nil, status: :ok
        }
      end
    else
      flash[:danger] = @review.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def show

  end

  def edit

  end

  def update
    if @review.update(review_params)
      respond_to do |format|
        format.html {
          flash[:success] = 'Review was updated successfully.'
          redirect_to edit_reviewer_review_path(@review)
        }
        format.json {
          render json: nil, status: :ok
        }
      end
    else
      flash[:danger] = @review.errors.full_messages.to_sentence
      redirect_to edit_reviewer_review_path(@review)
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'Review was deleted successfully'
    redirect_to root_path
  end

  def youtube_videos
    begin
      account = Yt::Account.new(refresh_token: current_user.refresh_token)
      @videos = account.videos
    rescue => e
      render :json => { :errors => e.to_s }, :status => 422
    end
  end
  private

  def set_review
    @review = Review.friendly.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:category_id, :title, :description, :youtube_id, :tags, :amazon_product_title, :amazon_product_description, :asin)
  end
end
