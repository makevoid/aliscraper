require 'mechanize'

URL = "http://www.poste.it/online/dovequando/home.do"

data = File.read "./data/example_tracking_numbers.txt"
data = data.split("\n").map(&:strip)


agent = Mechanize.new
agent.user_agent = "Mac Firefox"

poste_url = "http://www.poste.it/online/dovequando/ricerca.do"

params = {}
1.upto(10).each do |i|
  params["mpcode#{i}"] = data[i]
end

page = agent.post poste_url, params

puts page.body
