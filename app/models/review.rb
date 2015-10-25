class Review < ActiveRecord::Base
    belongs_to :recipe
    belongs_to :chef
    
    validates :title, presence: true, length: {minimum: 3, maximum: 40}
    validates :body, presence: true, length: {minimum: 5, maximum: 200}
    validates :chef_id, presence: true
    validates :recipe_id, presence: true
end
