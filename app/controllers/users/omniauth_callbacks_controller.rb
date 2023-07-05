class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_omniauth('Google')
  end

  def github
    handle_omniauth('Github')
  end

  private

  def handle_omniauth(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted? # If user exists
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: provider
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider.downcase}_data"] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end
