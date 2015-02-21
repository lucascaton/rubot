class Robot
  NAMES = ['Sonny', 'Mokobot', 'Rubber', 'Scrappy', 'Copper', 'Tinker', 'Isetx', 'Grezzer', 'Combot',
    'Cyd', 'Adeoid', 'Evix', 'Spencer']

  FORMAL_GREETING_REGEXS = [
    /hi/
  ]

  # INFORMAL_GREETING_REGEXS = []
  # BOGAN_GREETING_REGEXS    = []

  attr_reader :name

  def initialize
    @name = NAMES.sample

    @talked_subjects = {
      greeting:    false,
      how_are_you: false
    }

    def send_message(message)
      [FORMAL_GREETING_REGEXS].each do |regex|
        break "Hi human, what's your name?" if message.match(message)
      end
    end
  end
end
