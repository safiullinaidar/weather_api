class CreateWeatherConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_conditions do |t|
      t.decimal :temperature, precision: 5, scale: 1
      t.timestamp :condition_time

      t.timestamps
    end
  end
end
