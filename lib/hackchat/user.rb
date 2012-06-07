module User

  def u_client
    Faraday.new :url => "http://localhost:2000/"
  end

  def get_user(user_token)
    response = u_client.get "users/#{user_token}", auth_token: @token
    get_response(response.status, convert_to_hashie(response.body))
  end

  def current_user
    response = u_client.get "sessions/show", auth_token: @token
    get_response(response.status, convert_to_hashie(response.body))
  end

  def create_user(user)
    response = u_client.post "users/", auth_token: @token
    get_response(response.status, convert_to_hashie(response.body))
  end

end