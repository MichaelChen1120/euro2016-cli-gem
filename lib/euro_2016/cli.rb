class Euro2016::CLI

  def call
    puts "Euro 2016 game results"
    dates
    list_games
    menu
    goodbye
  end

  def dates
    puts "Pick a date to view games from:"
    puts ""
    Euro2016::Date.dates.each.with_index(1) do |date, i|
      puts "#{i}. #{date}"
    end
    input = gets.strip.to_i
    date = Euro2016::Date.find(input.to_i)
    print_date(date)
  end

  def list_games
    Euro2016::Game.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
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
  end

  def menu
    input = nil
    while input != "exit"
        puts "Enter the number for the details of the game"
        puts "Type back to view games again"
        puts "Type exit to exit"
      input = gets.strip.downcase
      if input == "back"
        list_games
      elsif input.to_i > 0
        game = Euro2016::Game.find(input.to_i)
          print_details(game)
      end
    end
  end

  def goodbye
    puts "Check back tomorrow for more games!"
  end

end
