# Ruby on Rails: Localized Weather API 

## Project Specifications

**Read-Only Files**
- spec/*

**Environment**  

- Ruby version: 2.7.1
- Rails version: 6.0.2
- Default Port: 8000

**Commands**
- run: 
```bash
bin/bundle exec rails server --binding 0.0.0.0 --port 8000
```
- install: 
```bash
bin/env_setup && source ~/.rvm/scripts/rvm && rvm --default use 2.7.1 && bin/bundle install
```
- test: 
```bash
RAILS_ENV=test bin/rails db:migrate && RAILS_ENV=test bin/bundle exec rspec
```
    
## Question description

You will need to implement a REST API service, which provides human-readable weather information using the Ruby on Rails framework.

Each endpoint of the REST service should receive a payload with information about the weather in a numeric scale and return a JSON with a human-readable representation of the given weather data in the following format:

```
{
  "description": "5 degrees Celsius below zero"
}
```

## Requirements:

`POST` request to `/weather/temperature`:

- accepts 2 parameters:
	- `locale`: optional. Default: en. Should accept only 'en' and 'es'.
	- `degrees`: required. An integer number representing the number of temperature degrees.
- If the required parameter `degrees` is missing, then the server should return the status code 422.
- Based on the following data, the server should return the following text in response:

| Degrees | Text (EN) | Text (ES) |
|---------|-----------|-----------|
| < 0     | %{degrees}  degrees Celsius below zero | %{degrees} grados centígrados bajo cero
| >= 0    | %{degrees}  degrees Celsius | %{degrees} grados centígrados


`POST` request to `/weather/wind`:

- accepts 2 parameters:
	- `locale`: optional. Default: en. Should accept only 'en' and 'es'.
	- `wind_speed`: required. An integer number representing the speed of wind in m/s.
- If the required parameter `wind_speed` is missing, then the server should return the status code 422.
- Based on the following data, the server should return the following text in response:

| Wind speed (m/s) | Text (EN)    | Text (ES) |
|------------------|--------------|-----------|
| < 3 | No wind | Sin viento |
| < 8 | Light breeze | Brisa ligera |
| < 20 | Windy | Clima ventoso |
| >=20 | Very strong wind | Viento muy fuerte |


`POST` request to `/weather/clouds`:

- accepts 2 parameters:
	- `locale`: optional. Default: en. Should accept only 'en' and 'es'.
	- `clouds`: required. An integer number (0-100) representing the percentage of the sky covered with clouds.
- If the required parameter `clouds` is missing, then the server should return the status code 422.
- Based on the following data, the server should return the following text in response:

| Clouds (%) | Text (EN) | Text (ES) |
|------------|-----------|-----------|
| <=10 | Clear weather | Tiempo despejado |
| <=70 | Partially cloudy | Parcialmente nublado |
| > 70 | Cloudy | Clima nublado |

All necessary texts in English and Spanish are already inside your project in the folder `/config/locales.`
