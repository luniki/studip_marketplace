Feature: Title
  In order to value
  As a role
  I want feature

@wip
Scenario: the user deletes a release
  Given I am logged in as a developer
  And I am the owner of a plugin
  And the plugin has a release
  When I go to the plugin page
  And I delete the release
  Then I should not see an error message
  And I should see no releases

