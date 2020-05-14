class CandidatesController < ApplicationController
  def index
    if params[:name].present?
      @candidates = Candidate.search_for(params[:name])
    else
      @candidates = Candidate.all
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
    @page = params[:page] || "trails"
  end
end
