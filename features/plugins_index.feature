In order to inform myself about the advertised plugins
As a visitor
I want to work with a list of plugins

Scenario: visitor gets a list of plugins
  Given there are some plugins
  When I go to the homepage
  Then I should see a list of plugins

Scenario: visitor clicks on a plugin from the list
  Given there are some plugins
  When I go to the homepage
  And I click on a plugin
  Then I should see the plugin's page

Scenario: visitor searches for a plugin
  Given the following plugin exists:
  | name           | description                   |
  | SearchMePlugin | with a searchable description |
  When I go to the homepage
  And I search for "SearchMe"
  Then TODO
