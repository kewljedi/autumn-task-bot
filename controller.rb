# Controller for the Tasks leaf.

class Controller < Autumn::Leaf
  
  # Typing "!about" displays some basic information about this leaf.
  
  def about_command(stem, sender, reply_to, msg)
    # This method renders the file "about.txt.erb"
  end

  def task_command(stem, sender, reply_to, msg)
    nameend = msg.index(' ') - 1
    name = msg.slice!(0..nameend)
    if users(reply_to).include?(name)
       name + ' is currently online'
    else
      name + ' is not currently online'
    end

    msg.strip!
  end
  
  def createproject_command(stem, sender, reply_to, msg)
    
    params = msg.split(',')
    name = params[0]
    code = params[1]
    
    if name.length > 0
      if code.length > 0 
        @project = Project.create(
          :name => name,
          :code => code,
          :create_at => Time.now
        )
      end
    end
    
     
    
  end
  
  def listprojects_command(stem, sender, reply_to, msg)
    
    var :projects => Project.all
    
  end
  
end


