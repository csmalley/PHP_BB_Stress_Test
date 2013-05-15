$LOAD_PATH << File.expand_path('../../../lib/sites', __FILE__)
$PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../..'))
Dir["#{$PROJECT_ROOT}/lib/sites/*.rb"].each { |file| require file }
  
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'taza'

require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'watir-webdriver/extensions/alerts'

#require 'chronic'
#require 'os'
#require 'active_record'
#require 'factory_girl'

require 'pry'
#require 'pry-nav'
ENV['TAZA_ENV'] ||= 'isolation'
(ENV['BROWSER'] ||= 'firefox').downcase
 (ENV['DRIVER'] ||= 'watir_webdriver').downcase


  
#TAZA_ENV = 'isolation'
