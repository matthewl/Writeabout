require 'test_helper'

class PromptFeedTest < ActiveSupport::TestCase
  test 'push creates a prompt feed if one does not exist' do
    PromptFeed.push(1)
    assert_equal 1, PromptFeed.count
  end

  test 'push adds an id to the prompt feed' do
    PromptFeed.push(1)
    assert_equal 1, PromptFeed.first.ids.first
  end

  test 'push limits the number of ids in the prompt feed' do
    10.times { |x| PromptFeed.push(x + 1) }
    assert_equal 10, PromptFeed.first.ids.count
  end

  test 'last pushed id should be at start of feed' do
    10.times { |x| PromptFeed.push(x + 1) }
    assert_equal 10, PromptFeed.first.ids.first
  end
end
