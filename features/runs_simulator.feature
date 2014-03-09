@ignore 
Feature: Runs apps in the simulator
	In order to test the behavior of my app
	As an iOS developer using Cucumber
	I want my app to run in the simulator

	Scenario: Starts Instruments with shim
    Given I have an iPhone app bundle built for the simulator
    When I run `cucumber-instruments --app "../instruments-server/build/TestApp.app"` interactively
      