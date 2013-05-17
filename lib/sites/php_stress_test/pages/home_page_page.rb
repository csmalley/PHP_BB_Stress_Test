require 'rubygems'
require 'taza/page'

module PhpStressTest
  class HomePagePage < ::Taza::Page
    
    element(:register_link)       { browser.link(:text =>'Register') }
    element(:agree_button)        { browser.input(:id =>'agreed') }  
    element(:forum_test_1_link)   { browser.link(:text => 'Forum Test 1') }
    element(:forum_link)          {|forum| browser.link(:text => forum)} 
    element(:thread_link)         { browser.link(:class => 'row bg1') }
    element(:thread_title)        { browser.li(:class => 'testing 123') }
    element(:login_link)          { browser.link(:text => 'Login') }
    element(:thread_title_link)   { |thread_name| thread_row(thread_name).link(:text => thread_name)}
    
    element(:thread_row)          { |thread_name| browser.links(:text => thread_name).first.parent.parent }      
    element(:replies)             { |thread_name| thread_row(thread_name).dd(:class => 'posts')}  
      
    element(:control_panel_link)  { browser.link(:title =>'User Control Panel') }
     
    element(:great_success)       { browser.div(:id =>'message').p(:text => 'This message has been posted successfully.')}
  end
end
