class Issue
  include Neo4j::ActiveNode

  has_many :in, :categories
  has_many :out, :users, model_class: User
  has_many :in, :perspectives, model_class: User


  property :name, type: String
  property :description, type: String
end
