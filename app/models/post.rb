class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  # CLICKBAITS = [
  #   /Won't Believe/i,
  #   /Secret/i,
  #   /Top \d/i,
  #   /Guess/i
  # ]

  # def clickbait?
  #   if clickbaits.none? { |bait| bait.match title }
  #     errors.add(:title, "must be clickbait")
  #   end
  # end
  CLICKBAITS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if CLICKBAITS.none? { |bait| bait.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
