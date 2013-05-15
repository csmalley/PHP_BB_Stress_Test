require 'rubygems'
require 'taza'


module PhpStressTest
  include ForwardInitialization

  class PhpStressTest < ::Taza::Site
    
    def close 
      
      browser.close
      
    end
    
  end
end
