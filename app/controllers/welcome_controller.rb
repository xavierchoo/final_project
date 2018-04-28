class WelcomeController < ApplicationController

	def index

		@articles = Article.where(published: true)

	end

	def article
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
	end

end
