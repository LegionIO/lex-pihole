module Legion
  module Extensions
    module Pihole
      module Runners
        module List
          include Legion::Extensions::Pihole::Helpers::Client

          def status(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api.php?status')
            { success: results.success?, **results.body }
          end

          def list(type:, host: '127.0.0.1', **opts)
            # types: black, regex_black, white, regex_white
            results = client(host: host, **opts).get("/admin/api.php?list&type=#{type}")
            { success: results.success?, **results.body }
          end

          def add(domain:, type:, host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get("/admin/api.php?list&type=#{type}&add=#{domain}")
            { success: results.success?, **results.body }
          end

          def remove(domain:, type:, host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get("/admin/api.php?list&type=#{type}&sub=#{domain}")
            { success: results.success?, **results.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
