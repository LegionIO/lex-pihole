# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Pihole
      module Helpers
        module Client
          def connection(url: 'http://pi.hole/admin/api.php', token: nil, **_opts)
            Faraday.new(url: url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.params['auth'] = token if token
              conn.adapter Faraday.default_adapter
            end
          end
        end
      end
    end
  end
end
