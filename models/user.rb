class User
  include DataMapper::Resource
  
  #properties
  property :id, Serial
  property :created_at, DateTime
  property :username, String
  property :op, Boolean
  
  #relationships
  has n, :projects
  has n, :tasks
  has n, :messages
  
end