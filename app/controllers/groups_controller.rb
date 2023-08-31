class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to 
  end

  def index
    @groups = Group.all
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
