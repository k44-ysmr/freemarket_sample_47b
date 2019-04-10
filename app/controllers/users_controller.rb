class UsersController < ApplicationController
  def index
  end

  def show
  end


  def new
  end

  def profile
    @name = current_user.nickname
  end


end
