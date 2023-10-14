class HomesController < ApplicationController
  def top
    @public_relations = PublicRelation.order(created_at: :desc).limit(5)
    @votes = Vote.order(create_at: :desc).limit(5)
  end

  def board
  end
end
