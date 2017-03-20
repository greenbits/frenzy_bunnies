module FrenzyBunnies
  module Handlers
    class Oneshot
      def initialize(channel, queue, logger, opts)
        @channel = channel
        @opts    = opts
        @logger  = logger
      end

      def acknowledge(hdr, msg)
        @channel.acknowledge(hdr.delivery_tag, false)
      end

      def reject(hdr, msg, requeue=false)
        @channel.reject(hdr.delivery_tag, requeue)
      end

      def error(hdr, msg, err)
        reject(hdr, msg)
      end

      def timeout(hdr, msg)
        reject(hdr, msg)
      end

      def noop(hdr, msg)

      end
    end
  end
end
