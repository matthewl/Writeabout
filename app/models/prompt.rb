class Prompt < ApplicationRecord
  RANDOM_COUNT = 1
  LIMIT_COUNT = 10

  has_secure_token :public_id

  def full_prompt
    "Write about #{prompt}."
  end

  def self.random(the_count = RANDOM_COUNT)
    records = offset(rand(count - the_count)).limit(the_count)
    the_count == RANDOM_COUNT ? records.first : records
  end

  def self.search(query, limit_count = LIMIT_COUNT)
    search_query = 'prompt ILIKE :query'
    where(search_query, query: "%#{query}%").limit(limit_count).order('updated_at DESC')
  end
end
