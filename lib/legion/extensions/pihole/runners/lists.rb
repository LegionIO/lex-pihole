# frozen_string_literal: true

module Legion
  module Extensions
    module Pihole
      module Runners
        module Lists
          def list_domains(list: 'white', **)
            resp = connection(**).get('', { list: list })
            { domains: resp.body }
          end

          def add_domain(list:, domain:, **)
            resp = connection(**).get('', { list: list, add: domain })
            { result: resp.body }
          end

          def remove_domain(list:, domain:, **)
            resp = connection(**).get('', { list: list, sub: domain })
            { result: resp.body }
          end

          def enable(**)
            resp = connection(**).get('', { enable: '' })
            { enabled: resp.body }
          end

          def disable(duration: 0, **)
            params = duration.positive? ? { disable: duration } : { disable: '' }
            resp = connection(**).get('', params)
            { disabled: resp.body }
          end
        end
      end
    end
  end
end
