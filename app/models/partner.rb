require 'net/http' 
require 'net/https' 
class Partner < ApplicationRecord
	include ActiveModel::Validations
	has_many :partner_to_preference
	has_many :preferences, through: :partner_to_preference

	validates :email,:preferences, presence: true
	validates :email, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	#validates_with GoodnessValidator
	validate :must_be_friends, on: :create

	accepts_nested_attributes_for :preferences

	def must_be_friends
		if email.presence
			uri = URI('https://emailvalidation.abstractapi.com/v1/?api_key=8038d61a898d46a09aa3b46ad80c138f&email='+email) 
			http = Net::HTTP.new(uri.host, uri.port) 
			http.use_ssl = true 
			http.verify_mode = OpenSSL::SSL::VERIFY_PEER 
			request = Net::HTTP::Get.new(uri) 
			begin
				logger.info "response"
				logger.info request
				response = http.request(request) 
				if response.deliverability != 'DELIVERABLE'
					errors.add(:base, 'No existe el correo')
				end
				logger.info response
				logger.info "response"
			rescue => error
				puts "Statu"
				puts error.message
				#errors.add(:base, 'Miquias Achahui')
			end
			
			#rescue StandardError => error 
			#	puts "Error (#{ error.message })" 
			#end make_abstract_request()
			 
		end
  	end


end

class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.email
    	require 'uri'
		require 'net/http'

      	record.errors[:base] << "Miquias Achahui"
    end
  end
end