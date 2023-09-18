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
    @categories = Category.all
    @topics = @public_relation.topics.all
    @topic = @public_relation.topics.where()
  end

  def edit
    @public_relation = PublicRelation.find(params[:id])
  end

  def update
    @public_relation = PublicRelation.find(params[:id])
    @public_relation.update(public_relation_params)
    redirect_to public_relation_path(@public_relation.id)
  end

  private

  def public_relation_params
    params.require(:public_relation).permit(:user_id, :group_id, :title, :topic, :body, :date)
  end

  def is_matching_login_user
    @public_relation = PublicRelation.find(params[:id])
    unless @public_relation.user_id == current_user.id
      flash[:public_relation_notice] = "広報資料の編集・削除は資料作成者のみ可能です"
      redirect_to vote_path(@public_relation.id)
    end
  end
end
