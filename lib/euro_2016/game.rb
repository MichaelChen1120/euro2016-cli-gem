class Euro2016::Game

  attr_accessor :name, :home_team, :away_team, :score, :goals, :channel, :report

  def self.today
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
    binding.pry
  end

  def get_page
    Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
  end

  def scrape_games
    doc=get_page.css("div.scores")
    games=doc.search("div.score-content")
    games.collect do |game|
      game.css("a").attribute("href").text
    end
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
