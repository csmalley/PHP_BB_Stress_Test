#Create a tag  on your feature
#This code goes in the support/hooks.rb file
#puts "made it to the hooks"

Before('@php_bb') do

  @site = PhpStressTest.new

end

After('@php_bb') do
  
  @site.close #unless @site.browser.nil
  
end