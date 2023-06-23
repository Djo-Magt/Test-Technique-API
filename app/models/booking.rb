class Booking < ApplicationRecord
  belongs_to :listing, dependent: :destroy

  after_create :request_cleanings
  before_destroy :destroy_mission

  def request_cleanings
    Mission.create(listing_id: listing, mission_type: 0, date: start_date, price: 10)
    Mission.create(listing_id: listing, mission_type: 1, date: end_date, price: 5)
  end

  private

  def destroy_mission
    listing.mission.where('date >= ? AND date <= ?', start_date, end_date).delete_all
  end
end
