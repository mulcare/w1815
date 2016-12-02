require_relative 'lib/formation'
require_relative 'lib/scoreboard'
require_relative 'lib/units'
require_relative 'lib/timetrack'
require_relative 'lib/startscreen'
require_relative 'lib/player'
require_relative 'lib/die'
require_relative 'lib/statstracker'
require_relative 'lib/crt.rb'

require 'colorize'

class Game
  def self.lose(nationality)
    nationalities = { 'fr' => 'French', 'aa' => 'Anglo-Allied'}

    puts "The #{nationalities[nationality]} forces have been completely broken and fled the battlefied. Game over.".colorize(:blue)
    puts 'Play again? (Y/n)'.colorize(:red)
    response = gets.chomp
    if response.empty? || response[0].downcase == 'y'
      #create new game, reset everything, etc.
      puts 'works'
    else
      exit(true)
    end
  end

  ALLIED = Player.new('aa')
  FRENCH = Player.new('fr')
  PLAYERS = { 'fr' => [FRENCH, 'French'], 'aa' => [ALLIED, 'Anglo-Allied']}


  TIMETRACK = TimeTrack.new
  STATSTRACKER = StatsTracker.new
  SCOREBOARD = Scoreboard.new

  # Anglo-Allied Units
  ORANGE = Infantry.new('aa', 'Orange', 3, 3)
  HILL = Infantry.new('aa', 'Hill', 5, 5)
  UXBRIDGE = Cavalry.new('aa', 'Uxbridge', 3, 3)
  BLUCHER = Infantry.new('aa', 'Hill', 5, 5)
  #RESERVE = Reserve.new


  # French Units
  DERLON = Infantry.new('fr', "d'Erlon", 4, 4)
  REILLE = Infantry.new('fr', 'Reille', 4, 4)
  #LOBAU = Infantry.new('fr', 'Lobau', 3, 3)
  #GUARD = Infantry.new('fr', 'Guard', 4, 4)
  #BATTERY = Infantry.new('fr', 'Grand Battery', 3, 3)
  MILHAUD = Cavalry.new('fr', 'Milhaud', 2, 2)
  KELLERMANN = Cavalry.new('fr', 'Kellerman', 2, 2)

  # Leaders
  NAPOLEON = Napoleon.new
  WELLINGTON = Wellington.new

  UNITS = {
              orange: ORANGE,
              hill: HILL,
              derlon: DERLON,
              reille: REILLE
            }
end

Game.new

while true
  puts 'Activate a card:'
  card = gets.chomp.downcase.delete("'").to_sym
  Game::UNITS[card].activate
end
