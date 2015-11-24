class Event < ActiveRecord::Base
  has_many :users, through: :eventusers
  has_many :eventusers
  has_many :comments
  belongs_to :user

  validate :datevalid

  def datevalid
  	if date.present? && date < Date.today
  		errors.add(:date, "Can't be in the past")
  	end
  end
end
