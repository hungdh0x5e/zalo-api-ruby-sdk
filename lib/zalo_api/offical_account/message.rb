module ZaloAPI::OfficalAccount
  module Message
    # Send message to user_id
    # @param [String] user_id
    def send_text_message(user_id, message)
      recipient = { user_id: user_id }
      message = { text: message }
      payload = {
        recipient: recipient,
        message: message
      }

      @client.connection.post "#{base_url}/oa/message", payload
    end
  end
end
