class Users::InvitationsController < Devise::InvitationsController
  before_action :authenticate_user!
  before_action :child_check, only: [:new, :create]
  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    @user = User.find_by(params[:invited_by_id])
    params[:user][:family_id] = @user.family_id
    params[:user][:room_id] = @user.room_id
    super
  end

  def destroy
    super
  end
end
