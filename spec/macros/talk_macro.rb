module TalkHelper
  def receive_message(message, and_return:)
    expect(subject.receive_message(message)).to eql(and_return)
  end
end
