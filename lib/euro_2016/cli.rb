class Euro2016::CLI

  def call
    puts "Euro 2016 game results"
    start
  end

  def start
    puts "Pick a date to view games from:"
    puts ""
    print_dates
    view_games
    list_games
    games
  end

  def view_games
    input=gets.strip
    date = Euro2016::Game.find_by_date(input.to_i).gsub("/","")
    Euro2016::Game.scrape_games(date)
  end

  def list_games
    Euro2016::Game.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end
  end

  def print_dates
    Euro2016::Game.dates.each.with_index(1) do |date, i|
      puts "#{i}. #{date}"
    end
  end

  def print_details(game)
    puts "Score"
    puts ""
    puts "#{game.home_team_name}: #{game.home_team_score}"
    puts "#{game.away_team_name}: #{game.away_team_score}"
    puts ""
    puts "Goals"
    puts ""
    puts "#{game.home_team_name}: #{game.home_goals}"
    puts "#{game.away_team_name}: #{game.away_goals}"
    puts ""
    puts "Report"
    puts ""
    puts "#{game.report}"
    puts ""
    puts "Would you like to see another game? Enter Y/N"
    input=gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      goodbye
      exit
    end
  end

  def games
    puts "Enter the number for the details of the game"
    input=gets.strip.downcase
    game = Euro2016::Game.find(input.to_i)
    print_details(game)
  end

  def goodbye
    puts "Check back tomorrow for more games!"
  end

end
