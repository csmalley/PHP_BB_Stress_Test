require 'rubygems'
require 'taza/page'

module PhpStressTest
  class LoginPage < ::Taza::Page
    
    element(:username_field)        { browser.text_field(:id =>'username') }
    element(:password_field)        { browser.text_field(:id =>'password') }
    element(:autologin_checkbox)    { browser.checkbox(:id => 'autologin')}  
    element(:view_online_checkbox)  { browser.checkbox(:id => 'autologin')}  
      
    element(:login_button)          { browser.input(:name =>'login') }
      
      
    def login_as(username, password='password')
    
      username_field.set(username)
      password_field.set(password)
      login_button.click
    
    
    end
    
  end
    
end