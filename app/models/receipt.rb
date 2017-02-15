class Receipt < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :form, optional: true
    has_many :productreceipt
    accepts_nested_attributes_for :productreceipt, reject_if: proc { |attributes| attributes['name'].blank? }
end
