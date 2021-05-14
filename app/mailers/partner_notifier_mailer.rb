class PartnerNotifierMailer < ApplicationMailer
	default :from => 'miky1607@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  	def send_signup_email(partner)
    	@partner = partner
    	mail( :to => @partner.email,
    	:subject => 'Thanks for signing up for our amazing app' )
  	end
end

