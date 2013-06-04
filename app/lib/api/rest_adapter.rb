module Api
  module RestAdapter
    include Api

    def self.included(base)
      base.extend self
    end

    [:get, :post, :put, :patch, :delete].each do |method|
      define_method method do |url, options={}, &block|
        request __method__, url, options, &block
      end
    end

    private

    def request(method, url, options={}, &block)
      response_options = options.slice :alert_errors, :raise_errors
      options.except! :alert_errors, :raise_errors
      options[:headers] = request_headers
      @last_request = BW::HTTP.send method, url, options do |response|
        block.call Response.new(response, response_options)
        @last_request = nil
      end
    end

    def request_headers
      Hash.new.tap do |hash|
        hash['Content-Type']  = 'application/json'
        hash['Authorization'] = Api.key if Api.key.present?
      end
    end

  end
end