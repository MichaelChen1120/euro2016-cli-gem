class Euro2016::Game

  attr_accessor :name, :home_team, :away_team, :score, :goals, :channel, :report

  def initialize(name=nil, url=nil)
    @name=name
    @url=url
  end

  def self.all
    @@all = scrape_games
  end

  def self.scrape_games
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
    games=doc.css("div.score-box")
    games.css("a.primary-link").each do |game|
      puts game.attribute("href").text
    end
    binding.pry
  end



end
