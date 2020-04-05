class TrailsController < ApplicationController
  def index
    @trails = Trail.all
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

  def vote
    @trail = Trail.find(params[:id])
    @trail.increment!("#{params[:vote]}s_count")
  end

  private

  def trail_params
    params.require(:trail).permit(:candidate_id, :body, :url)
  end
end