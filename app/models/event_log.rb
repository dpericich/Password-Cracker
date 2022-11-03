class EventLog < ApplicationRecord
  PENDING = 'pending'.freeze
  COMPLETED = 'completed'.freeze
  LOCKED = 'locked'.freeze

  enum status: Hash[[PENDING, COMPLETED, LOCKED].map{ |k| [k, k]} ]

  has_one :user
  has_one :service
end
