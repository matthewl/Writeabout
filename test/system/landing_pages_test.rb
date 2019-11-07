require 'application_system_test_case'

class LandingPagesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit root_url
    assert_selector 'h1', text: 'Write About'
    assert_selector 'h2', text: "A writing prompt generator for when you have writer's block"
  end
end
