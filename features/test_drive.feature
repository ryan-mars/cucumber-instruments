Feature: Test drive an iOS app
  So that I can be sure we're building the right thing
  As an iOS developer
  I want to write automated acceptance tests for my iOS app

  Background:
    Given I have installed cucumber-instruments
    And I write to "features/right_nav_bar_button.feature" with:
      """
      Feature: Right nav bar button
        So that I can test my app works
        As a ...
        I want ...

        Scenario: Touch it
          Given I launch the app
          When there are no cells in the table view
          And I touch the navigation bar button on the right
          Then I should see there is 1 cell in the table view
      """
    And I write to "features/step_definitions/right_nav_bar_button_steps.rb" with:
      """
      When /^there are no cells in the table view$/ do
        cell_count = UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0].cells.count
        expect(cell_count).to eq(0)
      end

      When /^I touch the navigation bar button on the right$/ do
        UIATarget.localTarget.frontMostApp.navigationBar.rightButton.tap
        sleep 0.5
      end

      Then(/^I should see there is (\d+) cell in the table view$/) do |count|
        expect(UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0].cells.count).to eq(count.to_i)
      end
      """

  Scenario: Red
    Given I have an iOS project "BlankApp"
    And I have configured Cucumber-Instruments to test "BlankApp"
    When I run `bundle exec cucumber`
    Then it should fail with:
      """
      1 scenario (1 failed)
      4 steps (1 failed, 3 passed)
      """

  Scenario: Green
    Given I have an iOS project "FixtureApp"
    And I have configured Cucumber-Instruments to test "FixtureApp"
    When I run `bundle exec cucumber`
    Then it should pass with:
      """
      1 scenario (1 passed)
      4 steps (4 passed)
      """
