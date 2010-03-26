In order to inform myself about the advertised plugins
As a visitor
I want to see a list of plugins

Scenario: visitor gets a list of plugins
  Given I am not logged in
  And there are some plugins
  When I go to the homepage
  Then I should see a list of plugins
