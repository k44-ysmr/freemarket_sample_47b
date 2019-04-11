class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_signin, if: :use_before_action?
  before_action :basic_auth, if: :production?

  private

  def production?
    Rails.env.production?
  end

  def require_signin
    redirect_to controller: :users, action: :index unless user_signed_in?
  end

  def use_before_action?
    false
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
