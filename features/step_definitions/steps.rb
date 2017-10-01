$homeurl = "https://www.amazon.com/"

# Then /^Open amazon$/ do
#   $driver.get $homeurl
#   $driver.manage.window.maximize
# end

Then /^Make money with us ([^"]*)$/ do |money|
  element = $driver.find_element :xpath => "//a[@class='nav_a'and text()='#{money}']"
  element.click
  sleep 2
  $driver.navigate.back

  sleep 2
end

Then /^Click gift cards$/ do
  element = $driver.find_element :xpath => "//a[@class='nav-a'][contains(text(),'Gift Cards')]"
  element.click
  sleep 1
  element = $driver.find_element :xpath => "//img[@alt=\"Gift Cards &gt; See all\"]"
  element.click
  sleep 2
end

Then /^Click eGift cards$/ do
  element = $driver.find_element :xpath => "//img[@alt=\"eGift\"]"
  element.click
  sleep 2
end

Then /^Create ([^"]*) gift card with ([^"]*) 'th design by ([^"]*) dollars send via ([^"]*)$/ do |a,b,c,d|
  element = $driver.find_element :xpath => "//span[@class='a-button-inner']/button[contains(text(), '#{a}')]"
  element.click
  sleep 1
  element = $driver.find_element :id => "gc-mini-picker-design-swatch-image-#{b}"
  element.click
  element = $driver.find_element :id => "gc-order-form-custom-amount"
  element.send_keys "#{c}"
  element = $driver.find_element :xpath => "//button[@id='gc-delivery-mechanism-button-Email-announce'][contains(text(),'#{d}')]"
  element.click
  element = $driver.find_element :id => "gc-order-form-recipients"
  element.send_keys "Nikita Omelhenko"
  element = $driver.find_element :id => "gc-order-form-senderName"
  element.send_keys "Igor Postnikov"
end

Then /^Send text: ([^"]*)$/ do |e|
  element = $driver.find_element :id => "gc-order-form-message"
  element.send_keys " #{e}"
  element = $driver.find_element :id => "gc-order-form-date-val"
  element.click
  sleep 1
  element = $driver.find_element :xpath => "//a[@class='a-declarative a-cal-paginate-next']"
  element.click
  sleep 1
  element = $driver.find_element :xpath => "(//a[@class='a-declarative a-cal-date-anchor'])[9]"
  element.click
end