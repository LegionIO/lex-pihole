module Legion
  module Extensions
    module Pihole
      module Helpers
        module Client
          def client(host: '127.0.0.1', ssl: false, port: 80, **opts)
            headers = opts.key?(:auth) ? { 'auth': opts[:auth] } : {}
            url = ssl ? "https://#{host}:#{port}" : "http://#{host}:#{port}"
            Faraday.new(url:     url, headers: headers) do |connection|
              connection.request :json
              connection.response :json, content_type: /\bjson$/
            end
          end
        end
      end
    end
  end
end
