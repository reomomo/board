class GroupUsersController < ApplicationController
  def new
    @gourp_user = GroupUser.new
  end

  def create_group

  end

  def add_user
    @gourp_user = GroupUser.new(g_u_params)
    @users = User.all
    @group_id = params[:memo1_id]
    @group_user.save
    redirect_to groups_path
  end

  def index
    @users = User.all
  end


  def update

  end

  private

  def g_u_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end
