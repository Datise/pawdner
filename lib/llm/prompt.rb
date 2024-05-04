# frozen_string_literal: true

module Llm
  # Build a standard pump up prompt
  class Prompt
    def initialize(user)
      @user = user
      @prompt = base_prompt
      @api = Llm::Api.new
    end

    def get
      @api.invoke(@prompt)
    end

    private

    def base_prompt
      "write a #{length} pump up with #{sentimentality} sentimentality."
    end

    def length
      @user.settings.length
    end

    def sentimentality
      @user.settings.sentimentality
    end
  end
end
