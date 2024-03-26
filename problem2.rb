require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
data = JSON.parse(response.body)

# Sort cryptocurrencies by market capitalization in descending order
sorted_data = data.sort_by { |crypto| -crypto['market_cap'] }

# Output the top 5 cryptocurrencies
puts "Top 5 Cryptocurrencies by Market Cap:"
sorted_data[0, 5].each_with_index do |crypto, index|
  puts "#{index + 1}. #{crypto['name']} (#{crypto['symbol']}): $#{crypto['current_price']} (Market Cap: $#{crypto['market_cap']})"
end
