class WeatherCondition < ApplicationRecord
  scope :sorted, -> { order(condition_time: :desc) }
  scope :current, -> { sorted.first }
  scope :historical, -> { sorted.limit(24) }

  def self.by_time(timestamp)
    return unless timestamp
    return unless timestamp.match?(/\A\d+\z/)
    
    prev_condition = 
      WeatherCondition
        .where("condition_time <= ?", Time.at(timestamp.to_i))
        .order(condition_time: :desc).first
    
    next_condition = 
      WeatherCondition
        .where("condition_time >= ?", Time.at(timestamp.to_i))
        .order(condition_time: :asc).first
    
    [prev_condition, next_condition]
      .compact
      .sort_by { |condition| (condition.condition_time.to_i - timestamp.to_i).abs }
      .select { |condition| (condition.condition_time.to_i - timestamp.to_i).abs <= 3.hours.to_i }
      .first
  end

  def as_json(*)
    super(only: %i[temperature condition_time])
  end
end
