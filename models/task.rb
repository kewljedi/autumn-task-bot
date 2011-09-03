class Task
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
  
  belongs_to :project
  
end