RSpec.describe 'Talk' do
  subject { Robot.new }

  it 'basic conversation' do
    receive_message 'hi', and_return: "Hi human, what's your name?"
  end

  it 'no sense conversation' do
    receive_message 'foobar', and_return: "Sorry, I don't know what you mean."
  end
end
