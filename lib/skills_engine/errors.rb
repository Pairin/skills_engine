module SkillsEngine
  class SkillsEngineError < StandardError
  end

  class SkillsEngineAuthenticationError < SkillsEngineError
  end

  class SkillsEngineAPIError < SkillsEngineError
  end
end
