class Part < ApplicationRecord
  belongs_to :user
  has_many :statistics, dependent: :delete_all
end
