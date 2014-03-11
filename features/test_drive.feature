@wip @announce
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
        	Given I am on the main screen
      		When I touch the navigation bar button on the right    
      		Then I should see that a new cell added to the table view
      """
    And I write to "features/step_definitions/right_nav_bar_button_steps.rb" with:
    	"""
    	class UIATarget
    		def self.localTarget
    			return UIATarget.new
    		end 

    		def frontMostApp
    			return UIAApplication.new
    		end 
    	end

    	class UIAApplication
    		def navigationBar
    			return UIANavigationBar.new
    		end

    		def mainWindow 
    			return UIAWindow.new
    		end 
    	end 

    	class UIAWindow 
    		def tableViews
    			return [UIATableView.new]
    		end
    	end 

    	class UIATableView
    		def cells
    			return []
    		end 
    	end

    	class UIANavigationBar
    		def rightButton
    			return UIAButton.new 
    		end 
    	end 

    	class UIAButton
    		def tap
    		end 
    	end 

    	Given(/^I am on the main screen$/) do
    		@cell_count = UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0].cells.count
      end

    	When /^I touch the navigation bar button on the right$/ do 
    		UIATarget.localTarget.frontMostApp.navigationBar.rightButton.tap
    	end 

    	Then(/^I should see that a new cell added to the table view$/) do
  			expect(@cell_count + 1).to eq(UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0].cells.count)
			end
    	"""

	Scenario: Red
		Given my app does not have a right button on the navigation bar
		When I run `bundle exec cucumber`
		Then it should fail with: 
			"""
			1 scenario (1 failed)
			3 steps (1 failed, 1 skipped, 1 passed)
			"""

	Scenario: Green 
		Given my app does have a right button on the navigation bar
		When I run `bundle exec cucumber`	
		Then it should pass with: 
			"""
			1 scenario (1 pass)
			3 steps (3 pass)
			"""