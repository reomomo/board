class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @public_relation_id = params[:public_relation_id]
    @public_relation = PublicRelation.find(@public_relation_id)
    @category_id = params[:category_id]
    @category = Category.find(@category_id)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    redirect_to public_relation_path(@topic.public_relation.id)
  end

  def edit
    @topic = Topic.find(params[:id])
    @public_relation = @topic.public_relation
    @category = @topic.category
  end

  def update
    @topic = Topic.find(params[:id])
    @public_relation = @topic.public_relation
    @category = @topic.category
    @topic.update(topic_params)
    redirect_to public_relation_path(@public_relation.id)
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to public_relation_path(topic.public_relation_id)
  end

  private

  def topic_params
    params.require(:topic).permit(:public_relation_id, :category_id, :name, :body)
  end
end
