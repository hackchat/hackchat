module Permission

  def p_client
    Faraday.new :url => "http://localhost:3000/"
  end

  def user_permissions(user_token)
    response = p_client.get "users/#{user_token}", auth_token: @token
    get_response(response.status, response.body)
  end

  def has_permission?(room_token, user_token)
    response = p_client.get "user_room_permission",
                            { auth_token: @token,
                              room_token: room_token,
                              user_token: user_token }
    get_response(response.status, response.body)
  end

  def room_permissions(room_id)
    response = p_client.get "rooms/#{room_id}", auth_token: @token
    get_response(response.status, response.body)
  end

  def create_permission(room_token, user_token)
    response = p_client.post "rooms",
                            { auth_token: @token,
                              room_token: room_token,
                              user_token: user_token }
    get_response(response.status, convert_to_hashie(response.body))
  end

  def destroy_permission(room_token, user_token)
    response = p_client.delete "rooms/#{room_token}",
                            { auth_token: @token,
                              user_token: user_token }
    get_response(response.status, response.body)
  end

end