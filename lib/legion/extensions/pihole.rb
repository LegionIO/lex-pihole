# frozen_string_literal: true

require 'legion/extensions/pihole/version'
require 'legion/extensions/pihole/helpers/client'
require 'legion/extensions/pihole/runners/stats'
require 'legion/extensions/pihole/runners/lists'
require 'legion/extensions/pihole/client'

module Legion
  module Extensions
    module Pihole
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
