require 'pry'
require 'rest-client'
require 'json'
require 'dotenv'

Dotenv.load


@data = {}

n=0
while n < 10
  url = "http://api.nytimes.com/svc/semantic/v2/geocodes/query.json?feature_code=PCLI&fields=article_list&offset=#{n*20}&api-key=#{ENV['SECRET_KEY']}"
  result = RestClient::Request.execute(method: :get, url: url)
  hash = JSON.parse(result)
  raw = hash["results"]
  puts "#{raw}"

  raw.each do |place|
    country = place["geocode"]["country_code"]
    total = place["article_list"]["total"]
    @data[country] = total
  end
  sleep(1)
  n+=1
end

File.open("public/src/article-counts.js", "w") do |f|
  f.write("var articleCounts = {\n")
  @data.each do |country|
    f.write("\"#{country[0]}\": #{country[1]},\n")
  end
  f.write("}")
end
