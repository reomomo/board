class MajorItemsController < ApplicationController

  def new
    @major_item = MajorItem.new
    @memo_id = session[:pr_memo_id]
  end

  def create
    @major_item = MajorItem.new(major_item_params)
    @major_item.save
    redirect_to public_relation_path(@major_item.public_relation_id)
  end

  def major_item_params
    params.require(:major_item).permit(:public_relation_id, :title)
  end
end
