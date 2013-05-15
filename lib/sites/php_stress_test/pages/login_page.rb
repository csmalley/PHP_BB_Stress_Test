require 'rubygems'
require 'taza/page'

module PhpStressTest
  class LoginPage < ::Taza::Page
    
    element(:username)          { browser.text_field(:id =>'username') }
    element(:password)      { browser.text_field(:id =>'password') }

    element(:login_button)     { browser.input(:name =>'login') }

  end
end