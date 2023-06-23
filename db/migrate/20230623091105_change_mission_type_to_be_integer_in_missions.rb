class ChangeMissionTypeToBeIntegerInMissions < ActiveRecord::Migration[7.0]
  def change
    change_column :missions, :mission_type, 'integer USING CAST(mission_type AS integer)'
  end
end
