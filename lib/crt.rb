class CRT
  attr_accessor :charts
  @charts = {
          :reille => [[
                          %w(1FM 1AC),
                          %w(1AC 2FM)
                          ]
                      ],
          :derlon => [[#faceup CRT
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
    roll = roll - 1
    face = Game::UNITS[unit] ? 0 : 1
    result = @charts[unit][face]
    result.fetch(roll, result.last)
  end
end
