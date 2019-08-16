require 'faraday'

module Fastlane
  module Actions

    class PostToGoogleChatAction < Action
      def self.run(options)
        response = Faraday.post(options[:webhook_url], "{\"text\": \"#{options[:message]}\"}", "Content-Type" => "application/json")
        if response.status == 200
          UI.success("Successfully posted message to Google Chat")
        else
          UI.error("Failed to post to Google Chat. Response code: #{response.status} | Response body: #{response.body}")
        end
      end

      def self.description
        "Posts a message into Google Chat"
      end

      def self.is_supported?(platform)
        true
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :webhook_url,
                                       description: "Google Chat Webhook url (generated via `Configure webhooks`)",
                                       verify_block: proc do |value|
                                          UI.user_error!("You must provide a webhook_url in order to post_to_google_chat, pass using `webhook_url: 'url'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :message,
                                       description: "The message you want to post into Google Chat",
                                       verify_block: proc do |value|
                                          UI.user_error!("You must provide a message for post_to_google_chat, pass using `message: 'my message'`") unless (value and not value.empty?)
                                       end)
        ]
      end

    end
  end
end
