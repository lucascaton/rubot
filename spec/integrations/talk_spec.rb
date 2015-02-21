RSpec.describe 'Talk' do
  subject { Robot.new }

  context 'starting a conversation' do
    ['.', '...', ',', ';', '!', '!?', '?!'].each do |punctuation|
      it "understand when using '#{punctuation}' in the end of the sentence" do
        receive_message "hi#{punctuation}",  and_return: "Hi human, what's your name?"
      end

      it "understand when using a space plus a '#{punctuation}' in the end of the sentence" do
        receive_message "hi #{punctuation}", and_return: "Hi human, what's your name?"
      end
    end

    context 'when introducing' do
      [
        'lucas',
        'my name is lucas',
        'hi, my name is lucas',
      ].each do |introducing_message|
        context "with '#{introducing_message}'" do
          it 'learns human name, replying with captalized name' do
            receive_message 'hi', and_return: "Hi human, what's your name?"
            receive_message introducing_message, and_return: "Hi Lucas, nice to meet you. My name is Rubot."
          end
        end
      end

      it 'learns only first human name' do
        receive_message 'hi', and_return: "Hi human, what's your name?"
        receive_message 'lucas caton', and_return: "Hi Lucas, nice to meet you. My name is Rubot."
      end
    end
  end

  context 'when the message does not make sense' do
    it 'replies correctly' do
      receive_message 'foobar', and_return: "Sorry, I don't know what you mean."
    end
  end
end
