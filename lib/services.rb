module Services
  class ShortenUrl

    def initialize( url )
      @url = url
    end

    def convert
      is_valid = Member::VALID_URL_FORMAT =~ @url
      if is_valid == 0 || is_valid == 1
        @options = { longUrl: @url, access_token: ENV['SHORTEN_API_ACCESS_TOKEN'] }
        fetch_response
      else
        raise I18n.t("errors.invalid_url")
      end
    end

    def fetch_response
      begin
        response = RestClient.get ENV["SHORTEN_API_URL"], {:params => @options }
        response = JSON.parse(response)
        response && response["data"]["url"]
      rescue RestClient::Unauthorized => error
        retries ||= 0
        if retries == 0
          retries = 1
          retry
        else
          raise error
        end
      end
    end

  end
end