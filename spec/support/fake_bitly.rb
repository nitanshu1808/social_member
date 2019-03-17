require 'sinatra/base'
require 'rails_helper'

class FakeBitly < Sinatra::Base

  get "/v3/shorten" do
    json_response 200, 'shorten_url.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
