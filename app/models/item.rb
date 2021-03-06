class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :place
  belongs_to :schedule

  with_options presence: true do
    validates :image
    validates :name
    validates :information
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }, format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :place_id
      validates :schedule_id
    end
  end
end
