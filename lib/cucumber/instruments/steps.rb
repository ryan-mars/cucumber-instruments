Given(/^I launch the app$/) do
  Cucumber::Instruments.start 
end

After do 
  Cucumber::Instruments.stop
end 
