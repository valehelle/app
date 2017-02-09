class Form < ApplicationRecord
    has_many :product
    belongs_to :user
    accepts_nested_attributes_for :product, reject_if: proc { |attributes| attributes['name'].blank? }
end
