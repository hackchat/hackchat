require 'spec_helper'

describe "User" do
  let(:token) { 'awesome_token'}
  let(:client) { HackChat.new(token)}

  context "Finds permissions for a user" do
    it "returns permissions for a user" do
      client.create_permission("ROOMAWESOME", "MIKE")
      rm = client.user_permissions("MIKE")
      rm.status.should == 200
      client.destroy_permission("ROOMAWESOME", "MIKE")
    end
  end
end