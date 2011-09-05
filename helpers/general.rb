module GeneralHelper
  def findOrCreateUser(sender)
   
    username = sender[:user]
    
    if(username.nil?)
      username = sender[:nick]
    end
    
    user = User.first(:username=>username)
    if(!user)
      #ok we need to create this user
      user = User.new
      user.username = username
      user.created_at = Time.now
      #we need to know if this user is an op on the channel right now.
      user.save  
    end
    return user
  end

  def userFromNick(nick)
    
    build_irc_command(:who,nick)

  end
end
