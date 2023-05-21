class Likable < ApplicationRecord
  belongs_to :likable, polymorphic: true
end
