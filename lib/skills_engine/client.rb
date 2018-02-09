require 'net/http'
require 'json'

module SkillsEngine
  class Client

    OAUTH_ENDPOINT = 'https://api.skillsengine.com/oauth/token'
    ANALYSIS_TYPES = %w(text mocs)

    def initialize
      @access_token = get_access_token
    end

    def analyze(analysis_type, params)
      params.merge!(access_token: @access_token)

      case analysis_type.to_sym
      when :text
        TextAnalyzer.call(params)
      when :mocs
        MocsAnalyzer.call(params)
      else
        raise invalid_type(analysis_type)
      end
    end

    private

    def get_access_token
      uri = URI(OAUTH_ENDPOINT)

      response = Net::HTTP.post_form(
        uri,
        grant_type: 'client_credentials',
        client_id: ENV["skills_engine_client_id"],
        client_secret: ENV["skills_engine_client_secret"]
      )

      JSON.parse(response.body)["access_token"]
    end

    def invalid_type(analysis_type)
      SkillsEngineError.new("Invalid Analysis Type. Given #{analysis_type}, accepts #{ANALYSIS_TYPES.join(', ')}")
    end

  end
end
