
Given(/^I am a not a registered user on the site (.*?)$/) do |link|

  @site = Watir::Browser.new :chrome
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

  @site.html.include?('#Thank you for registering')
  @site.close

end


Given(/^I am a returning user to the site$/) do 

  @site = Watir::Browser.new :chrome
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
  @site.link(:title =>'User Control Panel').click
  @site.span(:text => 'Profile').click

end


Then(/^I should be able to save changes to my profile$/) do

  @site.text_field(:id => 'website').set('http://www.b-body.org')
  @site.text_field(:id => 'location').set('Husker Nation!')
  @site.select_list(:id => 'bday_day').select('5')
  @site.select_list(:id => 'bday_month').select('5')
  @site.select_list(:id => 'bday_year').select('1977')
  @site.input(:name => 'submit').click
  @site.link(:text => 'Board index').click

  @site.close

end


Given(/^I am a returning registered user to the site$/) do 

  @site.home_page_page.register_link.click
  @site.home_page_page.agree_button.click
  @rand = Random.rand(10000)
  
  @site.register_page.username.set("test" + @rand.to_s + "@junk.com")
  @username = @site.register_page.username.value

  @site.register_page.email.set(@username)
  @site.register_page.email_confirm.set(@username)
  @site.register_page.new_password.set(@username) 
  @site.register_page.password_confirm.set(@username)     
  @site.register_page.submit_button.click
  @site.home_page_page.login.wait_until_present
  @site.home_page_page.login.click
  
  @site.login_page.username.set(@username)
  
  @site.login_page.password.set(@username)
  @site.login_page.login_button.click
  
end


When(/^I enter the forum (.*?)$/) do |forum|
  
  binding.pry
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


#When(/^I enter a forum with an existing thread (.*?)$/) do |forum|

 # @site.home_page_page.forum_link(forum).wait_until_present
 # @site.home_page_page.forum_link(forum).click
  #@site.link(:text => forum).click

#end

When(/^I post to the existing thread (.*?)$/) do |thread_text|

  @site.home_page_page.forum_link('Forum Test 1').wait_until_present
  @site.home_page_page.forum_link('Forum Test 1').click
  #binding.pry
  @number_of_replies = @site.home_page_page.replies(thread_text).text.to_i #slice(/\d+/)
  
  puts "replies = " + @number_of_replies.to_s
  
  @site.home_page_page.thread_title_link(thread_text).when_present.click
  @site.post_reply_page.reply_button('Post a reply').click
  @site.post_reply_page.message.set("Testing 123123123123123")
  
  
  
  @site.post_reply_page.post_button.click 
  


end

Then(/^I should see the message has posted successfully$/) do

  @site.home_page_page.great_success.exists?
  
end

