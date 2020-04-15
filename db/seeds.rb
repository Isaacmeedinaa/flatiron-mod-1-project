require 'json'
require 'rest-client'
require 'pry'

url = "https://developers.zomato.com/api/v2.1/cuisines?city_id=292"
a = RestClient.get(url, {"user-key" => "d69e6b8ed4f2ebcbc72de81478b91471"})
hash_from_internet = JSON.parse(a.body)
hash_from_internet["cuisines"]
puts hash_from_internet["cuisines"][0]["cuisine"]["cuisine_name"]

url1 = "https://developers.zomato.com/api/v2.1/search?entity_id=292&entity_type=city"
b = RestClient.get(url1, {"user-key" => "d69e6b8ed4f2ebcbc72de81478b91471"})
rest_internet = JSON.parse(b.body)
puts "#{rest_internet["restaurants"][0]["restaurant"]["name"]} + 
#{rest_internet["restaurants"][0]["restaurant"]["cuisines"]}"
rest_list = []
rest_internet["restaurants"].each do |r|
    arr = []
    arr << r["restaurant"]["name"]
    arr << r["restaurant"]["cuisines"]
    rest_list << arr
end

binding.pry