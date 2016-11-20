class CreateAffiliateCountries < ActiveRecord::Migration
  def change
    create_table :affiliate_countries do |t|
      t.string :country, default: ''
      t.string :default_affiliate_tag, default: ''
      t.string :tracker, default: ''
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
