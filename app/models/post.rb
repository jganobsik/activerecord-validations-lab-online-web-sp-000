class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :clickbait

  KEYWORDS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait?
    if title.include?(KEYWORDS)
    errors.add(:customer_id, "is not active")
    end
  end
end
