module Api
  class SingularResource
    include Api::RestAdapter

    class_attribute :path

    def exists?
      fetch.success?
    end

    def self.fetch(&block)
      get full_path do |response|
        block.call instance_from_response response
      end
    end

    def self.fetch!(errors=true, &block)
      get full_path, alert_errors: errors do |response|
        block.call instance_from_response response
      end
    end

    private

    def self.field(*names)
      names.each do |f|
        define_method "#{f}=" do |val|
          attributes[f] = val
        end

        define_method f do
          attributes[f]
        end
      end
    end

    def self.full_path
      Api.root_url + path
    end

    def self.instance_from_response(response)
      self.new(response.json) if response.success?
    end

    def attributes
      @attributes ||= {}
    end

    def initialize(attributes={})
      attributes.each { |k, v| pubic_send "#{k}=", v }
    end

    def full_path
      self.class.full_path
    end

    def public_send(method, *values)
      if respond_to? method
        send method, *values
      else
        raise NoMethodError, "private method `#{method}' called for #{self.class}"
      end
    end

  end
end