class WeatherController < ApplicationController

  def temperature
    unprocessable_entity if temperature_params[:degrees].nil?

    @temperature = Temperature.create(temperature_params)

    render json: temperature_response
  end

  def clouds
    unprocessable_entity if clouds_params[:clouds].nil?

    @clouds = Cloud.create(clouds_params)

    render json: clouds_response
  end

  def wind
    unprocessable_entity if temperature_params[:wind_speed].nil?

    @wind = Wind.create(wind_params)

    render json: wind_response
  end

  private

  def temperature_params
    params.permit(:locale, :degrees)
  end

  def clouds_params
    params.permit(:locale, :clouds)
  end

  def wind_params
    params.permit(:locale, :wind_speed)
  end

  def unprocessable_entity
    render :nothing => true, :status => 422 
  end

  def temperature_response
    set_locale

    if @temperature.degrees < 0
      description(I18n.t('temperature.below_zero', degrees: @temperature.degrees))
    else
      description(I18n.t('temperature.above_zero', degrees: @temperature.degrees))
    end
  end

  def clouds_response
    set_locale

    if @clouds.clouds <= 10
      description(I18n.t('clouds.none'))
    elsif  @clouds.clouds <= 70
      description(I18n.t('clouds.partial'))
    else
      description(I18n.t('clouds.full'))
    end
  end

  def wind_response
    set_locale

    if @wind.wind_speed < 3
      description(I18n.t('wind.none'))
    elsif @wind.wind_speed < 8
      description(I18n.t('wind.weak'))
    elsif @wind.wind_speed < 20
      description(I18n.t('wind.medium'))
    else
      description(I18n.t('wind.strong'))
    end
  end

  def description(message)
    {
      description: message
    }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
