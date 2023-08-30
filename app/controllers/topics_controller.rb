class TopicsController < ApplicationController
  def new
  end

  def create

  end



  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:public_relation_id, :category_id, :name, :body)
  end
end
