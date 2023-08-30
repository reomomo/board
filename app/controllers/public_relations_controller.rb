class PublicRelationsController < ApplicationController
  def new
    @public_relation = PublicRelation.new
    # @number_of = params[:value]
    # if params[:user_input]
    #   user_input = params[:user_input].to_i
    #   @number_of = user_input
    # end

  end

  def create
    @public_relation = PublicRelation.new(public_relation_params)
    @public_relation.user_id = current_user.id
    @public_relation.save
    redirect_to public_relation_path(@public_relation.id)
  end

  def show
    @public_relation = PublicRelation.find(params[:id])
  end

  def edit
  end

  def index
  end

  private

  def public_relation_params
    params.require(:public_relation).permit(:user_id, :title, :topic, :body, :date)
  end
end
