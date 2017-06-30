module Fastlane
  module Helper
    class TransifexHelper
      # class methods that you define here become available in your action
      # as `Helper::TransifexHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the transifex plugin helper!")
      end
    end
  end
end
