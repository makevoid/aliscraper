require 'rubygems'
require 'watir'

# Watir::Browser.default = "firefox"

browser = Watir::Browser.start  "http://www.weather.com/"

browser.text_field(:id, "whatwhereForm2").set("san diego, ca")

browser.button(:src,"http://i.imwx.com/web/common/searchbutton.gif").click

browser.link(:text, "10-Day").click