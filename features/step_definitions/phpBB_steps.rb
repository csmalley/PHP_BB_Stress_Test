
Given(/^I am a not a registered user on the site (.*?)$/) do |link|

#  @site = Watir::Browser.new :firefox
#  @site.goto(link)
#what should I be doing differently here?

end


When(/^I register as a new user$/) do

  @site.home_page_page.register_link.click
  @site.home_page_page.agree_button.click
  
  @rand = Random.rand(10000)
  
  @site.register_page.username_field.value = ('test'+ @rand.to_s + '@junk.com')
  @site.register_page.email_field.value = @site.register_page.username_field.value
  @site.register_page.email_confirm_field.value = @site.register_page.username_field.value
  @site.register_page.new_password_field.value = @site.register_page.username_field.value
  @site.register_page.password_confirm_field.value = @site.register_page.username_field.value
  @site.register_page.submit_button.click

end


Then(/^I should see the Thank You page$/) do

  @site.register_page.great_success.exists?

end


Given(/^I am a returning user to the site$/) do 

  @site = Watir::Browser.new :firefox
  @site.goto(link)
  @site.link(:text =>'Register').click
  @site.input(:id => 'agreed').click
  @rand = Random.rand(10000)
  @site.text_field(:id => 'username').value = ('test'+ @rand.to_s + '@junk.com')
  @username = @site.text_field(:id => 'username').value

  @site.text_field(:id => 'email').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'email_confirm').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'new_password').value = @site.text_field(:id => 'username').value
  @site.text_field(:id => 'password_confirm').value = @site.text_field(:id => 'username').value
  @site.input(:id => 'submit').click

  @site.link(:title =>'Login').click

  @site.text_field(:id => 'username').set(@username)
  @site.text_field(:id => 'password').set(@username)
  @site.input(:name =>'login').click

end


When(/^I enter the User Control Panel$/) do
 # binding.pry
  @site.home_page_page.control_panel_link.click
  @site.user_control_panel_page.profile_tab.click

end


Then(/^I should be able to save changes to my profile$/) do

   @site.profile_page.website_field.set('http://www.b-body.org')
   @site.profile_page.location_field.set('Husker Nation!')
   @site.profile_page.bday_day_field.select('5')
   @site.profile_page.bday_month_field.select('5')
   @site.profile_page.bday_year_field.select('1977')
   @site.profile_page.submit_button.click

end


Given(/^I am a returning registered user to the site$/) do 

  @site.home_page_page.login_link.click
  @site.login_page.login_as('csmalley')
  
end


When(/^I enter the forum (.*?)$/) do |forum|
  
  #binding.pry
  @site.home_page_page.forum_test_1_link.wait_until_present
  @site.home_page_page.forum_test_1_link.click

end


Then(/^I should be able to create a new thread$/) do

  @site.link(:text => 'Post a new topic').click
  @site.text_field(:id=>'subject').set('testing 123')
  @site.text_field(:name => 'message').set('What do I actually get in this field')
  @site.input(:name => 'post').click
  @site.close

end



When(/^I post to the existing thread (.*?)$/) do |thread_text|

  @site.home_page_page.forum_link('Forum Test 1').wait_until_present
  @site.home_page_page.forum_link('Forum Test 1').click
  #binding.pry
  @number_of_replies = @site.home_page_page.replies(thread_text).text.to_i + 1 #slice(/\d+/)
  
  @site.home_page_page.thread_title_link(thread_text).when_present.click
  @site.post_reply_page.reply_button('Post a reply').click
  @site.post_reply_page.message.set('Testing 123.  This is reply number # ' + @number_of_replies.to_s + '. WooHoo!')
  
  @site.post_reply_page.post_button.click 
  
end

Then(/^I should see the message I have posted successfully$/) do

  @site.home_page_page.great_success.exists?
  
end

