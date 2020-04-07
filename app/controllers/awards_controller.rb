class AwardsController < ApplicationController
  load_and_authorize_resource

  def index
    @awards = Award.all
  end

  def show
  end

  def new
  end

  def create
    @award = Award.new(award_params)
    @award.user = current_user
    if @award.save
      redirect_to @award
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @award.update(award_params)
      redirect_to @award
    else
      render :edit
    end
  end

  def destroy
    @award.destroy
    redirect_to awards_path
  end

  private

  def award_params
    params.require(:award).permit(:title, :body, candidate_ids: [])
  end
end