class Book < ApplicationRecord
  validates :title, :author, :description, presence: true

  # belongs_to :user
end
