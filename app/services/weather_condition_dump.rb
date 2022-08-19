class WeatherConditionDump < ApplicationService
  def call
    condition_params = Accuweather.call

    condition_params.each do |condition|
      WeatherCondition
        .find_or_initialize_by(condition_time: condition[:condition_time])
        .update(temperature: condition[:temperature])
    end
  end
end
