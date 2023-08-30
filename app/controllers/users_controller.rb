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
  end

  def index
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :keyword, :is_participated)
  end
end
