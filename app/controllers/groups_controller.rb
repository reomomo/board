class GroupsController < ApplicationController

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to group_path(@group.id)
  end

  def show
    @group = Group.find(params[:id])
    @group_users =  @group.group_users.order(:user_id)
    @users_ary = []
    @users = User.all
    @users.each do |user|
      unless @group.group_users.find_by(user_id: user.id).present?
        @users_ary.push(user)
      end
    end
    @gourp_user = GroupUser.new
  end

  def index
    @group = Group.new
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group.id)
  end

  def destroy
    group = Group.find(params[:id])
    public_relations = PublicRelation.where(group_id: group.id)
    votes = Vote.where(group_id: group.id)
    group_other = Group.find_by(name: "その他")
    if group_other.present?
      public_relations.each do |pr|
        pr.user_id = pr.user_id
        pr.title = pr.title
        pr.date = pr.date
        pr.group_id = group_other.id
        pr.update
      end
      votes.each do |vote|
        vote.user_id = vote.user_id
        vote.title = vote.title
        vote.question = vote.question
        vote.choice_1 = vote.choice_1
        vote.choice_2 = vote.choice_2
        vote.choice_3 = vote.choice_3
        vote.choice_4 = vote.choice_4
        vote.group_id = group_other.id
        vote.update
      end
    else
      @group = Group.new
      @group.name = "その他"
      @group.save
      public_relations.each do |pr|
        pr.user_id = pr.user_id
        pr.title = pr.title
        pr.date = pr.date
        pr.group_id = @group.id
        pr.update
      end
      votes.each do |vote|
        vote.user_id = vote.user_id
        vote.title = vote.title
        vote.question = vote.question
        vote.choice_1 = vote.choice_1
        vote.choice_2 = vote.choice_2
        vote.choice_3 = vote.choice_3
        vote.choice_4 = vote.choice_4
        vote.group_id = @group.id
        vote.update
      end
    end
    group.destroy
    redirect_to groups_path
    # 削除したらグループ：その他へ移動
    # グループ：その他をどう扱うか
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
