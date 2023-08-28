class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to vote_path(@vote.id)
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:title, :question, :choice)
  end
end
