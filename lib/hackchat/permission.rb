module Permission


  def user_permissions(user_id)
    response = connect.get "users/#{user_id}", auth_token: @token
    get_response(response.status, response.body)
  end

  def has_permission?(room_token, user_token)
    response = connect.get "user_room_permission",
                            { auth_token: @token,
                              room_token: room_token,
                              user_token: user_token }
    get_response(response.status, response.body)
  end

  def room_permissions(room_id)
    response = connect.get "rooms/#{room_id}", auth_token: @token
    get_response(response.status, response.body)
  end

  def create_permission(room_token, user_token)
    response = connect.post "rooms",
                            { auth_token: @token,
                              room_token: room_token,
                              user_token: user_token }
    get_response(response.status, convert_to_hashie(response.body))
  end

  def destroy_permission(room_token, user_token)
    response = connect.delete "rooms/#{room_token}",
                            { auth_token: @token,
                              user_token: user_token }
    get_response(response.status, response.body)
  end


end