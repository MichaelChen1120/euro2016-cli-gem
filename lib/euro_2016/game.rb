class Euro2016::Game

  attr_accessor :name, :url, :home_team, :away_team, :score, :home_goals, :home_goal_time, :away_goals, :away_goal_time, :report

  def initialize(name=nil, url=nil)
    @name=name
    @url=url
  end

  def self.scrape_games(date)
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores?date=2016" + "#{date}"))
    games=doc.css("div.score-box")
    links=games.css("a.primary-link").collect do |game|
      game.attribute("href").text
    end
    teams=games.css("div.team-name span").collect do |team|
      team.text
    end

    new_games = teams.each_slice(2).to_a
    names = new_games.collect {|a,b| ["#{a} vs #{b}"]}
    all = names.zip links
    all.collect {|g,l| new(g.join(","),l)}
  end

  def self.all
    @@all = scrape_games(date)
  end

  def self.find(id)
    self.all[id-1]
  end

  def team_name(arg)
    string = "div[class='team " + "#{arg}" + " '] span.long-name"
    doc.css(string).text
  end

  def team_score(arg)
    string = "span[data-home-away='#{arg}']"
    doc.css(string).text.strip.gsub(/\s+/,' ')
  end

  def goals(arg)
    string = "div[data-home-away='#{arg}'] ul[data-event-type='goal'] li"
    doc.css(string).text.strip.gsub(/\s+/,' ')
  end

  def report
    @report = doc.css("div.article-body p").text.strip
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end

def self.dates
  @dates=["06/10","06/11","06/12","06/13","06/14","06/15","06/17","06/18","06/19","06/20","06/21","06/22","06/25","06/26","07/01","07/02","07/03","07/06","07/07","07/10"]
end

def self.find_by_date(id)
  @@date=self.dates[id-1].gsub("/","")
end

def self.date
  @@date
end

end
