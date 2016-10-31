module Formation
  def square
    if @nationality == 'aa'
      if @square == false
        @square = true
        puts 'Infantry unit has changed to square formation.'
      else
        puts 'Unit is already in square formation.'
      end
    else
      puts 'Only Anglo-Allied infantry units (Orange, Hill) can be in square formation.'
    end
  end

  def line
    if @square == true
      @square = false
      puts 'Infantry unit has returned to line formation.'
    else
      puts 'Unit is already in line formation.'
    end
  end
end