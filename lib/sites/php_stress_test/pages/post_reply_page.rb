require 'rubygems'
require 'taza/page'

module PhpStressTest
  class PostReplyPage < ::Taza::Page
    
      element(:reply_button)    {|reply_text| browser.links(:text => reply_text).first }
      element(:subject)         { browser.input(:id =>'subject') }
      element(:message)         { browser.text_field(:id =>'message') }
      element(:post_button)     { browser.input(:name =>'post')  }       
    
#    element(:register_link)     { browser.link(:text =>'Register') }
#    element(:agree_button)      { browser.input(:id =>'agreed') }  
#    element(:forum_test_1_link) { browser.link(:text => 'Forum Test 1') }
#    element(:forum_link)        {|forum| browser.link(:text => forum)} 
#    element(:thread_link)       { browser.link(:class => 'row bg1') }
#    element(:thread_title)      { browser.li(:class => 'testing 123') }
#    element(:login)             { browser.link(:text => 'Login') }
#    element(:thread)            { |thread_name| browser.links(:text => thread_name).first}
#    element(:great_success)     { browser.div(:id =>'message').p(:text => 'This message has been posted successfully.')}
  end
end