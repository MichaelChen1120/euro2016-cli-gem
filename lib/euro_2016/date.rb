class Euro2016::Date
  attr_accessor :day, :url

  def initialize(day=nil, url=nil)
    @day=day
    @url=url
  end

  def self.dates
    @all=["06/10","06/11","06/12","06/13","06/14","06/15","06/17","06/18","06/19","06/20","06/21","06/22","06/25","06/26","07/01","07/02","07/03","07/06","07/07","07/10"]
  end

  def self.find(id)
    self.dates[id-1]
  end
end
