class UsersController < ApplicationController
  def change
    @user = User.find(params[:id])
    @user.email = @user.email
    @user.last_name = @user.last_name
    @user.first_name = @user.first_name
    @user.keyword = @user.keyword
    @user.update(user_params)
    redirect_to public_relation_path(params[:memo_id])
  end

  def show
    @user = User.find(params[:id])
    @group_users =  @user.group_users.order(:group_id)
    @groups_ary = []
    @groups = Group.all
    @groups.each do |group|
      unless @user.group_users.find_by(group_id: group.id).present?
        @groups_ary.push(group)
      end
    end
    @gourp_user = GroupUser.new
  end

  def index
    @users = User.all
    @group = Group.all
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :keyword, :is_participated)
  end
end
