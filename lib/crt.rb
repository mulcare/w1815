class CRT
  attr_reader :charts
  @charts = {
          :reille => [[
                          %w(1FC),
                          %w(1AC 1FC),
                          %w(1AC 1FC),
                          %w(1AC),
                          ['1FC', 'Hougoumont captured'],
                          ['Hougoumont captured']
                        ],
                        [
                          %w(1FC),
                          %w(1AC 1FC),
                          %w(1AC 1FC),
                          %w(1AC),
                          %w(2AC 1FC),
                          %w(1AM 2AC)
                        ]
                      ],
          :derlon => [[#faceup CRT
                          %w(1FM 1FC),
                          %w(1AM 1FC),
                          %w(1AC 1FC),
                          %w(1AC 1FM),
                          %w(2AC 1FC),
                          %w(2AM 1AC),
                          ['La Haye Sainte captured']
                        ],
                        [#facedown CRT
                          %w(1AM 1FM),
                          %w(1AM 1FC),
                          %w(1AC),
                          %w(1AC),
                          %w(2AC 1FC),
                          %w(1AM 2AC)
                        ]
                      ],
            :orange => [[
                          %w(1FM 1AM),
                          %w(1FM 1AC),
                          %w(1FC 1AC),
                          %w(1FC 1AM),
                          %w(1FC 1AM),
                          %w(2FC 1AC)
                        ],
                        [
                          %(Redeploy to line)
                        ]
                      ],
            :hill => [[
                          %w(1FM 1AM),
                          %w(1FM 1AC),
                          %w(1FC 1AC),
                          %w(1FC 1AM),
                          %w(1FC 1AM),
                          %w(2FC 1AC)
                        ],
                        [
                          %(Redeploy to line)
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
