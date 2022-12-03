class Item < ApplicationRecord

  has_many :cart_items
    has_many :order_details
    has_one_attached :image
    belongs_to :genre

    enum sales_status: { on_sale: 0, off_sale: 1 }

    def self.search(search)
        if search
            where(['name LIKE ?', "%#{search}%"])
        else
            all
        end
    end

end
