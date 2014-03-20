@wip
Feature: Get started 
	So that I can begin test driving my iOS app with as little hassle as possible
	As an iOS developer who enjoys BDD 	
	I want cucumber-instruments to set itself up with sensible defaults

	Background:
		Given I am in the root of my iOS project 
		And I have installed cucumber-instruments
		
	Scenario: Create features directory
		When I run `cucumber-instruments get-started` 
		Then I should see a features directory with sensible defaults

	Scenario: Simple iOS project 
		Given I have a project file with a single target 
		When I run `cucumber-instruments get-started` 
		Then I should see a features directory with sensible defaults
		And cucumber-instruments is configured to launch my app		

	Scenario: iOS app with Cocoapods
		Given I have a project file with a single target 
		When I run `cucumber-instruments get-started` 
		Then I should see a features directory with sensible defaults
		And cucumber-instruments is configured to launch my app