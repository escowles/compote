class Collection < ApplicationRecord
  has_many :manifests, dependent: :destroy
  validates :manifest_url, presence: true
end
