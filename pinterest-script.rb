require 'mechanize'
require 'nokogiri'
require 'rubygems'

query = 'pokemon'

agent = Mechanize.new

agent.get('http://www.pinterest.com/search/pins/?q=' + query) do |page|
	# puts page.body

	html_doc = Nokogiri::HTML(page.body)
	images = html_doc.css('img.pinImg').select{ |img| puts img['src'] }

	puts images
end