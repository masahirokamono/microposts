class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :city, allow_blank: true, length: { maximum: 20 }
    validates :age , numericality: {only_integer: true, greater_than_or_equal_to: 0} , allow_blank: true
    validates :job, allow_blank: true, length: { maximum: 20 }
    validates :profilecomment, allow_blank: true, length: { maximum: 40 }
   
    has_many :microposts
    
    has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
    has_many :following_users, through: :following_relationships, source: :followed
     has_secure_password
end
