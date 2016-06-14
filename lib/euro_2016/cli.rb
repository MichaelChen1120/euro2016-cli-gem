class Euro2016::CLI

  def call
    puts "Today's Euro 2016 games"
    list_games
    menu
    goodbye
  end

  def list_games
    @games = Euro2016::Game.today
  end

  def menu
    puts "Enter the number for the score of the game or type game for today's games or type exit"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "1-1"
      when "2"
        puts "0-2"
      when "games"
        list_games
      else
        puts "Type games or exit"
      end
    end
  end

  def goodbye
    puts "Check back tomorrow for more games!"
  end

end
