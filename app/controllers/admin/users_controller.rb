class Admin::UsersController < Admin::DashboardsController

  before_action :set_user, except: :index

  def index
    if params[:search].present?
      return @users = User.search(params[:search].to_s)
    end
    @users = User.order('created_at desc')
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User profile was successfully updated'
      redirect_to admin_user_path(@user)
    else
      flash[:danger] = 'User profile was not updated'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'User was deleted successfully'
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:vivieu_name, :email, :description, :facebook,
                                 :twitter, :google_plus, :patreon, :personal_website, :locale, :admin, :reviewer)
  end

end
