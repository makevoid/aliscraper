# jcoglan is awesome

# using terminus - capybara driver that drives browsers

require 'capybara/dsl'
require 'terminus'

Capybara.current_driver = :terminus

visit('http://google.com')