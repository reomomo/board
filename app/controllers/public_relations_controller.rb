class PublicRelationsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @public_relation = PublicRelation.new
    @category = Category.new
  end

  def create
    @public_relation = PublicRelation.new(public_relation_params)
    @public_relation.user_id = current_user.id
    if @public_relation.save
      session[:pr_memo_id] = @public_relation.id
      redirect_to public_relation_path(@public_relation.id)
    end
  end

  def index
    @groups = Group.all
    @public_relations = PublicRelation.all
    @key = params[:group_key].to_i
  end

  def show
    @public_relation = PublicRelation.find(params[:id])
    @users = User.all
    # 同じグループidのカテゴリーのみ
    @categories = Category.where(group_id: @public_relation.group.id)
    @topics = @public_relation.topics.all
  end

  def edit
  end

  def update
    @public_relation.update(public_relation_params)
    redirect_to public_relation_path(@public_relation.id)
  end

  def destroy
    @public_relation.destroy
    redirect_to public_relations_path
  end

  private

  def public_relation_params
    params.require(:public_relation).permit(:user_id, :group_id, :title, :topic, :body, :date)
  end

  def is_matching_login_user
    @public_relation = PublicRelation.find(params[:id])
    unless @public_relation.user_id == current_user.id
      flash[:public_relation_notice] = "広報資料の編集・削除は資料作成者のみ可能です"
      redirect_to public_relation_path(@public_relation.id)
    end
  end
end
