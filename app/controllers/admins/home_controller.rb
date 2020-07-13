class Admins::HomeController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  def top
  end

end
