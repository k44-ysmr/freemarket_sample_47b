class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  before_action :category_variable

  private

  def production?
    Rails.env.production?
  end

  def require_signin
    redirect_to controller: :users, action: :index unless user_signed_in?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def category_variable
    @categories = Category.where("grandparent_id = 0 && parent_id = 0")
    @brands = Brand.all
  end
end
