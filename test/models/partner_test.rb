require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  self.use_transactional_tests = false
  test "create preference" do
    preference = Preference.new(name:'Moda Mujer')
    assert preference.save,'se creo correctamten'
  end

  test "Create partner" do
    partner = Partner.new(email:'miky1607@gmail.com')
    assert_not partner.save, 'test validate'
  end


  test "send email partner" do
    partner = Partner.find(1)
    PartnerNotifierMailer.send_signup_email(partner).deliver
    assert PartnerNotifierMailer.send_signup_email(partner).deliver, 'true'
  end


end
