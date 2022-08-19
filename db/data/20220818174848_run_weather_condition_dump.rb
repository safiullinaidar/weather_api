# frozen_string_literal: true

class RunWeatherConditionDump < ActiveRecord::Migration[7.0]
  def up
    WeatherConditionDump.call
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
