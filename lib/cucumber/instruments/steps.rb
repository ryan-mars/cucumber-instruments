Given(/^I launch the app$/) do
  Cucumber::Instruments::Server.start 
end

After do 
  Cucumber::Instruments::Server.stop
end 
