class CategoriesController < ApplicationController
  def create

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

  def topic_params
    params.require(:category).permit(:name)
  end
end