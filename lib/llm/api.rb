# frozen_string_literal: true

module Llm
  # Api is responsible for making http requests to the model. Use it to swap models
  class Api
    def initialize
      @client = Aws::BedrockRuntime::Client.new(
        region: 'us-west-2',
        credentials: Aws::Credentials.new(Rails.application.credentials.aws_access_key_id, Rails.application.credentials.aws_secret_access_key)
      )
    end

    def invoke(text)
      resp = @client.invoke_model(params(text))
      JSON.parse(resp.body.read)
    end

    def params(text)
      {
        body: {
          prompt: text,
          max_gen_len: 100,
          temperature: 0.5,
          top_p: 0.9
        }.to_json,
        model_id: "meta.llama3-8b-instruct-v1:0",
        content_type: "application/json",
        accept: "*/*"
      }
    end
  end
end
