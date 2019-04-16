# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_auth(request.env["omniauth.auth"])
    logger.debug @user.errors.inspect
    if @user.present?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      # provider_path = response["provider"].to_s.eql?("facebook") ? user_facebook_omniauth_authorize_path : user_google_oauth2_omniauth_authorize_path
      redirect_to new_user_session_path
    end
  end

  def failure
    redirect_to new_user_session_path and return
  end
end
