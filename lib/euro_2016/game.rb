class Euro2016::Game

  attr_accessor :name, :home_team, :away_team, :score, :goals, :channel, :report

  def initialize(name=nil, url=nil)
    @name=name
    @url=url
  end

  def self.scrape_games
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
    games=doc.css("div.score-box")
    urls=games.css("a.primary-link").collect do |game|
      game.attribute("href").text
    end
    names=games.css("div.team-name span").collect do |name|
      name.text
    end
    @all=Array.new
    @game_1 = "#{names[0]} vs #{names[1]} - #{urls[0]}"
    @game_2 = "#{names[2]} vs #{names[3]} - #{urls[1]}"
    @game_3 = "#{names[4]} vs #{names[5]} - #{urls[2]}"
    @game_4 = "#{names[6]} vs #{names[7]} - #{urls[3]}"
    @all << @game_1
    @all << @game_2
    @all << @game_3
    @all << @game_4
    @all
  end

  def self.all
    scrape_games
  end



end
