class Accuweather < ApplicationService
  API_KEY = ENV["ACCUWEATHER_API_KEY"]
  LOCATION_ID = "293687"
  API_URL = "https://dataservice.accuweather.com/currentconditions/v1/#{LOCATION_ID}/historical/24"

  def call
    parsed_response.map do |weather_condition|
      {
        temperature: weather_condition.dig("Temperature", "Metric", "Value"),
        condition_time: Time.at(weather_condition["EpochTime"])
      }
    end
  end

  private

  def parsed_response
    @parsed_response ||= HTTParty.get(API_URL, query: {apikey: API_KEY})
  end
end
