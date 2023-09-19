class VotesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

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
    @groups = Group.all
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
    @user = current_user
    @vote_answer = VoteAnswer.new
    @user_vote_answer = @vote.vote_answers.find_by(vote_id: @vote.id, user_id: current_user.id)
    @answers = VoteAnswer.where(vote_id: @vote.id)
    # グラフ作成の為のカウント
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
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(vote_params)
    redirect_to vote_path(@vote.id)
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    redirect_to votes_path
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :group_id, :title, :question, :choice_1, :choice_2, :choice_3, :choice_4)
  end

  def is_matching_login_user
    @vote = Vote.find(params[:id])
    unless @vote.user_id == current_user.id
      flash[:vote_notice] = "アンケートの編集・削除はアンケート作成者のみ可能です"
      redirect_to vote_path(@vote.id)
    end
  end
end
