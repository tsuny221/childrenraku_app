class Admins::GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room_families

  def index
    @q = Group.where(room_id: @room.id).page(params[:page]).ransack(params[:q])
    @groups = @q.result(distinct: true)
    @group = Group.find_by(id: params[:group_id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.room_id = @room.id
    if @group.save
      flash[:notice] = "新しいグループを作成しました。"
      redirect_to admins_groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループを編集しました。"
      redirect_to admins_groups_path
    else
      render :edit
    end
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admins_groups_path
    flash[:notice] = "グループの削除が完了しました。"
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def current_room_families
    @room = current_admin.room
    @families = Family.where(room_id: @room.id)
  end
end
