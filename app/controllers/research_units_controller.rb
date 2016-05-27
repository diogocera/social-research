class ResearchUnitsController < ApplicationController
  def index
    @research_units = ResearchUnit.all
  end

  def create
    @research_unit = ResearchUnit.new(research_units_params)
    if @research_unit.save
      render json: @research_unit
    else
      render json: @research_unit.errors.to_json
    end
  end

  private

  def research_units_params
    params.require(:research_unit).permit(
      :name,
      :year_of_foundation
    )
  end
end
