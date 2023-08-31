class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to group_path(@group.id)
  end

  def show
    @group = Group.find(params[:id])
    @group_users =  @group.group_users.order(:user_id)
    @users_ary = []
    @users = User.where(keyword: "Management association 第3期")
    @users.each do |user|
      unless @group.group_users.find_by(user_id: user.id).present?
        @users_ary.push(user)
      end
    end
    @gourp_user = GroupUser.new
  end

  def index
    @groups = Group.all
  end

  def edit
  end

  def update

  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
