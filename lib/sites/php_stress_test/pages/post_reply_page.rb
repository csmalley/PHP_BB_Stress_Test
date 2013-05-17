require 'rubygems'
require 'taza/page'

module PhpStressTest
  class PostReplyPage < ::Taza::Page
    
      element(:reply_button)    {|reply_text| browser.links(:text => reply_text).first }
      element(:subject)         { browser.input(:id =>'subject') }
      element(:message)         { browser.text_field(:id =>'message') }
      element(:post_button)     { browser.input(:name =>'post')  }       

  end
end