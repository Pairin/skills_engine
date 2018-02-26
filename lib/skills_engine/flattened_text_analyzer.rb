module SkillsEngine
  class FlattenedTextAnalyzer < TextAnalyzer

    TEXT_ANALYSIS_URL = 'https://api.skillsengine.com/v2/competencies/analyze/flatten'
    REQUIRED_PARAMS = %w(text)

    class << self

      private

      def get_uri
        URI(TEXT_ANALYSIS_URL)
      end

    end

  end
end
