require 'httparty'
require 'json'

area = 'Europe'
location = 'London'

response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
data = JSON.parse(response.body)

current_date_time = Time.parse(data['datetime']).strftime('%Y-%m-%d %H:%M:%S')

puts "The current time in #{area}/#{location} is #{current_date_time}"
