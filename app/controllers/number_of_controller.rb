class NumberOfController < ApplicationController
  def create
    @number_of = NumberOf.new(number_of_params)
    if @number_of.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { number_of: @number_of.number_of, id: @number_of.id } }
      end
    end
  end

  private

  def number_of_params
    params.require(:vote_answer).permit(:number_of)
  end
end
