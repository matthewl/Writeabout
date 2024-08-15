require "test_helper"

class PromptsControllerTest < ActionDispatch::IntegrationTest
  test 'show should respond successfully' do
    get prompt_url(prompts(:fonts).public_id)
    assert_response :success
  end
end
