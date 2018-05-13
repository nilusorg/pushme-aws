require 'aws-sdk'

require 'pushme/aws/version'

module Pushme
  VALID_DEVICE_TYPES = %i(
    android
    ios
  ).freeze
  private_constant :VALID_DEVICE_TYPES

  @config = {
    device_types: VALID_DEVICE_TYPES
  }

  class << self
    def setup
      yield self
    end

    def device_types=(types)
      raise ArgumentError, 'Argument must be an array of symbols' unless types.is_a?(Array)

      types.each do |type|
        raise ArgumentError, "Invalid type #{type}. The valid options are #{VALID_DEVICE_TYPES.join(', ')}" unless VALID_DEVICE_TYPES.include?(type)
      end

      @config[:device_types] = types
    end

    def table_name=(table_name)
      raise ArgumentError, 'Argument must be a string' unless table_name.is_a?(String)

      @config[:table_name] = table_name.to_sym
    end

    def config
      @config
    end

    def device_types
      @config[:device_types]
    end

    def table_name
      @config[:table_name]
    end

    def valid_device_types
      VALID_DEVICE_TYPES
    end
  end

  module Aws
    @config = {
      arn: {}
    }

    class << self

      def setup
        yield self
      end

      def android_arn=(android_arn)
        raise ArgumentError, 'Argument must be a string' unless android_arn.is_a?(String)

        @config[:arn][:android] = android_arn
      end

      def ios_arn=(ios_arn)
        raise ArgumentError, 'Argument must be a string' unless ios_arn.is_a?(String)

        @config[:arn][:ios] = ios_arn
      end

      def ios_sandbox=(ios_sandbox)
        raise ArgumentError, 'Argument must be a boolean' unless ios_sandbox.is_a?(TrueClass) || ios_sandbox.is_a?(FalseClass)

        @config[:ios_sandbox] = ios_sandbox
      end

      def region=(region)
        raise ArgumentError, 'Argument must be a string' unless region.is_a?(String)

        @config[:region] = region
      end

      def config
        @config
      end

      def android_arn
        @config[:arn][:android]
      end

      def ios_arn
        @config[:arn][:ios]
      end

      def ios_sandbox
        @config[:ios_sandbox] || false
      end

      def region
        @config[:region] ||
      end
    end
  end
end
