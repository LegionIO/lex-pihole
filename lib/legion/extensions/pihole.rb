require 'legion/extensions/pihole/version'

module Legion
  module Extensions
    module Pihole
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
