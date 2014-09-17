Given(/^I launch the app$/) do
  Cucumber::Instruments.launch
end

After do
  Cucumber::Instruments::Server.stop
end
