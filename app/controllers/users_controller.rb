class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def change
    @user = User.find(params[:id])
    @user.email = @user.email
    @user.last_name = @user.last_name
    @user.first_name = @user.first_name
    @user.keyword = @user.keyword
    @user.update(user_params)
    redirect_to public_relation_path(params[:memo_id])
  end

  def index
    @users = User.all
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
    end
    redirect_to user_path(@user.id)
  end

  def destroy
    # user = User.find(params[:id])
    # user.destroy
    # reset_session
    # redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :keyword, :is_participated)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:user_notice] = "理事情報の編集・削除は本人のみ可能です"
      redirect_to user_path(user.id)
    end
  end
end
