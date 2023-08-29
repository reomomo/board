class VoteAnswersController < ApplicationController
  def create
    @vote_answer = VoteAnswer.new(vote_answer_params)
    @vote_answer.user_id = current_user.id
    @vote_answer.email = current_user.email
    if @vote_answer.save
      redirect_to vote_path(@vote_answer.vote.id)
    else
      flash[:vote_notice] = "回答を選択後、再度登録してください"
      redirect_to vote_path(@vote_answer.vote.id)
    end
  end

  private
  def vote_answer_params
    params.require(:vote_answer).permit(:user_id, :vote_id, :answer, :email)
  end
end
