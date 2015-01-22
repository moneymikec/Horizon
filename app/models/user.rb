class User
  include Neo4j::ActiveNode

  property :username, type:   String
  property :twitter, type: String
  property :email, type: String
  index :twitter

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  before_save { self.email = email.downcase }

  VALID_USERNAME_REGEX = /\s/
  validates :username,  presence: true, uniqueness: true,
      length: { minimum: 3, maximum: 20 },
      format: { without: VALID_USERNAME_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,
                  length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :twitter, presence: true, uniqueness: true
end
