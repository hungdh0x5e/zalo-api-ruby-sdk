module ZaloAPI::OfficalAccount
  module Message
    # Send message to user_id
    # @param [String] user_id
    # @param [String] message
    def send_text_message(user_id, message)
      execute(user_id, message)
    end

    private

    def execute(user_id, text, attachment = {})
      payload = {
        recipient: { user_id: user_id },
        message: {
          text: text,
          attachment: attachment
        }
      }

      @client.connection.post "#{base_url}/oa/message", payload
    end
  end
end
