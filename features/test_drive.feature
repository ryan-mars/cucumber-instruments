@announce @wip
Feature: Test drive an iOS app 
	So that I can be sure we're building the right thing
	As an iOS developer
	I want to write automated acceptance tests for my iOS app

	Background: 
		Given I have installed cucumber-instruments
		And I write to "features/right_nav_bar_button.feature" with:
			"""
      Feature: Right nav bar button
        Scenario: Touch it
      		When I touch the navigation bar button on the right    
      """
    And I write to "features/step_definitions/right_nav_bar_button_steps.rb" with:
    	"""
    	class UIATarget
    		def self.localTarget
    			return UIATarget.new
    		end 

    		def frontMostApp
    			return UIApplication.new
    		end 
    	end

    	class UIApplication
    		def navigationBar
    		end
    	end 

    	When /^I touch the navigation bar button on the right$/ do 
    		UIATarget.localTarget.frontMostApp.navigationBar.rightButton.tap
    	end 
    	"""

	Scenario: Red
		Given my app does not have a right button on the navigation bar
		When I run `bundle exec cucumber`
		Then it should fail with: 
			"""
			1 scenario (1 failed)
			1 step (1 failed)
			"""

	Scenario: Green 
		Given my app does have a right button on the navigation bar
		When I run `bundle exec cucumber`	
		Then it should pass with: 
			"""
			1 scenario (1 pass)
			1 step (1 pass)
			"""