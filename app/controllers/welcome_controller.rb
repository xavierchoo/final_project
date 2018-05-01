class WelcomeController < ApplicationController

	def index 

	  if params[:search]
	    @articles = Article.search(params[:search]).order("created_at DESC")
	  elsif(params.has_key?(:category) )
	    @articles = Article.where(category: params[:category], published: false)
	  else 
	  	@articles = Article.where(published: false)
	  end	
	end

	def article
		@bookmark = Bookmark.new
		@show_comments = Comment.where(article_id: params[:article_id])
		@comment = Comment.new
		@linking = params[:link]
		document = open(@linking)
		source = params[:source]
		content = document.read
		parsed_content = Nokogiri::HTML(content)
		if source == "BBC News"
		# @content = parsed_content.css('.clearfix').css('.parsys.content')
			if !parsed_content.css('.container').empty?
				@title = parsed_content.css('.story-body').css('.story-body__h1').children
				@paragraph = parsed_content.css('.story-body').css('.story-body__inner p').inner_text
				@images = []
				@image = parsed_content.css('.story-body').css('.story-body__inner').css('.image-and-copyright-container')
				@image.each {|x|  x.css(".js-delayed-image-load").each {|x| @images <<  x.attr("data-src")}}
				@vidpic =[]
				@vidpic = parsed_content.css('.story-body').css('.story-body__inner').css('.player-with-placeholder').css('.media-placeholder.player-with-placeholder__image')
				@vidpictures = @vidpic.map {|i| i.attr('src')}
			elsif !parsed_content.css('.vxp-media__container').empty?
				@images = []
				@vidpic =[]
				@title = parsed_content.css('.vxp-media__container').css('.vxp-column--single').css('.vxp-media__body').css('.vxp-media__headline').inner_text
				@paragraph = parsed_content.css('.vxp-media__container').css('.vxp-column--single').css('.vxp-media__body').css('div.vxp-media__summary p').inner_html.html_safe
				@vidpictures = parsed_content.css('.vxp-media__player img').attr('src')
			elsif !parsed_content.css('.story-headline').empty?
				@images = []
				@vidpic =[]
				@title = parsed_content.css('.story-headline').inner_html
				@paragraph = parsed_content.css('.story-body p').inner_html
				@images = parsed_content.css('.story-body').css('.sp-media-asset img').map {|i| i.attr('srcset')}

			end
		elsif source == "ABC News"
			@title = parsed_content.css('.container').css('.article-header h1').children
			@description = parsed_content.css('.container').css('.article-body').css('.article-copy p').inner_text
			@image = parsed_content.css('.container').css('.article-body').css('picture').css('img')
			@images = @image.map{|x| x.attr('src')}
		elsif source == "The New York Times"
			@title = parsed_content.css('#story').css('h1').children
			@image = parsed_content.css('#story').css('.story-body img').map{|x| x.attr('src')}
			@paragraph =  parsed_content.css('#story').css('.story-body-text.story-content').css('p').inner_text
		elsif source == "time"
			@image = parsed_content.css('.article-content').css('.image-wrapper').css('img')
			@images = @image.map{|x| x.attr('src')}
			@title = parsed_content.css('.article-header').css('h1').children
			@paragraph = parsed_content.css('.article-content').css('#article-body').css('div.padded p').inner_text
		end	

	end

	def bookmark
		article_link = params[:article_link]
	
		article_linking = Article.find_by(link: article_link)
		if Bookmark.where(user_id: current_user.id , article_id: article_linking.id).exists?
		else
			@bookmark = Bookmark.new
			@bookmark.user_id = current_user.id
			@bookmark.article_id = article_linking.id

			if @bookmark.save
				 redirect_back(fallback_location: article_page_path)
			else
				redirect_to '/error'
			end
		end
	end

	def comment

		article_link = params[:article_link]
	
		article_linking = Article.find_by(link: article_link)
		
	
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id
			@comment.article_id = article_linking.id
			if @comment.save
				 redirect_back(fallback_location: article_page_path)
			else
				redirect_to '/error'
			end
	end

	def search 
		if params[:search]
		  @articles = Article.search(params[:search]).order("created_at DESC")
		elsif(params.has_key?(:category) )
		  @articles = Article.where(category: params[:category], published: false)
		else 
			@articles = Article.where(published: false)
		end	
	end

	def general 
		@articles= Article.where(category: "general")
	end
	def health 
		@articles= Article.where(category: "health")
	end
	def technology
		@articles= Article.where(category: "technology")
	end
	def business
		@articles= Article.where(category: "business")
	end
	def sport
		@articles= Article.where(category: "sport")
	end

	private
	def comment_params
		params.require(:comment).permit(:link, :comment )
	end

	


end
