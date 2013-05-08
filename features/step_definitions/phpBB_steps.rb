require 'pry'
require 'watir'

Given(/^I am a not a registered user on the site (.*?)$/) do |link|
  #pending

  @site = Watir::Browser.new :firefox
  @site.goto(link)

end


When(/^I register as a new user$/) do

  @site.link(:text =>'Register').click
  @site.input(:id => 'agreed').click
  @rand = Random.rand(10000)
  @site.text_field(:id => 'username').value = ('test'+ @rand.to_s + '@junk.com')
  @site.text_field(:id => 'email').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'email_confirm').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'new_password').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'password_confirm').value = @site.text_field(:id => 'username').value
  @site.input(:id => 'submit').click

end


Then(/^I should see the Thank You page$/) do

  @site.html.include? ('#Thank you for registering')
  @site.close

end


Given(/^I am a returning user to the site (.*?)$/) do |link|
  #pending # express the regexp above with the code you wish you had
  @site = Watir::Browser.new :firefox
  @site.goto(link)
  @site.link(:text =>'Register').click
  @site.input(:id => 'agreed').click
  @rand = Random.rand(10000)
  @site.text_field(:id => 'username').value = ('test'+ @rand.to_s + '@junk.com')
  @username = @site.text_field(:id => 'username').value

  puts 'Username = #{@username}'

  @site.text_field(:id => 'email').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'email_confirm').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'new_password').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'password_confirm').value = @site.text_field(:id => 'username').value
  @site.input(:id => 'submit').click

  @site.link(:title =>'Login').click

  @site.text_field(:id => 'username').set (@username)
  @site.text_field(:id => 'password').set (@username)
  @site.input(:name =>'login').click

end


When(/^I enter the User Control Panel$/) do
  @site.link(:title =>'User Control Panel').click
  @site.span(:text => 'Profile').click

end


Then(/^I should be able to save changes to my profile$/) do

  @site.text_field(:id => 'website').set ('http://www.b-body.org')
  @site.text_field(:id => 'location').set ('Husker Nation!')
  @site.select_list(:id => 'bday_day').select ('5')
  @site.select_list(:id => 'bday_month').select ('5')
  @site.select_list(:id => 'bday_year').select ('1977')
  @site.input(:name => 'submit').click
  @site.link(:text => 'Board index').click

  @site.close

end


Given(/^I am a returning registered user to the site(.*?)$/) do |link|
  @site = Watir::Browser.new :firefox
  @site.goto(link)
  @site.link(:text =>'Register').click
  @site.input(:id => 'agreed').click
  @rand = Random.rand(10000)
  @site.text_field(:id => 'username').value = ('test'+ @rand.to_s + '@junk.com')
  @username = @site.text_field(:id => 'username').value

  puts 'Username = #{@username}'

  @site.text_field(:id => 'email').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'email_confirm').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'new_password').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'password_confirm').value = @site.text_field(:id => 'username').value
  @site.input(:id => 'submit').click

  @site.link(:title =>'Login').click

  @site.text_field(:id => 'username').set (@username)

  @site.text_field(:id => 'password').set (@username)
  @site.input(:name =>'login').click


end


When(/^I enter the forum (.*?)$/) do |forum|

  @site.link(:text => forum).wait_until_present
  @site.link(:text => forum).click

end


Then(/^I should be able to create a new thread$/) do

  @site.link(:text => 'Post a new topic').click
  @site.text_field(:id=>'subject').set ('testing 123')
  @site.text_field(:name => 'message').set ('What do I actually get in this field')
  @site.input(:name => 'post').click
  @site.close

end


When(/^I enter a forum with an existing thread (.*?)$/) do |forum|

  @site.link(:text => forum).wait_until_present
  @site.link(:text => forum).click

end

Then(/^I should be able to post to the existing thread$/) do

  @site.li(:class => 'row bg1').a.click
  @site.link(:text => 'Post a reply').click
  @site.text_field(:name => 'message').set ('Here\'s my first reply.  Did it work?')
  @site.input(:name => 'post').click

end
