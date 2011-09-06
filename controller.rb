# Controller for the Tasks leaf.

class Controller < Autumn::Leaf
  
  # Typing "!about" displays some basic information about this leaf.
  
  def about_command(stem, sender, reply_to, msg)
    # This method renders the file "about.txt.erb"
  end

  def task_command(stem, sender, reply_to, msg)
    
    createuser = findOrCreateUser(sender)
    
    #the name of the person to be assigned the task
    nameend = msg.index(' ') - 1
    name = msg.slice!(0..nameend).strip!
    
    #the name of the project to be assigned the task
    projectend = msg.index(' ') - 1 
    projectname = msg.slice!(0..projectend).strip!
    project = Project.find(:code=>projectname)
    
    task.new
    task.project = project
    task.body = msg
    task.user = createuser
    task.created_at = Time.now
    task.save

    var :task => task
  end
  
  def createproject_command(stem, sender, reply_to, msg)
    
    params = msg.split(',')
    name = params[0]
    code = params[1]

    if name.length > 0
      if code.length > 0 
        
        user = findOrCreateUser(sender)
        
        project = Project.create(
          :name => name,
          :code => code,
          :created_at => Time.now,
          :user => user
        )
        
      end
    end
    
    var :project => project
  end
  
  def listprojects_command(stem, sender, reply_to, msg)
    var :projects => Project.all
  end
  
  #we want to record everything that was said by someone other than the bot
  def did_receive_channel_message(stem, sender, channel, msg)
    
    if(sender[:nick] != 'STTI')
      
      user = findOrCreateUser(sender[:user])
      
      Message.create(
        :body=>msg,
        :created_at=>Time.now,
        :user=>user
      )
    end
    
  end
  
  #we want to go ahead and grant op to anyone that has it in the database.
  def someone_did_join_channel(stem, person, channel)
    
    user = findOrCreateUser(person)
    
    if(user.op?)
      grant_user_privilege channel, person[:nick], :operator
    end
  end

  def will_start_up
 
     self.oper "sttibot", "mrroboto"
      #nick "sttibot"

  end
end


