class ParticipantsController < ApplicationController
  def new
  end

  def create

  end


  def edit
  end

  def update
  end


  private

  def topic_params
    params.require(:participant).permit(:user_id, :public_relation_id, :name, :is_participated)
  end
end
