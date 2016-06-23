class Euro2016::Game

  attr_accessor :name, :home_team, :away_team, :score, :home_goals, :home_goal_time, :away_goals, :away_goal_time, :report

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

  def self.find(id)
    self.all(id-1)
  end

  def home_team
    @home_team ||= doc.css("span[data-home-away='home']").text
  end

  def away_team
    @away_team ||= doc.css("span[data-home-away='away']").text
  end

  def home_goals
    @home_goals ||= doc.css("div[data-home-away='home'] ul[data-event-type='goal'] li").text
  end

  def away_goals
    @away_goals ||= doc.css("div[data-home-away='away'] ul[data-event-type='goal'] li").text
  end

  def home_goal_time
    @home_goal_time ||= doc.css("div[data-home-away='home'] ul[data-event-type='goal'] span").text
  end

  def away_goal_time
    @away_goal_time ||= doc.css("div[data-home-away='away'] ul[data-event-type='goal'] span").text
  end

  def report
    @report ||= doc.css("div.article-body p").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end



end
