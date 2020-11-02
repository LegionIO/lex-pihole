module Legion
  module Extensions
    module Pihole
      module Runners
        module Database
          include Legion::Extensions::Pihole::Helpers::Client

          def file_size(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?getDBfilesize')
            { success: results.success?, **results.body }
          end

          def total_queries(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?getQueriesCount')
            { success: results.success?, **results.body }
          end

          def max_timestamp(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?getMaxTimestamp')
            { success: results.success?, **results.body }
          end

          def min_timestamp(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?getMinTimestamp')
            { success: results.success?, **results.body }
          end

          def status(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?status')
            { success: results.success?, **results.body }
          end

          def top_ads(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?topAds')
            { success: results.success?, **results.body }
          end

          def messages(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?messages')
            { success: results.success?, **results.body }
          end

          def top_domains(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?topDomains')
            { success: results.success?, **results.body }
          end

          def top_clients(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?topClients')
            { success: results.success?, **results.body }
          end

          def all_queries(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?getAllQueries')
            { success: results.success?, **results.body }
          end

          def network(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_db.php?network')
            { success: results.success?, **results.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
