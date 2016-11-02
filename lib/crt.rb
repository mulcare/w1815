class CRT
  @charts = {
          :reille => [[%w(1FM 1AC),%w(1AC 2FM)]],
          :derlon =>[ [#faceup CRT
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

  def self.result(unit, roll)
    if Game::UNITS[unit].faceup?
      face = 0
    else
      face = 1
    end
    result = @charts[unit][face]
    actions = result.fetch(roll, result.max)
    return actions
  end
end
