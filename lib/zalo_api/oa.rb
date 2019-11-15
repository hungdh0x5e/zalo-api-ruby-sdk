require 'zalo_api/resource'
require 'zalo_api/offical_account/information'
require 'zalo_api/offical_account/message'

module ZaloAPI
  # API for Offical Account
  class OA < Resource
    include ZaloAPI::OfficalAccount::Information
    include ZaloAPI::OfficalAccount::Message
  end
end
