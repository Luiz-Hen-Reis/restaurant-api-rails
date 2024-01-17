class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET'])
  end

  def decode_token
    auth_header = request.headers['Authorization']

    if auth_header
      token = auth_header.spli(' ').last

      begin
        JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

end
