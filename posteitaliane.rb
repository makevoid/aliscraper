require 'mechanize'

URL = "http://www.poste.it/online/dovequando/home.do"

data = File.read "./data/example_tracking_numbers.txt"
trackings = data.split("\n").map(&:strip)


agent = Mechanize.new
agent.user_agent = "Mac Firefox"

poste_url = "http://www.poste.it/online/dovequando/ricerca.do"

trackings_batch = trackings.each_slice(10).map{ |a| a }

trackings_batch.each do |trackings|
  
  params = {}
  1.upto(10).each do |i|
    params["mpcode#{i}"] = trackings[i]
  end

  page = agent.post poste_url, params

  page.search(".tabella-poste tr td[5]").each_with_index do |td, i|
    puts "#{trackings[i]} #{td.inner_text}"
  end

end

# puts page.body
