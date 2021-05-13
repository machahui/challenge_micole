class CreatePartnerToPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_to_preferences do |t|
    	t.belongs_to :partner, foreign_key: true
    	t.belongs_to :preference, foreign_key: true
      t.timestamps
    end
  end
end
