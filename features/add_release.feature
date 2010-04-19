Feature: add a release to a plugin
  In order to make new features available
  As a plugin developer
  I want to add a release to a plugin

Scenario: the user tries to add a release of another plugin
  Given I am logged in as a developer
  And I am the owner of a plugin
  When I add a release of another plugin
  Then I should see an error message

