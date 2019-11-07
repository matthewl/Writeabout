class Prompt < ApplicationRecord
  def self.random(the_count = 1)
    records = offset(rand(count - the_count)).limit(the_count)
    the_count == 1 ? records.first : records
  end
end
