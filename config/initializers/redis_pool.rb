require 'connection_pool'

module ActiveSupport
  module Cache
    class RedisStore < Store
      def initialize(*addresses)
        @data = ::ConnectionPool::Wrapper.new(size: 50, timeout: 5) { ::Redis::Store::Factory.create(addresses) }
        super(addresses.extract_options!)
      end
    end
  end
end
