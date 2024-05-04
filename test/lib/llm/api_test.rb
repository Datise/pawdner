# frozen_string_literal: true

require 'test_helper'

class Llm::ApiTest < ActiveSupport::TestCase
  # your tests go here
  test '#params' do
    api = Llm::Api.new
    text = 'test text'
    expected_params = {
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

    assert_equal(api.params(text), expected_params)
  end
end
