require "mechanize"

# configs
ALI_EMAIL = "makevoid@gmail.com"
ALI_PASSW = File.read(File.expand_path "~/.password").gsub(/33/, '')

email = ALI_EMAIL.gsub(/@/, '%40')

LOGIN_URL = "https://login.aliexpress.com/xman/xlogin.js?pd=aliexpress&pageFrom=&u_token=&xloginPassport=#{email}&xloginPassword=#{ALI_PASSW}&dmtrack_pageid=50b7673b7f000001537da6bb14622d3366d1c6c8c6"

LOGIN_URL2 = "https://login.alibaba.com/xman/tvs.htm"

agent = Mechanize.new
agent.user_agent = "Mac Firefox"

page = agent.get LOGIN_URL

# puts page.body

json = page.body.gsub(/var xman_login_token=/, '')
token = JSON.parse(json)["token"]


page = agent.post LOGIN_URL2 % token, "iframe_delete=true&switch=on&token=%s&pid=141115758&moduleKey=common.xman.SetCookie&rnd=1400743609262"

page = agent.get "https://login.aliexpress.com/xloginCallBackForRisk.do"

puts page.body
page = agent.get "http://trade.aliexpress.com/orderList.htm"


puts page.body

puts page.body =~ /The Best Value Online/


### hard, just making the posteitaliane one