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

  def index
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
    @answers.each do |ans|
      case ans.answer
      when @vote.choice_1
        @answer_1 += 1
      when @vote.choice_2
        @answer_2 += 1
      when @vote.choice_3
        @answer_3 += 1
      when @vote.choice_4
        @answer_4 += 1
      end
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :group_id, :title, :question, :choice_1, :choice_2, :choice_3, :choice_4)
  end
end
