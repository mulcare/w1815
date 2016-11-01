require_relative 'lib/formation'
require_relative 'lib/scoreboard'
require_relative 'lib/units'
require_relative 'lib/timetrack'
require_relative 'lib/startscreen'
require_relative 'lib/player'
require_relative 'lib/die'
require 'colorize'

class Game
  def self.lose(nationality)
    nationalities = { "fr" => "French", "aa" => "Anglo-Allied"}

    puts "The #{nationalities[nationality]} forces have been completely broken and fled the battlefied. Game over.".colorize(:blue)
    puts "Play again? (Y/n)".colorize(:red)
    response = gets.chomp
    if response.empty? || response[0].downcase == "y"
      #create new game, reset everything, etc.
      puts "works"
    else
      exit(true)
    end
  end

ALLIED = Player.new("aa")
FRENCH = Player.new("fr")
PLAYERS = { "fr" => [FRENCH, "French"], "aa" => [ALLIED, "Anglo-Allied"]}


TIMETRACK = TimeTrack.new
SCOREBOARD = Scoreboard.new

# Anglo-Allied Units
ORANGE = Infantry.new("aa", "Orange", 3, 3)
HILL = Infantry.new("aa", "Hill", 5, 5)
UXBRIDGE = Cavalry.new("aa", "Uxbridge", 3, 3)
#RESERVE

BLUCHER = Infantry.new("aa", "Hill", 5, 5)

# French Units
DERLON = Infantry.new("fr", "d'Erlon", 4, 4)
REILLE = Infantry.new("fr", "Reille", 4, 4)
#LOBAU
#GUARD
#BATTERY
MILHAUD = Cavalry.new("fr", "Milahud", 2, 2)
KELLERMAN = Cavalry.new("fr", "Kellerman", 2, 2)

# Leaders
NAPOLEON = Napoleon.new
WELLINGTON = Wellington.new

$units = {
            "orange" => ORANGE,
            "hill" => HILL,
            "derlon" => DERLON,
            "reille" => REILLE
          }

$crt = {
        "Reille" => [%w(1FM 1AC),%w(1AC 2FM)],
        "d'Erlon" =>[ [#faceup CRT
                        %w(1FC 1FM),
                        %w(1AM 1FC),
                        %w(1AC 1FC),
                        %w(1AC 1FM),
                        %w(2AC 1FC),
                        %w(2AC 1AM),
                        ['La Haye Sainte captured']
                      ],
                      [#facedown CRT
                        %w(1FC 1FM),
                        %w(1AM 1FC),
                        %w(1AC 1FC),
                        %w(1AC 1FM),
                        %w(2AC 1FC),
                        %w(2AC 1AM),
                        ['La Haye Sainte captured']
                      ]  
                    ]  
      }

end




class StatsTracker
  attr_accessor :phasing_player, :last_unit_activated
  def initialize
    @phasing_player = FRENCH
    @last_unit_activated = nil
  end
end

Game.new

while true
  puts "Activate a card:"
  card = gets.chomp.downcase.delete("'")
  $units[card].attack
end
