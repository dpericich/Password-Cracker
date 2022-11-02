class User < ApplicationRecord
  PENDING = 'pending'.freeze
  COMPLETED = 'completed'.freeze
  LOCKED = 'locked'.freeze

  enum status: Hash[[PENDING, COMPLETED, LOCKED].map{ |k| [k, k]} ]

  has_one :service
  has_one :dictionary
end
