class Euro2016::Game

  attr_accessor :name, :home_team, :away_team, :score, :goals, :channel, :report

  def self.today
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
    binding.pry
  end

  

end
