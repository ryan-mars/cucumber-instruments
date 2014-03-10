Feature: No regrets
	So that I dont regret choosing cucumber-instruments 
	As an iOS developer
	I want cucumber-instruments to work with all standard iOS UI elements

	Background: 
		Given I have an iOS app with all standard UI elements

	Scenario: Manipulate a picker wheel
		Given I am on the view with a picker wheel 
		When I query the currently selected value
		And I select a different value
		Then I should see that the currently selected value is different

	Scenario: Enumerate a picker wheel
		Given I am on the view with a picker wheel 
		When I query the list of values 
		Then I should get the full list of values 

	Scenario: Manipulate a table view
		

	Scenario: Manipulate a navigation bar 