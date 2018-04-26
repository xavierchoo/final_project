namespace :admin do
  desc "Adding api data to our test database table"
  task data: :environment do
  	n = News.new("e9a7bf1016d247af9980045693f8f46b")
  	data = n.get_everything(	
                                      sources: 'bbc-news',
                                      domains: 'bbc.co.uk',
                                      from: '2018-04-01',
                                      to: '2018-04-24',
                                      language: 'en',
                                   
                                      page: '10')
  	data.each do |data|
  		testing = Testing.new
  		testing.description = data.description
  		testing.name = data.name
  		testing.image = data.urlToImage
  		testing.link = data.url
  		testing.save!
  	end

  	data = n.get_everything(	
                                      sources: 'abc-news',
                                      domains: 'abcnews.go.com',
                                      from: '2018-04-01',
                                      to: '2018-04-24',
                                      language: 'en',
                                   
                                      page: '10')
  	data.each do |data|
  		testing = Testing.new
  		testing.description = data.description
  		testing.name = data.name
  		testing.image = data.urlToImage
  		testing.link = data.url
  		testing.save!
  end

  data = n.get_everything(	
                                      sources: 'espn',
                                      domains: 'espn.go.com',
                                      from: '2018-04-01',
                                      to: '2018-04-24',
                                      language: 'en',
                                   
                                      page: '10')
  	data.each do |data|
  		testing = Testing.new
  		testing.description = data.description
  		testing.name = data.name
  		testing.image = data.urlToImage
  		testing.link = data.url
  		testing.save!
  	end

  	data = n.get_everything(	
                                      sources: 'time',
                                      domains: 'time.com',
                                      from: '2018-04-01',
                                      to: '2018-04-24',
                                      language: 'en',
                                   
                                      page: '10')
  	data.each do |data|
  		testing = Testing.new
  		testing.description = data.description
  		testing.name = data.name
  		testing.image = data.urlToImage
  		testing.link = data.url
  		testing.save!
  	end

  	data = n.get_everything(		q:'business,entertainment',
                                      sources: 'time',
                                      domains: 'time.com',
                                      from: '2018-04-01',
                                      to: '2018-04-24',
                                      language: 'en',
                                   
                                      page: '2')
  	data.each do |data|
  		testing = Testing.new
  		testing.description = data.description
  		testing.name = data.name
  		testing.image = data.urlToImage
  		testing.link = data.url
  		testing.save!
  	end


  end
end
