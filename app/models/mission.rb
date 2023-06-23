class Mission < ApplicationRecord
  belongs_to :listing

  enum mission_type: { first_checkin: 0, last_checkout: 1, checkout_checkin: 3 }

  def self.check_presence_mission(listing, date)
    existing_mission = Mission.where(listing_id: listing.id, mission_type: 1, date: date)
    existing_mission.count.zero?
  end

end
