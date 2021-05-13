class Partner < ApplicationRecord
	has_many :partner_to_preference
	has_many :preferences, through: :partner_to_preference
	validates :email, presence: true
	validates :email, uniqueness: true

	accepts_nested_attributes_for :preferences
	
end
