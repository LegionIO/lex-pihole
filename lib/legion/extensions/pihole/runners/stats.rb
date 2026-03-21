# frozen_string_literal: true

module Legion
  module Extensions
    module Pihole
      module Runners
        module Stats
          def summary(**)
            resp = connection(**).get('', { summary: '' })
            { summary: resp.body }
          end

          def top_items(count: 10, **)
            resp = connection(**).get('', { topItems: count })
            { top_items: resp.body }
          end

          def top_clients(count: 10, **)
            resp = connection(**).get('', { topClients: count })
            { top_clients: resp.body }
          end

          def over_time_data_10mins(**)
            resp = connection(**).get('', { overTimeData10mins: '' })
            { over_time_data: resp.body }
          end

          def query_types(**)
            resp = connection(**).get('', { getQueryTypes: '' })
            { query_types: resp.body }
          end
        end
      end
    end
  end
end
