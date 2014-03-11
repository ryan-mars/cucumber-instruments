module CucumberInstrumentsHelper 
	def install_cucumber_instruments
	end 

	def setup_blank_app
	end 

	def setup_test_app
	end 
end 

World(CucumberInstrumentsHelper)

Given(/^I have installed cucumber\-instruments$/) do
  install_cucumber_instruments
end

Given(/^my app does not have a right button on the navigation bar$/) do
  setup_blank_app
end

Given(/^my app does have a right button on the navigation bar$/) do
  setup_test_app
end