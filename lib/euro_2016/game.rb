class Euro2016::Game

  attr_accessor :name, :time, :url

  def self.today
    #need to scrape uefa.com
    #try to instantiate new games automatically based on number of games
    puts <<-DOC
      1. Ireland vs Sweden
      2. Belgium vs Italy
      DOC

      game_1=self.new
      game_1.name="Ireland vs Sweden"
      game_1.time="12:00 EST"
      game_1.url="http://www.uefa.com/uefaeuro/season=2016/matches/round=2000448/match=2017954/statistics/index.html"

      game_2=self.new
      game_2.name="Belgium vs Italy"
      game_2.time="2:45 EST"
      game_2.url="http://www.uefa.com/uefaeuro/season=2016/matches/round=2000448/match=2017953/statistics/index.html"

      [game_1, game_2]
  end

end
