describe Fastlane::Actions::TransifexAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The transifex plugin is working!")

      Fastlane::Actions::TransifexAction.run(nil)
    end
  end
end
