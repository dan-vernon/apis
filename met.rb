require 'json'
require 'open-uri'

api_key = "8d959166-56a7-49af-b19b-53936101b084"
resource = "val/wxfcs/all/json/3840?res=3hourly"
url = "http://datapoint.metoffice.gov.uk/public/data/#{resource}&key=#{api_key}"

data = JSON.parse(open(url).read)

p url

p data["SiteRep"]["Wx"]
# http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/xml/3840?res=3hourly&key=01234567-89ab-cdef-0123-456789abcdef

# http://datapoint.metoffice.gov.uk/public/data/val/wxfcs/all/xml/sitelist?key=01234567-89ab-cdef-0123-456789abcdef
