require 'httparty'

def fetch_repositories(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def analyze_repositories(repos)
  most_starred_repo = repos.max_by { |repo| repo['stargazers_count'] }
  {
    name: most_starred_repo['name'],
    description: most_starred_repo['description'],
    stars: most_starred_repo['stargazers_count'],
    url: most_starred_repo['html_url']
  }
end

username = 'Dante1d'
repos = fetch_repositories(username)
most_starred_repo = analyze_repositories(repos)

puts "Most starred repository:"
puts "Name: #{most_starred_repo[:name]}"
puts "Description: #{most_starred_repo[:description]}"
puts "Stars: #{most_starred_repo[:stars]}"
puts "URL: #{most_starred_repo[:url]}"
