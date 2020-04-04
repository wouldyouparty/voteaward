class CandidatesController < ApplicationController
  def index
    if params[:did]
      @district = District.find(params[:did])
      @province = @district.province
    elsif params[:pid]
      @province = Province.find(params[:pid])
      @district = @province.districts.first
    else
      @province = Province.first
      @district = @province.districts.first
    end

    @candidates = @district.candidates
  end
end
