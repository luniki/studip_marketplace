In order to distribute my plugins
As a developer
I want to create entries for my plugins

Scenario: unauthenticated users may not create plugins
  Given I am not logged in
  When I go to the new plugin page
  Then I should get an error message

Scenario: a new plugin is created
  Given I am logged in as a developer
  When I create a new plugin named ExamplePlugin
  Then I should see that a plugin named ExamplePlugin exists

Scenario: a new plugin requires a valid zip file
  Given I am logged in as a developer
  When I create a new plugin with an invalid zip file
  Then I should see an error message

Scenario: a new plugin requires a zip file with a valid manifest
  Given I am logged in as a developer
  When I create a new plugin with a zip file with an invalided manifest
  Then I should see an error message

