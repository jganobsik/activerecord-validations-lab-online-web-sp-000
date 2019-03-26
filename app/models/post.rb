class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  KEYWORDS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait
   KEYWORDS.each do |keyword|
     if  !title.to_s.match(keyword)
    errors.add(:title, "must be clickbait")
  end 
  end
  end
end
