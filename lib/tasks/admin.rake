namespace :admin do
    desc "Adding api data to our test database table"
task data: :environment do
  n = News.new("e9a7bf1016d247af9980045693f8f46b")

  sources = [
    {q: 'business', sources: 'bbc-news', domains: 'bbc.co.uk'},
    {q: 'business', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'entertainment', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'general', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'health', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'science', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'sports', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'technology', sources: 'the-new-york-times', domains: 'nytimes.com'},
    {q: 'entertainment', sources: 'bbc-news', domains: 'bbc.co.uk'},
    {q: 'general', sources: 'bbc-news', domains: 'bbc.co.uk'},
    {q: 'health', sources: 'bbc-news', domains: 'bbc.co.uk'},
    {q: 'science', sources: 'bbc-news', domains: 'bbc.co.uk'},
    {q: 'sport', sources: 'bbc-news', domains: 'bbc.co.uk'},
  ]

sources.each do |source|
  data = n.get_everything(
    q: source[:q],
    sources: source[:sources],
    domains: source[:domains],
    from: '2018-04-10',
    to: '2018-05-05',
    language: 'en',
    page: '10'
  )

  data.each do |data|
      if Article.exists?(:description => data.description)
      else
        Article.create(
           description: data.description,
           name:        data.name,
           image:       data.urlToImage,
           link:       data.url,
           category:    source[:q],
        )
      end
  end
end
end
end
