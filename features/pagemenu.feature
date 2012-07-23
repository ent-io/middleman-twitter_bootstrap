Feature: In order to output static html for a page
  
  Scenario: Checking source folder for content
    Given a successfully built app at "middleman-twitter_bootstrap"
    When I cd to "source"
    Then the following files should exist:
      | new.html                                    |
      | templates/template.html.erb                 |
      | partials/_header.html.erb                   |
      | partials/_footer.html.erb                   |
      | partials/_menu.html.erb                     |

  Scenario: Previewing "config.rb" file to check for the appropriate layout configuration for "page.html"
    Given the layout configuration is properly created 
    When I go to "config.rb"
    Then I should see "page '/source/new.html', :layout => 'template'"
  
  Scenario: Checking template for content
    Given the Server is running at "middleman-twitter_bootstrap"
    And the file "source/new.html" has the contents

	"""	
         Welcome to EntIO LLC

	"""
   When I go to "/new.html"
   Then I should see "Welcome to EntIO LLC"


   Scenario: Checking header content
      Given the Server is running at "middleman-twitter_bootstrap"
      And the file "source/partials/_header.html.erb" has the contents

	"""	
         This is sample header

	"""
      When I go to "/new.html"
      Then I should see "This is sample header" as a header

  Scenario: Checking footer content
      Given the Server is running at "middleman-twitter_bootstrap"
      And the file "source/partials/_footer.html.erb" has the contents

	"""	
        this is sample footer

	"""
      When I go to "/new.html"
      Then I should see "this is sample footer" as a header
	
