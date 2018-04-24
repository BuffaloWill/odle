require 'nokogiri'
require 'json'

module Odle
	# load the parsers
	Dir[File.join(File.dirname(__FILE__), "parsers", "*.rb")].each { |lib| require lib }

	# load the data model
	Dir[File.join(File.dirname(__FILE__), "model", "*.rb")].each { |lib| require lib }

end