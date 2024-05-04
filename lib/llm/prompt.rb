module Llm 
    class Prompt

        DEFAULTS = {
            length: "short",
            sentimentality: "low"
        }.with_indifferent_access

        def initialize
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
            DEFAULTS[:length]
        end

        def sentimentality
            DEFAULTS[:sentimentality]
        end
    end
end