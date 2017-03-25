class Receipt < ApplicationRecord
    before_create :set_ref_id
    validates_presence_of :customer_name, :shipping_address, :shipping_poskod, :shipping_city, :shipping_country, :customer_email, :customer_phone
    belongs_to :user, optional: true
    belongs_to :form, optional: true
    has_many :productreceipt
    accepts_nested_attributes_for :productreceipt, reject_if: proc { |attributes| attributes['name'].blank? }
    mount_uploader :pay_img, PaymentUploader

    private
    def set_ref_id
        self.ref_id = generate_ref_id
    end
    def generate_ref_id
        loop do
            ref_id = SecureRandom.hex(4).upcase
            break ref_id unless Receipt.where(ref_id: ref_id).exists?
        end
    end
end
