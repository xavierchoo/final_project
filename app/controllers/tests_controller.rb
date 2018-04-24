class TestsController < ApplicationController
	require 'news-api'
	require 'open-uri'
	require 'nokogiri'

	def index
		n = News.new("e9a7bf1016d247af9980045693f8f46b")
		@index = n.get_top_headlines(sources: "bbc-news")
	end

	def show
	
		n = News.new("e9a7bf1016d247af9980045693f8f46b")
		document = open(params[:link])
		content = document.read
		parsed_content = Nokogiri::HTML(content)
		if !parsed_content.css('.container').empty?
			@paragraph = parsed_content.css('.container').css('.story-body').css('.story-body__inner')
		elsif !parsed_content.css('.vxp-media__container').empty?
			@pp = parsed_content.css('.vxp-media__container').css('.vxp-column--single').css('.vxp-media__body')
		end

			
	end

	def bbc

	end


	private

end
