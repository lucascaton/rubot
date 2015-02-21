RSpec.describe 'Talk' do
  subject { Robot.new }

  it 'first conversation' do
    expect(subject.send_message('hi')).to eql("Hi human, what's your name?")
  end
end
