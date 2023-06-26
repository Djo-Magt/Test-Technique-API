class MissionsController < ApplicationController
  def index
    @mission = Mission.pluck(:listing_id, :mission_type, :date, :price)
                      .map do |list, mission, date, price|
                              {listing_id: list, mission_type: mission, date: date, price: price}

    @responce = {missions: @mission}
    render json: @responce
  end
end
