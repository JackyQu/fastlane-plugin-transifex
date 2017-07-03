module Fastlane
  module Actions
    class TransifexAction < Action
      def self.run(params)
        require 'json'
        require 'net/http'

        user_name = params[:user_name].shellescape
        password = params[:password].shellescape
        project = params[:project].shellescape
        resource = params[:resource].shellescape

        url = "https://www.transifex.com/api/2/project/#{project}/resource/#{resource}/stats/"
        url = url +  params[:lang_code].shellescape if params[:lang_code]

        uri = URI.parse(url)
        request = Net::HTTP::Get.new(uri)
        request.basic_auth(user_name, password)

        req_options = {
          use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end

        UI.message(response.body)

        JSON.parse(response.body)

      end

      def self.description
        "basic transifex wrapper"
      end

      def self.authors
        ["junjie"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "basic transifex wrapper "
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :user_name,
                                  env_name: "TRANSIFEX_API_USER_NAME",
                               description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :password,
                                  env_name: "TRANSIFEX_API_PASSWORD",
                               description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :project,
                                  env_name: "TRANSIFEX_API_PROJECT",
                               description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :resource,
                                  env_name: "TRANSIFEX_API_PROJECT",
                               description: "A description of your option",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :lang_code,
                                  env_name: "TRANSIFEX_API_LANGUAGE_CODE",
                               description: "A description of your option",
                                  optional: true,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac, :android].include?(platform)
      end
    end
  end
end
