class Form < ApplicationRecord
    validates_presence_of :name
    before_create :set_ref_id
    has_many :product
    has_many :receipt
    belongs_to :user
    accepts_nested_attributes_for :product, reject_if: proc { |attributes| attributes['name'].blank?}, allow_destroy: true
    accepts_nested_attributes_for :receipt, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true

    private
    def set_ref_id
        self.ref_id = generate_ref_id
    end

    def generate_ref_id
        loop do
        ref_id = SecureRandom.hex(4)
        break ref_id unless Form.where(ref_id: ref_id).exists?
        end
    end
end
