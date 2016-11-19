class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)

    if @user.persisted?
      flash[:success] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      @user.update_attributes(token: auth.credentials.token, avatar: auth.info.image, refresh_token: auth.credentials.refresh_token)
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = auth
      redirect_to new_user_registration_url
    end
  end
end