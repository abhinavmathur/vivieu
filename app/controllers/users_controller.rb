class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :show]
  before_action :set_user

  def show

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Amazon affiliate countries were
       successfully updated. You can click <a href='/users/edit'>here</a> to go back to the settings page"
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_registration_path(anchor: 'affiliate-settings')
    end
  end

  private
  def user_params
    params.require(:user).permit(:vivieu_name, :email,
                                 affiliate_countries_attributes: [:id, :country, :default_affiliate_tag, :tracker, :_destroy])
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
