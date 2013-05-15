@php_bb

Feature: 
  
  As a phpBB website owner
  I want users to be able to register, edit their settings and post on my site.
  Let's see if this commits now

  @RegisteringNewUser
  Scenario: Registering A New User
    Given I am a not a registered user on the site http://xpan.b-body.org
    When I register as a new user
    Then I should see the Thank You page

  @ControlPanelTest
  Scenario: Editing User Settings
    Given I am a returning user to the site http://xpan.b-body.org
    When I enter the User Control Panel
    Then I should be able to save changes to my profile

  @PostingToThread
  Scenario: Posting To A Thread
    Given I am a returning registered user to the site http://xpan.b-body.org
    When I enter the forum Forum Test 1
    Then I should be able to create a new thread

  @ExistingThread
  Scenario: Post To An Existing Thread
    Given I am a returning registered user to the site 
    When I post to the existing thread testing 123
    Then I should see the message has posted successfully
