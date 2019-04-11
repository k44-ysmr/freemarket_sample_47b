class UsersController < ApplicationController
  before_action :require_signin, except: :index

  def index
  end

  def show
  end


  def new
  end

  def profile
  end

end
