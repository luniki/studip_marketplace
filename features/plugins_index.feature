In order to inform myself about the advertised plugins
As a visitor
I want to work with a list of plugins

Scenario: visitor gets a list of plugins
  Given I am not logged in
  And there are some plugins
  When I go to the homepage
  Then I should see a list of plugins

Scenario: visitor clicks on a plugin from the list
  Given I am not logged in
  And there are some plugins
  When I go to the homepage
  And I click on a plugin
  Then I should see the plugin's page

