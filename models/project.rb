class Project
  include DataMapper::Resource

  #properties
  property :id,         Serial    # An auto-increment integer key
  property :name,       String    # A varchar type field to hold the entire name of the project.
  property :code,       String    # A easier to type name
  property :created_at, DateTime  # A DateTime, for any date you might like.
  
  #relationships
  has n, :tasks
  belongs_to :user
  
end