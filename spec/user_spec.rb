require 'spec_helper'

describe "User" do
  let(:token) { 'awesome_token'}
  let(:client) { HackChat.new(token)}

  context "Finds permissions for a user" do
    it "returns permissions for a user" do
      client.create_permission("ROOMAWESOME", "MIKE")
      rm = client.user_permissions("MIKE")
      rm.status.should == 200
    end
  end

  context "Finds current user" do
    it "returns user based on token" do
      response = client.get_user("MIKE")
      response.status.should == 200
      client.destroy_permission("ROOMAWESOME", "MIKE")
    end
  end

end