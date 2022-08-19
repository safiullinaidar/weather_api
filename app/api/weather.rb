class Weather < Grape::API
  format :json

  namespace :weather do
    get :current do
      {
        temperature: WeatherCondition.current.temperature
      }
    end

    get :by_time do
      condition = WeatherCondition.by_time(params[:timestamp])

      error!("Not found", 404) unless condition

      {
        temperature: condition.temperature
      }
    end

    namespace :historical do
      get do
        {
          data: WeatherCondition.historical
        }
      end
      
      get :min do
        {
          temperature: WeatherCondition.historical.minimum(:temperature)
        }
      end

      get :max do
        {
          temperature: WeatherCondition.historical.maximum(:temperature)
        }
      end

      get :avg do
        {
          temperature: WeatherCondition.historical.average(:temperature).round(1)
        }
      end
    end
  end
end
