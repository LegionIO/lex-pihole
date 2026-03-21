# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/stats'
require_relative 'runners/lists'

module Legion
  module Extensions
    module Pihole
      class Client
        include Helpers::Client
        include Runners::Stats
        include Runners::Lists

        attr_reader :opts

        def initialize(url: 'http://pi.hole/admin/api.php', token: nil, **extra)
          @opts = { url: url, token: token, **extra }
        end

        def settings
          { options: @opts }
        end

        def connection(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end
