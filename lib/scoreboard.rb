 class Scoreboard
  def display
    puts ".--------------------------------------------------------------------------.
| Anglo-Allied Forces  |  French Forces             |  Locations           |
|----------------------|----------------------------|----------------------|
| Reserves:  4 of 4    |  Grand Battery:  3 of 3    |  Hougoumont:      AA |
| Hill:      #{HILL.strength} of #{HILL.capacity}    |  d'Erlon:        #{DERLON.strength} of #{DERLON.capacity}    |  La Haye Sainte:  FR |
| Orange:    #{ORANGE.strength} of #{ORANGE.capacity}    |  Reille:         #{REILLE.strength} of #{REILLE.capacity}    |  Plancenoit:      FR |
| Uxbridge:  3 of 3    |  Guard:          3 of 3    |----------------------|"

  puts "|----------------------|  Kellerman:      2 of 2    |  Wellington: " + WELLINGTON.status.ljust(6) + "  |"
  puts "| Prussian Forces      |  Milhaud:        2 of 2    |  Napoleon: " + NAPOLEON.status.ljust(6)  + "    |"

  puts "|----------------------|  Lobau:          3 of 3    |----------------------|"
  puts "| Blucher:   0 of 6    |                            |  Time: " + TIMETRACK.status.ljust(9) + " +" + TIMETRACK.dr_mod.to_s + "  |"
  puts "|----------------------'----------------------------'----------------------|
| AM: [10] [9] [8] [7] [6] [5] [4] [3 ] [2] [1] [B]                        |
| AC: [  ] [  ] [  ] [RT] [RT] [RT] [RT] [RT] [RT] [RT] [B]                |
|--------------------------------------------------------------------------|
| FM: [10] [9] [8] [7] [6] [5] [4] [3 ] [2] [1] [B]                        |
| FC: [  ] [  ] [  ] [  ] [RT] [RT] [RT] [RT] [+1] [+1] [+2] [+2] [B]      |
'--------------------------------------------------------------------------'""
  end
end
