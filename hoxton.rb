require 'json'
require 'open-uri'

url = "https://api.tfl.gov.uk/AirQuality"

tfl_data = JSON.parse(open(url).read)

p tfl_data["currentForecast"][0]["forecastSummary"]
