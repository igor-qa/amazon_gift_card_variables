require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'




Before do
  $driver = Selenium::WebDriver.for :firefox
  $driver.get $homeurl
  $driver.manage.window.maximize
end

After do
  #$driver.quit
  #$driver.close
end