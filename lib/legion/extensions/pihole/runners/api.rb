module Legion
  module Extensions
    module Pihole
      module Runners
        module Api
          include Legion::Extensions::Pihole::Helpers::Client

          def status(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api.php?status')
            { success: results.success?, **results.body }
          end

          def enable(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api.php?enable')
            { success: results.success?, **results.body }
          end

          def disable(time: 0, host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get("/admin/api.php?disable=#{time}")
            { success: results.success?, **results.body }
          end

          def versions(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api.php?versions')
            { success: results.success?, **results.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
