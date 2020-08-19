class CmdProcessor
  class << self
    attr_reader :planar_sl

    def process_command(data)
      if data == "screen100"
        mp "I hear you terry!!!"
        #PlanarSL.screen_set_to_100
        send_command(100)
        return 0
      elsif data == "screen50"
        mp "I hear you billy!!!"
        send_command(50)
        return 0
      elsif data == "screen25"
        mp "I hear you harry!!!"
        send_command(25)
        return 0
      elsif data == "screen15"
        mp "I hear you bilbo!!!"
        send_command(15)
        return 0
      else
        mp 'invalid command recieved'
      end
    end

    def send_command(command)
      data = [command]
      NSNotificationCenter.defaultCenter.postNotificationName('screen_command_notification', object:self, userInfo:data)
      # mp "posted notification with data #{command}"
    end

    def send_command_w_args(command,args)
      data = [command,args]
      $center.postNotificationName('video_command_w_args_notification', object:self, userInfo:nil)
      # mp "posted notification with data #{command}"
    end
  end

end
