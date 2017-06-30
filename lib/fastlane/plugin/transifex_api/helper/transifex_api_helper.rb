module Fastlane
  module Helper
    class TransifexApiHelper
      # class methods that you define here become available in your action
      # as `Helper::TransifexApiHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the transifex_api plugin helper!")
      end
    end
  end
end
