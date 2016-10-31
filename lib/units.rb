class Unit
  attr_accessor :strength
  attr_reader :capacity
  attr_reader :name
  attr_reader :nationality

  def initialize(nationality, name, strength, capacity)
      @nationality = nationality
      @name = name
      @strength = strength
      @capacity = capacity
      @square = false
      @shattered = false
      @faceup = true
  end

  # Roll a die, add any applicable modifiers, and find the result on the
  # attacking unit's combat result table. Generally, results are either
  # morale losses or casualties on either the unit attack or its target.
  def attack
    roll = Die.new.roll
    # Second selector is faceup (0) or facedown (1) status, each of which
    # has its own results table for most cards.
    $crt[name][0].fetch(roll,$crt[name][0].max).each do |action|
      # Handle morale loss results.
      if action[-1] == 'M'
        if action[-2] == 'F'
          FRENCH.morale_loss(action[-3].to_i)
        else
          ALLIED.morale_loss(action[-3].to_i)
        end
      # Handle casualty results.
      elsif action[-1] == 'C'
        if action[-2] == 'F'
          if @nationality == 'fr'
            casualty(action[0].to_i)
          else
            puts 'casualty on enemy'
          end
        else 
          if @nationality == 'ac'
            puts 'casualty on self'
          else
            puts 'Casualty on enemy'
          end
        end
      end
    end
  end

  # Lose strength, down to zero, then apply remaining casualties to the
  # strength total of other avilable units.
  def casualty(casualties)
    if casualties <= @strength
      @strength = @strength - casualties
      puts "#{@name} suffers casualties. Current strength is #{@strength}/#{@capacity}.".colorize(:light_red)
      if @strength == 0
        if @shattered == true
          puts "#{@name} is shattered and cannot take more casualties.".colorize(:light_red)
        else
          PLAYERS[@nationality][0].morale_loss(1)
          @shattered = true
          puts "#{@name} has shattered. Unit can no longer attack and any losses will apply to other units. Army takes a morale loss.".colorize(:light_red)
        end
      end
    else
      casualties = casualties - @strength
      casualty(@strength)
      puts "#{casualties} casualties need to be applied to another unit. Please select a unit. Available units:".colorize(:light_red)
      $units.each do |key, unit|
        # Only display units that have strength available to lose.
        if unit.strength > 0
          if unit.nationality == @nationality
            puts "#{unit.name} (Current strength: #{unit.strength}/#{unit.capacity})".colorize(:yellow)
          end
        end
      end
    target = gets.chomp.downcase.delete("'")
    $units[target].casualty(casualties)
    end
  end

  def faceup?
    @faceup
  end

end

class Infantry < Unit
  include Formation
  def max_pd
    return 5
  end
end

class Cavalry < Unit
end

class Leader
    attr_accessor :status
    def initialize
      @status = 'unused'
    end
  
    def flip
      @status = 'used'
    end
end

class Napoleon < Leader
end

class Wellington < Leader
end