class Preference < ApplicationRecord
	has_many :partner_to_preference
	has_many :partners, through: :partner_to_preference
end