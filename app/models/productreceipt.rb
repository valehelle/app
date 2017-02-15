class Productreceipt < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :receipt, optional: true
end
