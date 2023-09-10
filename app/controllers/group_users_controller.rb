class GroupUsersController < ApplicationController

  # users/showから追加する場合はuser_pathへ遷移
  def add_group
    @group_user = GroupUser.new(g_u_params)
    @group_user.save
    redirect_to user_path(@group_user.user.id)
  end

  # groups/showから追加する場合はgroup_pathへ遷移
  def add_user
    @group_user = GroupUser.new(g_u_params)
    @group_user.save
    redirect_to group_path(@group_user.group.id)
  end

  # users/showから削除する場合はuser_pathへ遷移
  def destroy_group
    group_user = GroupUser.find(params[:id])
    memo_id = group_user.user.id
    group_user.destroy
    redirect_to user_path(memo_id)
  end

  # groups/showから削除する場合はgroup_pathへ遷移
  def destroy_user
    group_user = GroupUser.find(params[:id])
    memo_id = group_user.group.id
    group_user.destroy
    redirect_to group_path(memo_id)
  end

  private

  def g_u_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end
