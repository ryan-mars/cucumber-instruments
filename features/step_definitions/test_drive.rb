module CucumberInstrumentsHelper 
	def install_cucumber_instruments
		gem "cucumber-instruments", :path => "#{File.expand_path('.')}"
	end 

	def gem(name, options)
    line = %{gem "#{name}", #{options.inspect}\n}
    append_to_file('Gemfile', line)
  end
end 

World(CucumberInstrumentsHelper)

Given(/^I have installed cucumber\-instruments$/) do
  install_cucumber_instruments
end

Given(/^I have an iOS project "(.*?)"$/) do |project_name|
  FileUtils.cp_r "spec/fixtures/#{project_name}/.", current_dir
end