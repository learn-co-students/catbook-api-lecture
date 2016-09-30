class ApplicationController < ActionController::API
  before_action :authenticate
  # helper_method :current_user
  
  def authenticate
    if request.env["HTTP_AUTHORIZATION"]
      token = request.env["HTTP_AUTHORIZATION"].split(" ").last
      decoded_token_info = JWT.decode(token, ENV["AUTH_SECRET_KEY"], true, {algorithm: 'HS256'})
      user_id = decoded_token_info.first["id"]
      if User.find(user_id)
        @current_user ||= User.find(user_id)
      else
        render json: {error: 'GET OUT'}
      end
    else
      render json: {error: 'GET OUT'}
    end

    # if there is a the authorization header in the right format
    # AND if we can get the token, decrypt the token, and it gives us the ID of a real user

    # token = request.env["HTTP_AUTHORIZATION"].split(" ").last
    # # JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
    # decoded_token_info = JWT.decode(token, ENV["AUTH_SECRET_KEY"], true, {algorithm: 'HS256'})
    # user_id = decoded_token_info.first["id"]
    # if User.find(user_id)
    #   @current_user ||= User.find(user_id)
    # end
    # if the incoming request DOES NOT have the authentication header + jwt token
    # render json: {error: "unauthorized! get out!"}

    # redirect_to login_path unless current_user
  end

  def current_user
    @current_user
  end
end
