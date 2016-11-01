class StatsTracker
  attr_accessor :phasing_player, :last_unit_activated
  def initialize
    @phasing_player = FRENCH
    @last_unit_activated = nil
  end
end