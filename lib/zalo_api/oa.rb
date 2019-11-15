require 'zalo_api/resource'

module ZaloAPI
  # API for Offical Account
  class OA < Resource
    # Get Offical Account profile
    def me
      @client.connection.get "#{base_url}/oa/getoa"
    end

    # Get a list of followers
    # @param [Integer] offset Start position in the list of people followers
    # @param [Integer] count Number of follower people want to take
    # @return [Hash] List user_id
    # {
    # "error": int,
    # "message": String,
    # "data": {
    #   "total": int,
    #   "followers": [
    #     {
    #       "user_id": String
    #     },...
    #   ]
    # }
    # }
    def followers(offset: 0, count: 5)
      @client.connection.get "#{base_url}/oa/getfollowers", { data: { offset: offset, count: count }.to_json }
    end
  end
end
