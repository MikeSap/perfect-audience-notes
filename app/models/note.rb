class Note < ApplicationRecord

  belongs_to :user
  
  validates :title, length: { in: 1..30 }
  validates :title, presence: true
  validates :content, length: {in: 0..1000}

end
