module Legion
  module Extensions
    module Pihole
      module Runners
        module Ftl
          include Legion::Extensions::Pihole::Helpers::Client

          def type(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?type')
            { success: results.success?, results: results.body }
          end

          def version(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?version')
            { success: results.success?, results: results.body }
          end

          def summary(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?summary')
            { success: results.success?, results: results.body }
          end

          def top_items(host: '127.0.0.1', **opts)
            # needs more inputs
            results = client(host: host, **opts).get('/admin/api_FTL.php?topItems')
            { success: results.success?, results: results.body }
          end

          def top_clients(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?topClients')
            { success: results.success?, results: results.body }
          end

          def query_sources(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?getQuerySources')
            { success: results.success?, results: results.body }
          end

          def top_clients_blocked(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?topClientsBlocked')
            { success: results.success?, results: results.body }
          end

          def query_types(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?getQueryTypes')
            { success: results.success?, results: results.body }
          end

          def cache_info(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?getCacheInfo')
            { success: results.success?, results: results.body }
          end

          def all_queries(host: '127.0.0.1', **opts)
            # needs more options
            results = client(host: host, **opts).get('/admin/api_FTL.php?getAllQueries')
            { success: results.success?, results: results.body }
          end

          def recent_blocked(host: '127.0.0.1', **opts)
            results = client(host: host, **opts).get('/admin/api_FTL.php?recentBlocked')
            { success: results.success?, results: results.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
