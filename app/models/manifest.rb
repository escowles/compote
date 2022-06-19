class Manifest < ApplicationRecord
  belongs_to :collection
  has_many :images, dependent: :destroy
end
