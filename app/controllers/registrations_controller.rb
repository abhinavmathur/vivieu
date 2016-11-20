class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private
  def account_update_params
    params.require(:user).permit(:vivieu_name, :description, :email, :facebook,
                                 :twitter, :google_plus, :patreon, :personal_website, :locale,
                                 affiliate_countries_attributes: [:id, :country, :user, :default_affiliate_tag, :tracker, :_destroy])
  end
end