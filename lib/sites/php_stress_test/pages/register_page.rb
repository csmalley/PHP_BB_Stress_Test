require 'rubygems'
require 'taza/page'

module PhpStressTest
  class RegisterPage < ::Taza::Page
    
    element(:username_field)         { browser.text_field(:id =>'username') }
    element(:email_field)            { browser.text_field(:id =>'email') } 
    element(:email_confirm_field)    { browser.text_field(:id =>'email_confirm') }
    element(:new_password_field)     { browser.text_field(:id =>'new_password') }
    element(:password_confirm_field) { browser.text_field(:id =>'password_confirm') }
    element(:submit_button)          { browser.input(:id =>'submit') }
    element(:great_success)          { browser.div(:id =>'message').p(:text => 'Thank you for registering, your account has been created. You may now login with your username and password.')}
      
  end
  
end