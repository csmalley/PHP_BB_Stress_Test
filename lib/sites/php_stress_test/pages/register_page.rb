require 'rubygems'
require 'taza/page'

module PhpStressTest
  class RegisterPage < ::Taza::Page
    
    element(:username)          { browser.text_field(:id =>'username') }
    element(:email)             { browser.text_field(:id =>'email') } 
    element(:email_confirm)     { browser.text_field(:id =>'email_confirm') }
    element(:new_password)      { browser.text_field(:id =>'new_password') }
    element(:password_confirm)  { browser.text_field(:id =>'password_confirm') }
    element(:submit_button)     { browser.input(:id =>'submit') }
    #element(:contact_container) { |contact_name| browser.div(:id => contact_name) }
    #element(:email_contact) { |contact_name| contact_container(contact_name).links(:text ="email me")
  end
end