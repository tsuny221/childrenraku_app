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
    @invited_user = User.find_by(id: params[:user][:invited_by_id])
    params[:user][:family_id] = @invited_user.family_id
    params[:user][:room_id] = @invited_user.room_id
    super
  end

  def destroy
    super
  end
end
