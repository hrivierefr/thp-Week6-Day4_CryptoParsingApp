require 'rubygems'
require 'nokogiri'  
require 'open-uri'
require 'resolv-replace'

class CurrencyExtract
	def perform

		page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		 
		page.css("div.container.main-section tbody tr").each_with_index { |currency_line, i| 
			Currency.create!(
				name: currency_line.css("a.currency-name-container.link-secondary").text, 
				quotation: currency_line.css("a.price").text
			)
		}
	end
end