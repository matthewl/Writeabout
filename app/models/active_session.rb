class ActiveSession < ApplicationRecord
  has_secure_token :remember_token

  belongs_to :account
end
