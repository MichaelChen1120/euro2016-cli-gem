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
    @game_1 = "#{teams[0]} vs #{teams[1]}"
    @game_2 = "#{teams[2]} vs #{teams[3]}"
    @game_3 = "#{teams[4]} vs #{teams[5]}"
    @game_4 = "#{teams[6]} vs #{teams[7]}"
    @link_1 = "#{links[0]}"
    @link_2 = "#{links[1]}"
    @link_3 = "#{links[2]}"
    @link_4 = "#{links[3]}"
    all=Array.new
    t_1 = [@game_1,@link_1]
    all << t_1
    if @link_2 != ""
    t_2 = [@game_2,@link_2]
    all << t_2
    end
    if @link_3 != ""
    t_3 = [@game_3,@link_3]
    all << t_3
    end
    if @link_4 != ""
    t_4 = [@game_4,@link_4]
    all << t_4
    end
    all.collect {|g,l| new(g,l)}
  end

  def self.all
    @@all = scrape_games
  end

  def self.find(id)
    self.all[id-1]
  end

  def home_team_name
    @home_team_name = doc.css("div[class='team away '] span.long-name").text
  end

  def away_team_name
    @away_team_name = doc.css("div[class='team home '] span.long-name").text
  end

  def home_team_score
    @home_team_score = doc.css("span[data-home-away='home']").text.strip.gsub(/\s+/,' ')
  end

  def away_team_score
    @away_team_score = doc.css("span[data-home-away='away']").text.strip.gsub(/\s+/,' ')
  end

  def home_goals
    @home_goals = doc.css("div[data-home-away='home'] ul[data-event-type='goal'] li").text.strip.gsub(/\s+/,' ')
  end

  def away_goals
    @away_goals = doc.css("div[data-home-away='away'] ul[data-event-type='goal'] li").text.strip.gsub(/\s+/,' ')
  end

  def home_goal_time
    @home_goal_time = doc.css("div[data-home-away='home'] ul[data-event-type='goal'] span").text
  end

  def away_goal_time
    @away_goal_time = doc.css("div[data-home-away='away'] ul[data-event-type='goal'] span").text
  end

  def report
    @report = doc.css("div.article-body p").text.strip
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end

end
