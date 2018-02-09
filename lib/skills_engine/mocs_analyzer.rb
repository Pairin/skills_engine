module SkillsEngine
  class MocsAnalyzer < Analyzer

    MOCS_ANALYSIS_URL = 'https://api.skillsengine.com/v2/competencies/analyze/military'
    REQUIRED_PARAMS = %w(moc)

    class << self

      private

      def get_uri
        URI(MOCS_ANALYSIS_URL)
      end

      def required_params
        REQUIRED_PARAMS
      end

      def form_data_params(params)
        {
          moc: params[:moc],
          exclude: params[:exclude]
        }
      end

    end

  end
end
