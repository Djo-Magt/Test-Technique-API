class Reservation < ApplicationRecord
  belongs_to :listing, dependent: :destroy

  after_create :request_cleanings
  before_destroy :destroy_mission

  def request_cleanings
    Mission.create(listing_id: listing, mission_type: 3, date: end_date, price: 10) if Mission.check_presence_mission(listing, end_date)
  end

  private

  def destroy_mission
    listing.mission.where('date >= ? AND date <= ?', start_date, end_date).delete_all
  end
end
