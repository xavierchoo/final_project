class WelcomeController < ApplicationController

	# def index
	# 	n = News.new("e9a7bf1016d247af9980045693f8f46b")
	# 	@index = n.get_top_headlines(sources: "bbc-news")
	# end
  def index
  	@articles = Testing.all
  end

end
