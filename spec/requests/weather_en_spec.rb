require 'rails_helper'

describe 'WeatherControllerSpec', type: :request do  
  context 'english locale' do
    describe 'temperature' do
      context 'when parameter "degrees" is passed' do
        context 'when degrees is below zero' do
          it 'returns below zero text' do

            # {
            #     "comment": "Get temperature text description",
            #     "endpoint": "/weather/temperature",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "degrees": -10,
            #.       "locale": "en"     
            #     }
            #     "response": {"description": "10 degrees Celsius below zero"},
            #     "response_code": 200
            # }

            params = {
              degrees: -10,
              locale: :en
            }
            
            post '/weather/temperature', params: params, as: :json

            expected = {description: '10 degrees Celsius below zero'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is zero' do
          it 'returns above zero text' do

            # {
            #     "comment": "Get temperature text description",
            #     "endpoint": "/weather/temperature",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "degrees": 0,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "0 degrees Celsius"},
            #     "response_code": 200
            # }

            params = {
              degrees: 0,
              locale: :en
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '0 degrees Celsius'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is above zero' do
          it 'returns above zero text' do

            # {
            #     "comment": "Get temperature text description",
            #     "endpoint": "/weather/temperature",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "degrees": 15,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "15 degrees Celsius"},
            #     "response_code": 200
            # }

            params = {
              degrees: 15,
              locale: :en
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '15 degrees Celsius'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "degrees" is not passed' do
        it 'returns 422' do

          # {
          #     "comment": "Get temperature text description",
          #     "test_comment": "It tests getting temperature text description when no degrees is passed",
          #     "test_class": "WeatherControllerSpec",
          #     "test_priority": 1,
          #     "endpoint": "/weather/temperature",
          #     "method": "POST",
          #     "headers": {
          #         "Content-Type": "application/json"
          #     },
          #     "body": {"locale": "en"}
          #     "response": "",
          #     "response_code": 422
          # }

          params = {
            locale: :en
          }

          post '/weather/temperature', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end

    describe 'wind' do
      context 'when parameter "wind_speed" is passed' do
        context 'when wind speed is less than 3' do
          it 'returns "No wind"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/wind",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "wind_speed": 2,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "No wind"},
            #     "response_code": 200
            # }

            params = {
              wind_speed: 2,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'No wind'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 8' do
          it 'returns "Light breeze"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/wind",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "wind_speed": 3,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Light breeze"},
            #     "response_code": 200
            # }

            params = {
              wind_speed: 3,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Light breeze'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 20' do
          it 'returns "Windy"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/wind",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "wind_speed": 8,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Windy"},
            #     "response_code": 200
            # }

            params = {
              wind_speed: 8,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Windy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is more or equal than 20' do
          it 'returns "Very strong wind"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/wind",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "wind_speed": 20,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Very strong wind"},
            #     "response_code": 200
            # }

            params = {
              wind_speed: 20,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Very strong wind'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "wind_speed" is not passed' do
        it 'returns 422' do

          # {
          #     "comment": "Get wind text description",
          #     "test_comment": "It tests getting text description about wind when no wind speed is passed",
          #     "test_class": "WeatherControllerSpec",
          #     "test_priority": 1,
          #     "endpoint": "/weather/wind",
          #     "method": "POST",
          #     "headers": {
          #         "Content-Type": "application/json"
          #     },
          #     "body": {"locale": "en"}
          #     "response": "",
          #     "response_code": 422
          # }

          params = {
            locale: :en
          }

          post '/weather/wind', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end

    describe 'clouds' do
      context 'when parameter "clouds" is passed' do
        context 'when clouds percentage is less or equal than 10' do
          it 'returns "Clear weather"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/clouds",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "clouds": 10,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Clear weather"},
            #     "response_code": 200
            # }

            params = {
              clouds: 10,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Clear weather'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is less or equal than 70' do
          it 'returns "Partially cloudy"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/clouds",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "clouds": 70,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Partially cloudy"},
            #     "response_code": 200
            # }

            params = {
              clouds: 70,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Partially cloudy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is more than 70' do
          it 'returns "Cloudy"' do

            # {
            #     "comment": "Get text description about wind",
            #     "endpoint": "/weather/clouds",
            #     "method": "POST",
            #     "headers": {
            #         "Content-Type": "application/json"
            #     },
            #     "body": {
            #        "clouds": 71,
            #.       "locale": "en"
            #     }
            #     "response": {"description": "Cloudy"},
            #     "response_code": 200
            # }

            params = {
              clouds: 71,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Cloudy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "clouds" is not passed' do
        it 'returns 422' do

          # {
          #     "comment": "Get clouds text description",
          #     "test_comment": "It tests getting text description about clouds when no 'clouds' parameter is passed",
          #     "test_class": "WeatherControllerSpec",
          #     "test_priority": 1,
          #     "endpoint": "/weather/clouds",
          #     "method": "POST",
          #     "headers": {
          #         "Content-Type": "application/json"
          #     },
          #     "body": {"locale": "en"}
          #     "response": "",
          #     "response_code": 422
          # }
          
          params = {
            locale: :en
          }

          post '/weather/clouds', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end
  end
end
