class Collection < ApplicationRecord
  has_many :manifests
  validates :manifest_url, presence: true
end
