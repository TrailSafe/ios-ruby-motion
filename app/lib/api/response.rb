module Api
  class Response

    attr_reader :raw_response, :options, :alert_errors

    def initialize(raw_response, options={})
      @raw_response = raw_response
      @alert_errors = Array.wrap options.delete :alert_errors
      @options = options
      validate!
    end

    def json
      BW::JSON.parse raw_response.body.to_str
    end

    def status
      raw_response.status_code
    end

    def success?
      (200..299).include? status.to_i
    end

    private

    def validate!
      App.alert formatted_error_message if alert_errors.any? do |e|
        (e == true && success?) || e == status
      end
    end

    def formatted_error_message
      if json[:error].present?
        "Error #{status}: #{json[:error]}"
      else
        "Error #{status}"
      end
    end

  end
end