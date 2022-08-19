require "swagger_helper"

RSpec.describe "Weather API" do
  let!(:condition1) { WeatherCondition.create(condition_time: 1.hour.ago, temperature: 15.to_d) }
  let!(:condition2) { WeatherCondition.create(condition_time: 2.hours.ago, temperature: 16.to_d) }
  let!(:condition3) { WeatherCondition.create(condition_time: 3.hours.ago, temperature: 17.to_d) }
  let!(:condition4) { WeatherCondition.create(condition_time: 4.hours.ago, temperature: 18.to_d) }
  let!(:condition5) { WeatherCondition.create(condition_time: 5.hours.ago, temperature: 19.to_d) }
  let!(:condition6) { WeatherCondition.create(condition_time: 6.hours.ago, temperature: 20.to_d) }
  let!(:condition7) { WeatherCondition.create(condition_time: 7.hours.ago, temperature: 21.to_d) }
  let!(:condition8) { WeatherCondition.create(condition_time: 8.hours.ago, temperature: 22.to_d) }
  let!(:condition9) { WeatherCondition.create(condition_time: 9.hours.ago, temperature: 23.to_d) }
  let!(:condition10) { WeatherCondition.create(condition_time: 10.hours.ago, temperature: 23.to_d) }
  let!(:condition11) { WeatherCondition.create(condition_time: 11.hours.ago, temperature: 23.to_d) }
  let!(:condition12) { WeatherCondition.create(condition_time: 12.hours.ago, temperature: 23.to_d) }
  let!(:condition13) { WeatherCondition.create(condition_time: 13.hours.ago, temperature: 23.to_d) }
  let!(:condition14) { WeatherCondition.create(condition_time: 14.hours.ago, temperature: 23.to_d) }
  let!(:condition15) { WeatherCondition.create(condition_time: 15.hours.ago, temperature: 23.to_d) }
  let!(:condition16) { WeatherCondition.create(condition_time: 16.hours.ago, temperature: 23.to_d) }
  let!(:condition17) { WeatherCondition.create(condition_time: 17.hours.ago, temperature: 23.to_d) }
  let!(:condition18) { WeatherCondition.create(condition_time: 18.hours.ago, temperature: 23.to_d) }
  let!(:condition19) { WeatherCondition.create(condition_time: 19.hours.ago, temperature: 23.to_d) }
  let!(:condition20) { WeatherCondition.create(condition_time: 20.hours.ago, temperature: 23.to_d) }
  let!(:condition21) { WeatherCondition.create(condition_time: 21.hours.ago, temperature: 23.to_d) }
  let!(:condition22) { WeatherCondition.create(condition_time: 22.hours.ago, temperature: 23.to_d) }
  let!(:condition23) { WeatherCondition.create(condition_time: 23.hours.ago, temperature: 23.to_d) }
  let!(:condition24) { WeatherCondition.create(condition_time: 24.hours.ago, temperature: 23.to_d) }

  let(:parsed_response) { JSON.parse(response.body, symbolize_names: true) }

  path "/weather/current" do
    get "returns current temperature" do
      response "200", "Successful" do
        schema type: :object,
          properties: {
            temperature: { type: :string }
          }
      
        let(:expected_response) do
          {
            temperature: "15.0"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end

  path "/weather/historical/min" do
    get "returns minimal temperature for last 24 hours" do
      response "200", "Successful" do
        schema type: :object,
          properties: {
            temperature: { type: :string }
          }
      
        let(:expected_response) do
          {
            temperature: "15.0"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end

  path "/weather/historical/max" do
    get "returns maximal temperature for last 24 hours" do
      response "200", "Successful" do
        schema type: :object,
          properties: {
            temperature: { type: :string }
          }
      
        let(:expected_response) do
          {
            temperature: "23.0"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end

  path "/weather/historical/avg" do
    get "returns average temperature for last 24 hours" do
      response "200", "Successful" do
        schema type: :object,
          properties: {
            temperature: { type: :string }
          }
      
        let(:expected_response) do
          {
            temperature: "21.5"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end

  path "/weather/historical" do
    get "returns temperature for last 24 hours" do
      response "200", "Successful" do
        schema type: :object,
          properties: {
            data: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  temperature: { type: :string },
                  condition_time: { type: :string }
                }
              }
            }
          }

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test!
      end
    end
  end

  path "/weather/by_time" do
    get "returns temperature closest to given timestamp" do
      parameter name: :timestamp, in: :query, type: :integer

      response "200", "Successful" do
        schema type: :object,
          properties: {
            temperature: { type: :string }
          }
        
        let(:timestamp) { 256.minutes.ago.to_i }

        let(:expected_response) do
          {
            temperature: "18.0"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                success_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end

      response "404", "Not found" do
        schema type: :object,
          properties: {
            error: { type: :string }
          }
        
        let(:timestamp) { 2.days.ago.to_i }

        let(:expected_response) do
          {
            error: "Not found"
          }
        end

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                error_example: {
                  value: parsed_response,
                },
              },
              schema: example.metadata[:response][:schema],
            },
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end

        run_test! do
          expect(parsed_response).to eq(expected_response)
        end
      end
    end
  end
end
