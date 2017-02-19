class Receipt < ApplicationRecord
    before_create :set_ref_id
    belongs_to :user, optional: true
    belongs_to :form, optional: true
    has_many :productreceipt
    accepts_nested_attributes_for :productreceipt, reject_if: proc { |attributes| attributes['name'].blank? }

    private
    def set_ref_id
        self.ref_id = generate_ref_id
    end
    def generate_ref_id
        loop do
            ref_id = SecureRandom.hex(4)
            break ref_id unless Receipt.where(ref_id: ref_id).exists?
        end
    end
end
