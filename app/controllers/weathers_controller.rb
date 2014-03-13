class WeathersController < ApplicationController
  def index
    city = params[:city]
    state = params[:state]

    if city.present? && state.present?
      @weather_data = JSON.parse(HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city},#{state}&units=imperial").body)
    end

    respond_to do |format|
      format.html
    end
  end
  # http://api.openweathermap.org/data/2.5/weather?q=kenner,la
end
