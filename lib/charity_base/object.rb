require "ostruct"
require 'json'

module CharityBase
  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      case obj
      when Hash
        OpenStruct.new(obj.transform_values { |val| to_ostruct(val) })
      when Array
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end

    # def initialize(attributes)
    #   @attributes = OpenStruct.new(attributes)
    # end
    #
    # def method_missing(method, *args, &block)
    #   attribute = @attributes.send(method, *args, &block)
    #   attribute.is_a?(Hash) ? Object.new(attribute) : attribute
    # end
    #
    # def respond_to_missing?(method, include_private = false)
    #   true
    # end
  end
end
