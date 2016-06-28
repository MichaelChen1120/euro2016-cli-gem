class Euro2016::Game

  attr_accessor :name, :url, :home_team, :away_team, :score, :home_goals, :home_goal_time, :away_goals, :away_goal_time, :report

  def initialize(name=nil, url=nil)
    @name=name
    @url=url
  end

  def self.scrape_games
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
    games=doc.css("div.score-box")
    links=games.css("a.primary-link").collect do |game|
      game.attribute("href").text
    end
    teams=games.css("div.team-name span").collect do |team|
      team.text
    end
    t=Array.new
    urls=Array.new
    @game_1 = "#{teams[0]} vs #{teams[1]}"
    @game_2 = "#{teams[2]} vs #{teams[3]}"
    @game_3 = "#{teams[4]} vs #{teams[5]}"
    @game_4 = "#{teams[6]} vs #{teams[7]}"
    @link_1 = "#{links[0]}"
    @link_2 = "#{links[1]}"
    @link_3 = "#{links[2]}"
    @link_4 = "#{links[3]}"
    t_1 = [@game_1,@link_1]
    t_2 = [@game_2,@link_2]
    t_3 = [@game_3,@link_3]
    t_4 = [@game_4,@link_4]
    all = [t_1,t_2,t_3,t_4]
    all.collect {|g,l| new(g,l)}
  end

  def self.all
    @@all ||= scrape_games
  end

  def self.find(id)
    self.all[id-1]
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
