class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, :inclusion => { :in => ['Fiction', 'Non-Fiction']}
    validate :click?

    # Custom validation
    STRINGS = [/Secret/i, /Won't Believe/i, /Guess/i, /Top \d/i]
    def click?
        if STRINGS.none? { |t| t.match title }
        errors.add(:title, "must be clickbait")
        end
    end

end
