class Article<ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    validates :title, presence:  true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: {minimum: 10, maximum: 200}
end
