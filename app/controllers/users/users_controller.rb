class Users::UsersController < ApplicationController
  def show
    @user = current_user
    @children = @user.children.all
  end
  def edit

  end
  def update

  end
end
