class Child < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :family, optional: true
end
