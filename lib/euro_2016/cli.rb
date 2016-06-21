class Euro2016::CLI

  def call
    puts "Today's Euro 2016 games:"
    list_games
    menu
    goodbye
  end

  def list_games
    @games=Euro2016::Game.today
  end

  def menu
    input = nil
    while input != "exit"
        puts "Enter the number for the score of the game or type games for today's games or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @games[input.to_i-1]
      elsif input == "games"
        list_games
      else
      end
    end
  end

  def goodbye
    puts "Check back tomorrow for more games!"
  end

end
