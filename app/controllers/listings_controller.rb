class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :update, :destroy]

  def index
    @listing = Listing.pluck(:id, :num_rooms)
                      .map { |idi, num| { id: idi, num_rooms: num } }

    @responce = { listings: @listing }
    render json: @responce
    # raise
  end

  def show
            @response = {
            id: @listing.id,
            num_rooms: @listing.num_rooms
        }

        render json: @response
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render nothing: true, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      render nothing: true, status: :updated
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    render nothing: true, status: :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
