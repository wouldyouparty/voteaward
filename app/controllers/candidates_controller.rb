class CandidatesController < ApplicationController
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
    else
      @province = Province.first
      @district = @province.districts.first
      @candidates = @district.candidates
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
    @page = params[:page] || "comments"
  end
end
