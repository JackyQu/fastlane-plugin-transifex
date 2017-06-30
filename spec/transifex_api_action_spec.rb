describe Fastlane::Actions::TransifexApiAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The transifex_api plugin is working!")

      Fastlane::Actions::TransifexApiAction.run(nil)
    end
  end
end
