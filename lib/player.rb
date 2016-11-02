class Player
  attr_reader :nationality
  attr_reader :casualties
  attr_reader :morale
  def initialize(nationality)
    @nationality = nationality
    @morale = 10

    if @nationality == 'fr'
      @casualties = 12
    else
      @casualties = 10
    end
  end

  # Morale counts down from 10 to 0. When it reaches 0, that player loses.
  def morale_loss(x)
    @morale = @morale - x
    puts "#{Game::PLAYERS[@nationality][1]} morale loss of #{x}. Current morale: #{@morale}".colorize(:red)
    if @morale <= 0
      Game.lose(@nationality)
    end
  end

  # Players make rout checks, sometimes with modifiers, after a certain
  # number of casualties. If they fail the rout check by rolling higher
  # than their current morale on a d6, they immediately lose the game.
  def rout_test
    # Two possible external mods to the rout test: 1) Blucher has brought
    # in at least 5 Prussian units at some point during the game; 2) The
    # Time Track marker has advanced forward (+1 for Afternoon, +2 for
    # Evening
    mods = 0
    if BLUCHER.max_pd >= 5
      mods = 1
    end
    mods = mods + TIMETRACK.dr_mod
    roll = Die.new.roll + mods

    puts "#{Game::PLAYERS[@nationality][1]} rout test. Need to roll a #{@morale} (current morale) or below. Rolling...".colorize(:red)
    puts "Player rolls a #{roll}.".colorize(:red)
    if roll  > @morale
      Game.lose(@nationality)
    else
      puts roll + mods
      puts "Rout check passed. The #{@nationality} continue to fight!".colorize(:red)
    end
  end
end
