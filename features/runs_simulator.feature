Feature: Runs apps in the simulator
	In order to test the behavior of my app
	As an iOS developer using Cucumber
	I want my app to run in the simulator

	Scenario: Starts Instruments with shim
        Given I have installed Cucumber Instruments
		When I run `cucumber-instruments`
		Then the output should contain "Cucumber Instruments started..."
