require 'zalo_api/resource'

module ZaloAPI
  # API for Offical Account
  class OA < Resource
    # Get Offical Account profile
    def me
      @client.connection.get "#{base_url}/oa/getoa"
    end

    # Get a list of followers
    #
    # @param [Integer] offset Start position in the list of people followers
    # @param [Integer] count Number of follower people want to take
    # @return [Faraday::Response] List user_id
    #
    # @example
    #   res = ZaloAPI::OA.new(client).followers
    #   res.body
    #   {
    #     "error": int,
    #     "message": String,
    #     "data": {
    #       "total": int,
    #       "followers": [
    #         {
    #           "user_id": String
    #         },...
    #       ]
    #     }
    #   }
    def followers(offset = 0, count =  5)
      param = { offset: offset, count: count }
      @client.connection.get "#{base_url}/oa/getfollowers", { data: param.to_json }
    end

    # Get a list of the most recent messages
    def recent_chat(offset = 0, count =  5)
      param = { offset: offset, count: count }
      @client.connection.get "#{base_url}/oa/listrecentchat", { data: param.to_json }
    end

    # Get profile of follower
    #
    # @param [String] user_id Support user_id or phone with country code (ex: 84)
    # @example
    #   conn.get_user_profile('84123456789')
    #   {
    #     "error": int,
    #     "message": String,
    #     "data": {
    #         "user_gender": int,
    #         "user_id": Long,
    #         "user_id_by_app": Long,
    #         "avatar": String,
    #         "avatars": {
    #             "120": String,
    #             "240": String
    #         },
    #         "display_name": String,
    #         "birth_date": int,
    #         "shared_info": String,
    #         "tags_and_notes_info": {
    #             "tag_names": Array,
    #             "notes": Array
    #         }
    #     }
    #   }
    def get_user_profile(user_id)
      @client.connection.get "#{base_url}/oa/getprofile", { data: { user_id: user_id }.to_json }
    end

    # Get a list of messages with interested people
    #
    # @param [String] user_id
    # @param [Integer] offset
    # @param [Integer] count
    # @return [Faraday::Response]
    #
    # @example
    #   res = conn.get_conversation_with_user('2512523625412515')
    #   res.body
    #   {
    #     "error": int,
    #     "message": String,
    #     "data": [
    #       {
    #         "msg_id": String,
    #         "src": int,
    #         "time": int,
    #         "type": String,
    #         "message": String,
    #         "links": JsonObject,
    #         "thumb": String,
    #         "url": String,
    #         "description": String,
    #         "from_id": Long,
    #         "to_id": Long,
    #         "from_display_name": "Huỳnh Hồng Hiển",
    #         "from_avatar": String,
    #         "to_display_name": String,
    #         "to_avatar": String,
    #         "location": String
    #       },...
    #     ]
    #   }
    def get_conversation_with_user(user_id, offset = 0, count = 5)
      param = { user_id: user_id, offset: offset, count: count }
      @client.connection.get "#{base_url}/oa/conversation", { data: param.to_json }
    end
  end
end
