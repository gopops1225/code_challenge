class Jeep < ApplicationRecord
  require 'pry-rails'

  def self.create_bulk_jeeps(jeep_collection)
    jeep_collection.each do |jeep|
      Jeep.create(jeep)
    end
  end

  def price_after_tax
    sales_tax = 0.089
    price + (price * sales_tax)
  end

end

# == Schema Information
#
# Table name: jeeps
#
#  id             :integer          not null, primary key
#  bids           :integer
#  miles          :integer
#  name           :string
#  price          :float
#  time_remaining :string
#  year           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
