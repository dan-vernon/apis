require 'json'
require 'open-uri'
require 'csv'

air_url = "https://api.tfl.gov.uk/AirQuality"
txt_weather_url = "http://datapoint.metoffice.gov.uk/public/data/txt/wxfcs/regionalforecast/json/514?key=8d959166-56a7-49af-b19b-53936101b084"
weather_data = "http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/json/353605?res=3hourly&key=8d959166-56a7-49af-b19b-53936101b084"

filepath = 'data/types.csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
mo_hash = {}

CSV.foreach(filepath, csv_options) do |row|
  mo_hash[:Value] = Description
  # pull first column of each row
end

p mo_hash

# txt_weather_url2 = "http://datapoint.metoffice.gov.uk/public/data/txt/wxfcs/regionalforecast/json/500"

southwark = 353605

# weather.each do |forecast|
#   p "#{forecast["id"]} #{forecast["Paragraph"]}"
# end

# def parse_url(url, structure)
#   JSON.parse(open(url).read) + structure
# end

# p parse_url(air_url,'["currentForecast"][0]["forecastSummary"]')

# p parse_url(txt_weather_url, "")

air_pollution = JSON.parse(open(air_url).read)["currentForecast"][0]["forecastSummary"]
outlook = JSON.parse(open(txt_weather_url).read)["RegionalFcst"]["FcstPeriods"]["Period"][0]["Paragraph"][0]["$"]
today = JSON.parse(open(txt_weather_url).read)["RegionalFcst"]["FcstPeriods"]["Period"][0]["Paragraph"][1]["$"]
forecast = JSON.parse(open(weather_data).read)["SiteRep"]["DV"]["Location"]["Period"][0]["Rep"]

forecast

forecast.each do |forecast|
puts "Forecast for #{forecast["$"].to_i / 60}00GMT: Temp #{forecast["T"]} Feels like #{forecast["F"]} #{forecast["D"]} #{forecast["S"]}/#{forecast["G"]}"
end
puts air_pollution
puts outlook
puts today



