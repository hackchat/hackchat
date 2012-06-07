require 'spec_helper'

describe "UserRoom" do
  let(:token) { 'auth'}
  let(:client) { HackChat.new(token)}
  let(:room_token) { "SUPERSECRETTOKEN" }
  let(:user_token) { "@mikesilvis"}

  it "Verify I can view this room" do
    client.create_permission(room_token, user_token)
    response = client.has_permission?(room_token, user_token)
    response.status.should == 200
    client.destroy_permission(room_token, user_token)
  end

end