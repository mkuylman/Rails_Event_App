class User < ActiveRecord::Base
	has_many :events_joined, through: :eventusers, source: :events 
	has_many :eventusers
  has_many :comments
  has_many :events #created events
	
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :location_city, :state, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }

  def full_name
  	first_name + ' ' + last_name 
  end
end
