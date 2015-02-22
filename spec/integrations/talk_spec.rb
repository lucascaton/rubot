RSpec.describe 'Talk' do
  subject { Rubot.new }

  context 'starting a conversation' do
    ['.', '...', ',', ';', '!', '!?', '?!'].each do |punctuation|
      it "understands when using '#{punctuation}' in the end of the message" do
        puts "\n#{'-' * Pry::Terminal.width!}"
        receive_message "hi#{punctuation}",  and_return: "Hi human, what's your name?"
      end

      it "understands when using a space plus a '#{punctuation}' in the end of the message" do
        puts "\n#{'-' * Pry::Terminal.width!}"
        receive_message "hi #{punctuation}", and_return: "Hi human, what's your name?"
      end
    end

    it 'understands when using 1 space before the message' do
      puts "\n#{'-' * Pry::Terminal.width!}"
      receive_message " hi", and_return: "Hi human, what's your name?"
    end

    it 'understands when using more than 1 space before the message' do
      puts "\n#{'-' * Pry::Terminal.width!}"
      receive_message "   hi", and_return: "Hi human, what's your name?"
    end

    it 'understands when using 1 space after the message' do
      puts "\n#{'-' * Pry::Terminal.width!}"
      receive_message "hi ", and_return: "Hi human, what's your name?"
    end

    it 'understands when using more than 1 after before the message' do
      puts "\n#{'-' * Pry::Terminal.width!}"
      receive_message "hi   ", and_return: "Hi human, what's your name?"
    end

    context 'when introducing' do
      [
        'lucas',
        'my name is lucas',
        'hi, my name is lucas',
      ].each do |introducing_message|
        context "with '#{introducing_message}'" do
          it 'learns human name, replying with captalized name' do
            puts "\n#{'-' * Pry::Terminal.width!}"
            receive_message 'hi', and_return: "Hi human, what's your name?"
            receive_message introducing_message, and_return: "Hi Lucas, nice to meet you. My name is Rubot."
          end
        end
      end

      it 'learns only first human name' do
        puts "\n#{'-' * Pry::Terminal.width!}"

        receive_message 'hi', and_return: "Hi human, what's your name?"
        receive_message 'lucas caton', and_return: "Hi Lucas, nice to meet you. My name is Rubot."
      end
    end
  end

  context 'when the message does not make sense' do
    it 'replies correctly' do
      puts "\n#{'-' * Pry::Terminal.width!}"

      receive_message 'foobar', and_return: "Sorry, I don't know what you mean."
    end
  end
end
