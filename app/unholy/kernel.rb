#Some command line stuff for testing:
class Kernel
  #type Kernel.coommand_name_here to run these commands in terminal. for example. Kernel.say_hi
  
  def say_hi
    mp 'Hi!'
  end
  
  def start
    App.delegate.go_home
    App.delegate.trigger_state
  end
  
  def reset_button
    App.delegate.go_home
  end
  
  def next
    App.delegate.trigger_state
  end

end
