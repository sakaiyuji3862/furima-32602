class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :prefecture
    belongs_to :shipping_cost
    belongs_to :shipping_day

    with_options presence: true do
        validates :name
        validates :price, format: {with: /\A[0-9]+\z/}, #半角数字
                  :numericality => {
                    :greater_than_or_equal_to => 300,
                    :less_than_or_equal_to => 9999999
                  }
        validates :description
        validates :status_id, numericality: { other_than: 1 }
        validates :shipping_cost_id, numericality: { other_than: 1 }
        validates :shipping_days_id
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :category_id, numericality: { other_than: 1 }
        validates :image
    end
end
