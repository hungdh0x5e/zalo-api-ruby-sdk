RSpec.describe ZaloAPI::Client do
  subject { client }

  context "#initialize" do
    it "should require a block" do
      expect { ZaloAPI::Client.new }.to raise_error(ArgumentError)
    end

    context "access token" do
      subject do
        ZaloAPI::Client.new do |config|
          config.access_token = "hello"
        end
      end

      it "should not build basic auth middleware" do
        expect(subject.connection.builder.handlers.index(Faraday::Request::BasicAuthentication)).to be_nil
      end

      it "should build based access token middleware" do
        expect(subject.connection.builder.handlers.index(ZaloAPI::Middleware::Request::UrlBasedAccessToken)).not_to be_nil
      end
    end
  end
end
