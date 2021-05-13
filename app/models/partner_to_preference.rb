class PartnerToPreference < ApplicationRecord
	belongs_to :partner
  	belongs_to :preference
end