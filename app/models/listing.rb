class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: { female: 0, male: 1 }
end
