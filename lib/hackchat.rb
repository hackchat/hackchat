require 'faraday'
require 'json'
require 'hashie'
require_relative 'hackchat/permission'
require_relative 'hackchat/user'

class HackChat

  include Permission
  include User

  def initialize(token)
    @token = token
  end

private

  def get_response(status, body)
    resp = {status: status, response: body}
    Hashie::Mash.new(resp)
  end

  def convert_array_to_hashie(json)
    JSON.parse(json).collect do |obj|
      Hashie::Mash.new(obj)
    end
  end

  def convert_to_hashie(json)
    Hashie::Mash.new(JSON.parse(json))
  end

end