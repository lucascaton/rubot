class Rubot
  REGEXS = {
    formal_greetings: [
      /\Ahi\z/
    ], introductions: [
      /\Amy name is (.+)\z/,
      /\Ahi, my name is (.+)\z/
    ]
  }

  attr_reader :name

  def initialize
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
        return "Hi #{@human_name}, nice to meet you. My name is Rubot."
      end

      "Sorry, I don't know what you mean."
    end
  end

  def human_name=(human_name)
    @human_name = human_name.split.first.capitalize
  end
end
