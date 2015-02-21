class Robot
  NAMES = ['Sonny', 'Mokobot', 'Rubber', 'Scrappy', 'Copper', 'Tinker', 'Isetx', 'Grezzer', 'Combot',
    'Cyd', 'Adeoid', 'Evix', 'Spencer']

  FORMAL_GREETINGS = [
    /hi/
  ]

  # INFORMAL_GREETING_REGEXS = []
  # BOGAN_GREETING_REGEXS    = []

  attr_reader :name

  def initialize
    @name = NAMES.sample

    @talked_subjects = {
      greeting:         false,
      how_are_you:      false,
      waiting_for_name: false
    }

    def receive_message(message)
      [FORMAL_GREETINGS].flatten.each do |regex|
        if message.match(regex)
          @talked_subjects[:waiting_for_name] = true
          return "Hi human, what's your name?"
        end
      end

      "Sorry, I don't know what you mean."
    end
  end
end
