Feature: Test drive an iOS app 
	So that I can build trust/communicate effectively/ensure that I have built what the product owner wanted/user wants
	As an iOS developer 
	I want drive my development 

	Scenario: Red
		Given I have an app without a right button on the navigation bar
		And I have a step that says: 
			"""
			When I touch the navigation bar button on the right
			"""
		Then it should fail with: 
			"""
			???
			"""

	Scenario: Green 
		Given I have an app with a right button on the navigation bar
		And I have a step that says: 
			"""
			When I touch the navigation bar button on the right
			"""
		Then it should pass with: 
			"""
			???
			"""