require 'spec_helper'

RSpec.describe ZaloAPI::OA do
  it "has a version number" do
    expect(ZaloAPI::VERSION).not_to be nil
  end

  let(:access_token) { 'please change me' }
  let(:client) { ZaloAPI::Client.new { |x| x.access_token = access_token } }
  let(:user_id) { '1948744173644913256' }

  context '#get_user_profile' do
    subject { ZaloAPI::OA.new(client).get_user_profile(user_id) }

    it { expect(subject).to be_truthy }
    it { expect(subject.body.dig(:data, :user_id)).to eq(user_id) }
  end

  context '#send_text_message' do
    let(:message) { '[ZaloAPI] Hello world!' }

    subject { ZaloAPI::OA.new(client).send_text_message(user_id, message) }

    it { expect(subject).to be_truthy }
  end
end
