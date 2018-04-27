class TestsController < ApplicationController
	require 'news-api'
	require 'open-uri'
	require 'nokogiri'
	def new
	end

	def index
	end



	def show

	end

	def homepage
		@name = params[:name]
		@description = params[:description]
		@link = params[:link]
		@image = params[:image]
	end


	def abc
		@content =parsed_content.css('.clearfix').css('.parsys_content')
	end

	def time

		@content =parsed_content.css('.article-content').css('#article-body').css('.padded')
	end
	def espn

		@content = parsed_content.css('#main-container').css('.container').css('.article-body')
	end

	def bbc
		n = News.new("e9a7bf1016d247af9980045693f8f46b")
		document = open(params[:link])
		content = document.read
		parsed_content = Nokogiri::HTML(content)
		# @content = parsed_content.css('.clearfix').css('.parsys.content')
		if !parsed_content.css('.container').empty?
			@title = parsed_content.css('.story-body').css('.story-body__h1').children
			@paragraph = parsed_content.css('.story-body').css('.story-body__inner p').inner_text
			@images = []
			@image = parsed_content.css('.story-body').css('.story-body__inner').css('.image-and-copyright-container')
			@image.each {|x|  x.css(".js-delayed-image-load").each {|x| @images <<  x.attr("data-src")}}
			@vidpic = parsed_content.css('.story-body').css('.story-body__inner').css('.player-with-placeholder').css('.media-placeholder.player-with-placeholder__image')
			@vidpictures = @vidpic.map {|i| i.attr('src')}
		elsif !parsed_content.css('.vxp-media__container').empty?
			@title = parsed_content.css('.vxp-media__container').css('.vxp-column--single').css('.vxp-media__body').css('.vxp-media__headline').inner_text
			@paragraph = parsed_content.css('.vxp-media__container').css('.vxp-column--single').css('.vxp-media__body').css('div.vxp-media__summary p').inner_html.html_safe
			@vidpictures = parsed_content.css('.vxp-media__player img').attr('src')
		end
		#<% if @paragraph.present? %>
		#	<%= @paragraph.inner_html.html_safe %>
		#<% elsif @pp.present? %>
		#	<%= @pp.inner_html.html_safe %>
		#<% else %>
		#<%end %>

	end


	private
	def testing_params
		params.require(:testing).permit(:name , :description , :link , :image )
	end

end
