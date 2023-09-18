class PublicRelationsController < ApplicationController
  def new
    @public_relation = PublicRelation.new
    @major_item = MajorItem.new
  end

  def create
    @public_relation = PublicRelation.new(public_relation_params)
    @public_relation.user_id = current_user.id
    if @public_relation.save
      session[:pr_memo_id] = @public_relation.id
      redirect_to new_major_item_path
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
  end

  def update

  end

  private

  def public_relation_params
    params.require(:public_relation).permit(:user_id, :group_id, :title, :topic, :body, :date)
  end
end
