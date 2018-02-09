module SkillsEngine
  class TextAnalyzer < Analyzer

    TEXT_ANALYSIS_URL = 'https://api.skillsengine.com/v2/competencies/analyze/'
    REQUIRED_PARAMS = %w(text)

    class << self

      private

      def get_uri
        URI(TEXT_ANALYSIS_URL)
      end

      def form_data_params(params)
        {
          text: params[:text],
          exclude: params[:exclude]
        }
      end

      def required_params
        REQUIRED_PARAMS
      end

    end

  end
end
