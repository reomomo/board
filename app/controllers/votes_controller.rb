class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to vote_path(@vote.id)
    else
      render :new
    end
  end

  def show
    @vote = Vote.find(params[:id])
    @user = current_user
    @vote_answer = VoteAnswer.new
    @vote_answers = @vote.vote_answers.find_by(vote_id: @vote.id, user_id: current_user.id)
    @answers = VoteAnswer.where(vote_id: @vote.id)
    @answer_1 = 0
    @answer_2 = 0
    @answer_3 = 0
    @answer_4 = 0
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :title, :question, :choice_1, :choice_2, :choice_3, :choice_4)
  end
end
