require 'spec_helper'

describe "Room" do
  let(:token) { 'auth'}
  let(:client) { HackChat.new(token)}
  let(:room_token) { "SUPERSECRETTOKEN" }
  let(:user_token) { "@mikesilvis"}

  context "Creates new permissions" do
    it "can create new permissions" do
      response = client.create_permission(room_token, user_token)
      response.status.should == 201
    end
  end

  context "Find permissions for a room" do
    it "returns valid permissions" do
      rm = client.room_permissions(room_token)
      rm.status.should == 200
    end
  end
  context "Destroys permissions" do
    it "can destroy permission" do
      response = client.destroy_permission(room_token, user_token)
      response.status.should == 200
    end
  end
end