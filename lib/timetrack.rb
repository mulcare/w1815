class TimeTrack
  attr_reader :status, :dr_mod
  
  def initialize
    @time = %w(Morning Afternoon Evening)
    @status = @time[0]
  end

  def advance
    if @time.index(@status) < 2
      @status = @time[@time.index(@status) + 1]
      puts @status
    end
  end

  def dr_mod
    @dr_mod = @time.index(@status)
  end
end
