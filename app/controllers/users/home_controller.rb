class Users::HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  def top
  end
end
