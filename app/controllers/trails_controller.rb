class TrailsController < ApplicationController
  load_and_authorize_resource except: [:vote]

  def index
    if params[:did].present?
      @district = District.find(params[:did])
      @province = @district.province
      @candidates = @district.candidates
    elsif params[:pid].present?
      @province = Province.find(params[:pid])
      @district = @province.districts.first
      @candidates = @district.candidates
    elsif params[:name].present?
      @candidates = Candidate.search_for(params[:name])
    end

    @trails = @candidates.any? ? Trail.where(candidate: @candidates) : Trail.all
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.user = current_user
    @trail.save
  end

  def update
    @trail = current_user.trails.find(params[:id])
    @trail.update(trail_params)
  end

  def destroy
    @trail.destroy
  end

  def vote
    @trail = Trail.find(params[:id])
    @trail.increment!("#{params[:vote]}s_count")
  end

  private

  def trail_params
    params.require(:trail).permit(:candidate_id, :body, :url)
  end
end