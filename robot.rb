class Robot
  NAMES = ['Sonny', 'Mokobot', 'Rubber', 'Scrappy', 'Copper', 'Tinker', 'Isetx', 'Grezzer', 'Combot',
    'Cyd', 'Adeoid', 'Evix', 'Spencer']

  REGEXS = {
    formal_greetings: [
      /\Ahi\z/
    ], introductions: [
      /\Amy name is (.+)\z/,
      /\Ahi, my name is (.+)\z/
    ]

    # informal_greeting: []
    # bogan_greeting:    []
  }

  attr_reader :name

  def initialize
    @name = NAMES.sample

    @talked_subjects = {
      greeting:         false,
      how_are_you:      false,
      waiting_for_name: false
    }

    def receive_message(message)
      message = message
        .gsub(/\t|\n/, '')
        .gsub(/(\.\.?{2}|,|;|\??!|!\?)\z/, '')
        .gsub(/ +/, ' ').strip

      [REGEXS[:formal_greetings]].flatten.each do |regex|
        if message.match(regex)
          @talked_subjects[:waiting_for_name] = true
          return "Hi human, what's your name?"
        end
      end

      if @talked_subjects[:waiting_for_name]
        REGEXS[:introductions].each do |regex|
          if match = message.match(regex)
            self.human_name = match.captures.first
          end
        end

        self.human_name = message unless @human_name
        return "Hi #{@human_name}, nice to meet you."
      end

      "Sorry, I don't know what you mean."
    end
  end

  def human_name=(human_name)
    @human_name = human_name.split.first.capitalize
  end
end
