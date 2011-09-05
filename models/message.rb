class Message
  include DataMapper::Resource
  
  #properties
  property :id, Serial
  property :created_at, DateTime
  property :body, String
    
  #relationships  
  belongs_to :user   
end