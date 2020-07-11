class Contact < ApplicationRecord
  attachment :image
  belongs_to :room
end
