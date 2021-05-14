# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
 :address              => "smtp.gmail.com",
 :port                 => 587,
 :user_name            => 'miky1607@gmail.com',
 :password             => 'Achahuig30',
 :authentication       => "plain",
 :enable_starttls_auto => true
}