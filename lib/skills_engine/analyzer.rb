module SkillsEngine
  class Analyzer

    SUCCESS_CODE = '200'

    class << self

      def call(params)
        response = deliver_request(get_uri, params)
        handle_response(response)
      end

      private

      def get_uri
      end

      def deliver_request(uri, params)
        validate_params(params)

        https = Net::HTTP.new(uri.host, uri.port)
        https.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri)
        request['Authorization'] = "Bearer #{params[:access_token]}"
        request.set_form_data(form_data_params(params))
        https.request(request)
      end

      def validate_params(params)
        required_params.each do |key|
          if params[key.to_sym].nil?
            raise SkillsEngine::SkillsEngineError.new("Parameter #{key} required")
          end
        end
      end

      def form_data_params(params)
      end

      def handle_response(response)
        if response.code != SUCCESS_CODE
          raise SkillsEngine::SkillsEngineAPIError.new("#{response.code}: #{response.message}")
        else
          JSON.parse(response.body)
        end
      end

      def required_params
        []
      end

    end

  end
end
