class ParksController < ApplicationController
  def index
    @parks = Park.all
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(park_params)
    json_response(@park, 201)
  end

  def update
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: {
        message: "This park has been updated successfully"
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
  end

  private

  def park_params
    params.permit(:name, :type_of_park)
  end
end
