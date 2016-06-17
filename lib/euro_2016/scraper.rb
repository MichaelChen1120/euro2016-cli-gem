class Euro2016::Scraper

  def get_page
    doc=Nokogiri::HTML(open("http://www.espnfc.us/european-championship/74/scores"))
  end

  def scrape_games
    self.get_page.css("")
  end

  def make_games
    scrape_games.each do |game|
      
    end
  end

end
