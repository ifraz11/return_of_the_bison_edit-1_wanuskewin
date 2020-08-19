class AppDelegate
    attr_accessor :ss_showing
    attr_reader :planar_sl, :cueserver
  
  PHIDGET_SERIAL_NUMBER = -1
  #558479 ---> Serial of site phidget
  #527381 ----> Jamies test phidget
  
  def applicationDidFinishLaunching(notification)
    create_screensaver
    
    buildMenu
    #buildWindow

    #@phidget = DigitalInputController.new.start(PHIDGET_SERIAL_NUMBER, port: port, channel: 0)
    #@phidget = EncoderController.new.start(vint_serial, port: 1, channel: 0)
    setup_phidgets
    setup_listeners
    
    
    start_page_controller
    home_page_controller
    spectrum_1_page_controller
    
    
    #Phidgets Notification Posting
    @center = NSNotificationCenter.defaultCenter
    @center.addObserver(self, selector: 'phidget_attached:', name: 'phidget_attached', object: nil)
    @center.addObserver(self, selector: 'process_position:', name: 'phidget_position_change', object: nil)
    @center.addObserver(self, selector: 'process_state:', name: 'phidget_state_change_from_encoder', object: nil) 
    @center.addObserver(self, selector: 'process_button:', name: 'phidget_state_change_from_button', object: nil) 
    @center.addObserver(self, selector: 'process_screen_command:', name: 'screen_command_notification', object: nil) 
    
    $screensaver_showing = true
    @home_page_displaying = false
    @start_screen_displaying = false
    @spectrum1_screen_displaying = false
    
    $spectrum_1_correct = false
    $spectrum_2_correct = false    
    @old_value = 0
    @old_position = 0
    @e_helper = EncoderHelper.new
    
    go_home
    
    # showsPlaybackControls
  end
  
  def create_screensaver
    url = FileHelper.file_url('spectrum_screensaver.mp4')
    frame = [[0, 0], [3840, 2160]]
    # frame = [[0, 0], [1920, 1080]]
    
    ScreenSaver.setup_screensaver_window(url, frame, 60)
    ScreenSaver.show_screensaver()
    
    NSNotificationCenter.defaultCenter.addObserver(self, selector: 'screensaver_hiding', name: 'hiding_screensaver', object: nil)
    NSNotificationCenter.defaultCenter.addObserver(self, selector: 'screensaver_showing', name: 'showing_screensaver', object: nil)
    
  end
  
  def setup_listeners
    App.notification_center.observe "phidget_state_change_from_encoder" do |notification|
      value = notification.userInfo
      converted_state = "#{value["input"]}".to_i
      if @old_state != converted_state
        ScreenSaver.hide_screensaver
        ScreenSaver.cancel_timer
        @old_state = converted_state
      end
      #@jamie, looking at this could you not just see what the value of the button is and ajust accordingly, ignore if it is a 0 and cancel the screensaver if it is a 1?
    end
    
    App.notification_center.observe "phidget_position_change" do |notification|
      #moved to process_position_change
    end
  end
  
  def process_position_change(value)
    converted_position = "#{value["position"]}".to_i
    if @old_position != converted_position
      ScreenSaver.hide_screensaver
      ScreenSaver.cancel_timer
      @old_position = converted_position
    end
  end
  
  def screensaver_hiding
    mp '~~~~~~~~~~~~~~~~~~~~screensaver hiding now'
   # ScreenSaver.hide_screensaver
    #ScreenSaver.cancel_timer
  end
  
  def screensaver_showing
    mp '~~~~~~~~~~~~~~~~~~~~screensaver showing now'
    #ScreenSaver.show_screensaver
    go_home
    cueserver.mystery_loop
  end
  
  def setup_phidgets
    mp 'Setting up Phidgets'
    @phidget = EncoderController.new.startEncoder(PHIDGET_SERIAL_NUMBER, port: 1, channel: 0)
    #shaun only has an old controller....
    #@phidget = PhidgetEncoderController.new.createEncoder(-1)
    
     @phidget_button = EncoderInputController.new.startEncoderInput(PHIDGET_SERIAL_NUMBER, port: 2, channel: 0)
     @phidget_2 = DigitalInputController.new.startDigitalInput(PHIDGET_SERIAL_NUMBER, port: 3, channel: 0)
  end
  
  #this is called when the phidget 'attaches' to the system (available for talking to)
	def phidget_attached(notification)
		value = notification.userInfo
    mp "Phidget #{value["serial"]} with #{value["port"]} at #{value["channel"]} attached (in AppDelegate)"
    # sleep(1) #wait for the phidget to get ready to accept calls. May not need this.
    @phidget_attached = true #this is useful so you dont' write to a phidget which isn't there
	end
  
	def process_detach(notification)
	  value = notification.userInfo
    # sleep(1) #wait for the phidget to get ready to accept calls. May not need this.
    @phidget_attached = false
    mp "Phidget Detatched!! PANIC!!"
	end
  
  def process_button(notification)
    go_home
  end
  
  def reset_all_spectrums
    @spectrum1_played = false

  end
  
  def reset_all_elements  
    @sodium_played = false
    @calcium_played = false
    @hydrogen_played = false
    @helium_played = false
    @carbon_played = false
    @oxygen_played = false
  end
  
  def reset_rewards
    @spectrum1_rewards_displaying = false
  end
  
  def process_home_screen(step)
    mp step
    mp "in process homescreen. @home_page_displaying = #{@home_page_displaying}"
  
    video_length = home_page_controller.get_length    # here we want to check the length of the video"
    @home_current_time = home_page_controller.get_current_time    #now that I have the length I need where the current playhead is for the current screen...
    
    if @home_current_time[0] >= 1800
      @home_current_time[0] = 0
      mp "~~~~~~~~JUMP TO START OF VIDEO~~~~~~~~~~~~~~"
      mp "#{(@home_current_time[0] * @home_current_time[1])} >= #{(video_length[0] * video_length[1])}"
      #stopPlayingAndSeekSmoothlyToTime(restart_time, $start_screen_video)
    elsif @home_current_time[0] <= 0
      mp "~~~~~~~~JUMP TO END OF VIDEO~~~~~~~~~~~~~~"
      @home_current_time[0] = 1800
    end
    
    time = CMTimeMake((step + @home_current_time[0]), 30) # now I add or subtract the step from the current time. timescale seems to be in a base of 71
    stopPlayingAndSeekSmoothlyToTime(time, $home_video) #and then seek to the time.

  end
  
  def test_for_snap(time, snap_times, snap_distance)
    snap_times.each do |e|
      ((e - snap_distance)..(e + snap_distance))
      if ((e - snap_distance)..(e + snap_distance)).include?(time)
        mp "found we are in a time #{e}"
        return e #if the time we are seeking to is within a range then just send it to the snap point
      end
    end
    return time #otherwise just send the time that went in
  end
  
  def process_start_screen(step)
    video_length = start_page_controller.get_length    # here we want to check the length of the video"
    @start_current_time = start_page_controller.get_current_time    #now that I have the length I need where the current playhead is for the current screen...
    
    
    mp video_length
    mp @start_current_time
    #I was trying to get this to jump to the start of the video when the end of the video is reached but I'm doing something wrong.
     if @start_current_time[0] >= 1800
       @start_current_time[0] = 0
       mp "~~~~~~~~JUMP TO START OF VIDEO~~~~~~~~~~~~~~"
       mp "#{(@start_current_time[0] * @start_current_time[1])} >= #{(video_length[0] * video_length[1])}"
       #stopPlayingAndSeekSmoothlyToTime(restart_time, $start_screen_video)
     elsif @start_current_time[0] <= 0
       mp "~~~~~~~~JUMP TO END OF VIDEO~~~~~~~~~~~~~~"
       @start_current_time[0] = 1800
     end
    
    snap_times = [0, 12 * 30, 24 * 30, 36 * 30, 48 * 30] #put all the times into an array and we'll test against these
    mp snap_times
    snap_distance = 20 #how far before we snap back to the times above
    loc = step + @start_current_time[0]
    mp "loc is #{loc}"
    result = test_for_snap(loc, snap_times, snap_distance)
    mp "result is #{result}"
    time = CMTimeMake(result, 30) # now I add or subtract the step from the current time. timescale seems to be in a base of 71  
    stopPlayingAndSeekSmoothlyToTime(time, $start_screen_video)
    @start_screen_position = result.to_i
    mp @start_screen_position
  end
  
  def process_spectrum_screen(step, page_controller, spectrum_video)  
    if $answer_box_showing == true
      mp 'No movement answer box showing'
    else  
      video_length = page_controller.get_length 
      @spectrum_current_time = page_controller.get_current_time   
      
      if @spectrum_current_time[0] >= 1800
        @spectrum_current_time[0] = 0
        mp "~~~~~~~~JUMP TO START OF VIDEO~~~~~~~~~~~~~~"
        mp "#{(@spectrum_current_time[0] * @spectrum_current_time[1])} >= #{(video_length[0] * video_length[1])}"
        #stopPlayingAndSeekSmoothlyToTime(restart_time, $start_screen_video)
      elsif @spectrum_current_time[0] <= 0
        mp "~~~~~~~~JUMP TO END OF VIDEO~~~~~~~~~~~~~~"
        @spectrum_current_time[0] = 1800
      end
      
      snap_times = [0, 8 * 30, 20.61 * 30, 30.14 * 30, 37.25 * 30, 50.76 * 30] #put all the times into an array and we'll test against these
      snap_distance = 20 #how far before we snap back to the times above
      loc = step + @spectrum_current_time[0]
      mp "loc is #{loc}"
      result = test_for_snap(loc, snap_times, snap_distance)
      mp "result is #{result}"
      time = CMTimeMake(result, 30) # now I add or subtract the step from the current time. timescale seems to be in a base of 71  
      stopPlayingAndSeekSmoothlyToTime(time, spectrum_video)
      
      mp "#{snap_times} is the element location"
      @element_screen_position = result.to_i
      mp @element_screen_position
      
      case @element_screen_position
        
      when 0 
        page_controller.sodium_centre
        
      when 240
        page_controller.oxygen_centre
        
      when 618
        page_controller.carbon_centre
        
      when 904
        page_controller.helium_centre
        
      when 1117
        page_controller.hydrogen_centre
        
      when 1522
        page_controller.calcium_centre
      else
        mp 'nothing selected yet'
        #page_controller.reset_elements
      end 
    end   
  end
  
  def process_reward_screen(step, page_controller, reward_video)
    video_length = page_controller.get_length_reward    # here we want to check the length of the video"
    @reward_current_time = page_controller.get_current_time_reward    #now that I have the length I need where the current playhead is for the current screen...

    if @reward_current_time[0] >= 1800
      @reward_current_time[0] = 0
      mp "~~~~~~~~JUMP TO START OF VIDEO~~~~~~~~~~~~~~"
      mp "#{(@reward_current_time[0] * @reward_current_time[1])} >= #{(video_length[0] * video_length[1])}"
      #stopPlayingAndSeekSmoothlyToTime(restart_time, $start_screen_video)
    elsif @reward_current_time[0] <= 0
      mp "~~~~~~~~JUMP TO END OF VIDEO~~~~~~~~~~~~~~"
      @reward_current_time[0] = 1800
    end
    
    snap_times = [0] #put all the times into an array and we'll test against these
    snap_distance = 1 #how far before we snap back to the times above
    loc = step + @reward_current_time[0]
    mp "loc is #{loc}"
    result = test_for_snap(loc, snap_times, snap_distance)
    mp "result is #{result}"
    time = CMTimeMake(result, 30) # now I add or subtract the step from the current time. timescale seems to be in a base of 71  
    stopPlayingAndSeekSmoothlyToTime(time, reward_video)
    mp "#{snap_times} is the snap location"
  end
  
  def process_position(notification)
    value = notification.userInfo
    process_position_change(value) #Moved the duplicate call to process position value here
    
    converted_value = "#{value["position"]}".to_i
    mp "Position is #{value["position"]} and converted value is #{converted_value}"
    step = @e_helper.spin_calc(converted_value)
    mp "#{step} -----------"
    
    if @home_page_displaying == true # I broke down the tests so we can keep a clean short list in this method and then figure out what we do per page
      process_home_screen(step)
     
    elsif @start_screen_displaying == true
      process_start_screen(step)
      
    elsif $spectrum1_screen_displaying == true
      process_spectrum_screen(step, spectrum_1_page_controller, $spectrum_1_selection_video)
      
    elsif $spectrum2_screen_displaying == true
      process_spectrum_screen(step, spectrum_2_page_controller, $spectrum_2_selection_video)
      
    elsif $spectrum3_screen_displaying == true
      process_spectrum_screen(step, spectrum_3_page_controller, $spectrum_3_selection_video)
      
    elsif $spectrum4_screen_displaying == true
      process_spectrum_screen(step, spectrum_4_page_controller, $spectrum_4_selection_video)
      
    elsif $spectrum5_screen_displaying == true
      process_spectrum_screen(step, spectrum_5_page_controller, $spectrum_5_selection_video)   
      
    elsif @spectrum1_rewards_displaying == true
      process_reward_screen(step, spectrum_1_page_controller, $reward_video_1)   
      
    elsif @spectrum2_rewards_displaying == true
      process_reward_screen(step, spectrum_2_page_controller, $reward_video_2)
      
    elsif @spectrum3_rewards_displaying == true
      process_reward_screen(step, spectrum_3_page_controller, $reward_video_3)
      
    elsif @spectrum4_rewards_displaying == true
      process_reward_screen(step, spectrum_4_page_controller, $reward_video_4)
      
    elsif @spectrum5_rewards_displaying == true
      process_reward_screen(step, spectrum_5_page_controller, $reward_video_5)
    end
  end
  
  def process_state(notification)
    value = notification.userInfo
    converted_state = "#{value["input"]}".to_i
    if converted_state == 1
      trigger_state
    end
  end
  
  def trigger_state
    if $screensaver_showing == true
        reset_video($home_video)
        show_home_page
        $screensaver_showing = false
        @home_page_displaying = true
      
    elsif @home_page_displaying == true
        reset_video($start_screen_video)
        show_start_page
        start_page_controller.start_screen_appear
        reset_rewards
        @home_page_displaying = false
        @start_screen_displaying = true
        @spectrum1_played = true #For Startup incase user presses dial straight away
      
    elsif @start_screen_displaying == true
      
      case @start_screen_position
        
      when 0 
        show_spectrum1_page
        
      when 360
        show_spectrum2_page
        
      when 720
        show_spectrum3_page
        
      when 1080
        show_spectrum4_page
        
      when 1440
        show_spectrum5_page
      else
        mp 'nothing selected yet'
        process_start_screen(step)
      end
      
      @home_page_displaying = false
      @start_screen_displaying = false
    #_________________________________________________________________#  END OF DIAL SELECTION INPUT       

      
    elsif $spectrum1_screen_displaying == true
          spectrum_1_page_controller.right_answer
          @start_screen_displaying = false
          @home_page_displaying = false
          $spectrum1_correct = true
          
    elsif $spectrum1_correct == true
          spectrum_1_page_controller.congrats_page_appear
          @spectrum1_congrats_displaying = true
          $spectrum1_correct = false
        
    elsif @spectrum1_congrats_displaying == true
          reset_video($reward_video_1)
          spectrum_1_page_controller.rewards_page_appear 
          @spectrum1_rewards_displaying = true
          @spectrum1_congrats_displaying = false
      
    elsif @spectrum1_rewards_displaying == true
          show_start_page
          spectrum_1_page_controller.reset
          @spectrum1_rewards_displaying = false
          @start_screen_displaying = true
   #_________________________________________________________________#  END OF SPECTRUM 1 INPUT
   
    elsif $spectrum2_screen_displaying == true
          spectrum_2_page_controller.right_answer
          @start_screen_displaying = false
          @home_page_displaying = false
          $spectrum2_correct = true
          
    elsif $spectrum2_correct == true
          spectrum_2_page_controller.congrats_page_appear
          @spectrum2_congrats_displaying = true
          $spectrum2_correct = false
        
    elsif @spectrum2_congrats_displaying == true
          reset_video($reward_video_2)
          spectrum_2_page_controller.rewards_page_appear
          @spectrum2_rewards_displaying = true
          @spectrum2_congrats_displaying = false
      
    elsif @spectrum2_rewards_displaying == true
          show_start_page
          spectrum_2_page_controller.reset
          @spectrum2_rewards_displaying = false
          @start_screen_displaying = true
  #_________________________________________________________________#  END OF SPECTRUM 2 INPUT
  
    elsif $spectrum3_screen_displaying == true
          spectrum_3_page_controller.right_answer
          @start_screen_displaying = false
          @home_page_displaying = false
          $spectrum3_correct = true
          
    elsif $spectrum3_correct == true
          spectrum_3_page_controller.congrats_page_appear
          @spectrum3_congrats_displaying = true
          $spectrum3_correct = false
        
    elsif @spectrum3_congrats_displaying == true
          reset_video($reward_video_3)
          spectrum_3_page_controller.rewards_page_appear
          @spectrum3_rewards_displaying = true
          @spectrum3_congrats_displaying = false
      
    elsif @spectrum3_rewards_displaying == true
          show_start_page
          spectrum_3_page_controller.reset
          @spectrum3_rewards_displaying = false
          @start_screen_displaying = true
  #_________________________________________________________________#  END OF SPECTRUM 3 INPUT
  
    elsif $spectrum4_screen_displaying == true
          spectrum_4_page_controller.right_answer
          @start_screen_displaying = false
          @home_page_displaying = false
          $spectrum4_correct = true
          
    elsif $spectrum4_correct == true
          spectrum_4_page_controller.congrats_page_appear
          @spectrum4_congrats_displaying = true
          $spectrum4_correct = false
        
    elsif @spectrum4_congrats_displaying == true
          reset_video($reward_video_4)
          spectrum_4_page_controller.rewards_page_appear
          @spectrum4_rewards_displaying = true
          @spectrum4_congrats_displaying = false
      
    elsif @spectrum4_rewards_displaying == true
          show_start_page
          spectrum_4_page_controller.reset
          @spectrum4_rewards_displaying = false
          @start_screen_displaying = true
  #_________________________________________________________________#  END OF SPECTRUM 4 INPUT
  
    elsif $spectrum5_screen_displaying == true
          spectrum_5_page_controller.right_answer
          @start_screen_displaying = false
          @home_page_displaying = false
          $spectrum5_correct = true
          
    elsif $spectrum5_correct == true
          spectrum_5_page_controller.congrats_page_appear
          @spectrum5_congrats_displaying = true
          $spectrum5_correct = false
        
    elsif @spectrum5_congrats_displaying == true
          reset_video($reward_video_5)
          spectrum_5_page_controller.rewards_page_appear
          @spectrum5_rewards_displaying = true
          @spectrum5_congrats_displaying = false
      
    elsif @spectrum5_rewards_displaying == true
          show_start_page
          spectrum_5_page_controller.reset
          @spectrum5_rewards_displaying = false
          @start_screen_displaying = true
  #_________________________________________________________________#  END OF SPECTRUM 4 INPUT
               
    end
  end
  
  #_________________________________________________________________# Video Seeking
   

   def stopPlayingAndSeekSmoothlyToTime(newChaseTime, screen)  #options for screen are: $home_video, $start_screen_video, $spectrum_1_selection_video
     if newChaseTime != @chaseTime
       @chaseTime = newChaseTime
       unless @isSeekInProgress
         trySeekToChaseTime(screen)
       end
     end
   end
 
   def trySeekToChaseTime(screen)
     if (screen.currentItem.status == AVPlayerItemStatusUnknown)
       # wait until item becomes ready (KVO player.currentItem.status)
     elsif (screen.currentItem.status == AVPlayerItemStatusReadyToPlay)
       actuallySeekToTime(screen)
     end
   end
 
   def actuallySeekToTime(screen)
     @isSeekInProgress = true
     seekTimeInProgress = @chaseTime
    
     screen.seekToTime(seekTimeInProgress ,toleranceBefore: KCMTimeZero, toleranceAfter: KCMTimeZero, completionHandler: Proc.new{|finished|
       if seekTimeInProgress == @chaseTime
         @isSeekInProgress = false
       else
         trySeekToChaseTime(screen)
       end
     })
    end
    
    def reset_video(screen)
      mp 'resetting video'
      time = CMTimeMake(0, 30)
      stopPlayingAndSeekSmoothlyToTime(time, screen)
      screen = nil
    end
    
    #_________________________________________________________________#  END OF Video Seeking
  
  def home_page_controller
    @_home_pc ||= begin
      hpc = HomePageController.new
      hpc.startup
      hpc
    end
  end
  
  def start_page_controller
    @_start_pc ||= begin
      spc = StartPageController.new
      spc.startup
      spc
    end
  end  
  
  def spectrum_1_page_controller
    @_spectrum1_pc ||= begin
      s1pc = Spectrum1PageController.new
      s1pc.startup
      s1pc
    end
  end
  
  def spectrum_2_page_controller
    @_spectrum2_pc ||= begin
      s2pc = Spectrum2PageController.new
      s2pc.startup
      s2pc
    end
  end
  
  def spectrum_3_page_controller
    @_spectrum3_pc ||= begin
      s3pc = Spectrum3PageController.new
      s3pc.startup
      s3pc
    end
  end
  
  def spectrum_4_page_controller
    @_spectrum4_pc ||= begin
      s4pc = Spectrum4PageController.new
      s4pc.startup
      s4pc
    end
  end
  
  def spectrum_5_page_controller
    @_spectrum5_pc ||= begin
      s5pc = Spectrum5PageController.new
      s5pc.startup
      s5pc
    end
  end
  
  def show_home_page
    reset_all_spectrums
    home_page_controller.stop_listening
    home_page_controller.window.makeKeyAndOrderFront(nil)
    home_page_controller.start_listening
    home_page_controller.home_screen_appear
    reset_video($home_video)
  end
  
  def show_start_page
    reset_all_spectrums
    start_page_controller.stop_listening
    start_page_controller.window.makeKeyAndOrderFront(nil)
    start_page_controller.start_listening
    start_page_controller.start_screen_appear
    reset_video($start_screen_video)
  end
  
  def show_spectrum1_page
    reset_all_elements
    spectrum_1_page_controller.stop_listening
    spectrum_1_page_controller.window.makeKeyAndOrderFront(nil)
    spectrum_1_page_controller.start_listening
    spectrum_1_page_controller.spectrum1_page_appear
    reset_video($spectrum_1_selection_video)
    
    $spectrum1_screen_displaying = true
  end
  
  def show_spectrum2_page
    reset_all_elements
    spectrum_2_page_controller.stop_listening
    spectrum_2_page_controller.window.makeKeyAndOrderFront(nil)
    spectrum_2_page_controller.start_listening
    spectrum_2_page_controller.spectrum2_page_appear
    reset_video($spectrum_2_selection_video)
    
    $spectrum2_screen_displaying = true
  end
  
  def show_spectrum3_page
    reset_all_elements
    spectrum_3_page_controller.stop_listening
    spectrum_3_page_controller.window.makeKeyAndOrderFront(nil)
    spectrum_3_page_controller.start_listening
    spectrum_3_page_controller.spectrum3_page_appear
    reset_video($spectrum_3_selection_video)
    
    $spectrum3_screen_displaying = true
  end
  
  def show_spectrum4_page
    reset_all_elements
    spectrum_4_page_controller.stop_listening
    spectrum_4_page_controller.window.makeKeyAndOrderFront(nil)
    spectrum_4_page_controller.start_listening
    spectrum_4_page_controller.spectrum4_page_appear
    reset_video($spectrum_4_selection_video)
    
    $spectrum4_screen_displaying = true
  end
  
  def show_spectrum5_page
    reset_all_elements
    spectrum_5_page_controller.stop_listening
    spectrum_5_page_controller.window.makeKeyAndOrderFront(nil)
    spectrum_5_page_controller.start_listening
    spectrum_5_page_controller.spectrum5_page_appear
    reset_video($spectrum_5_selection_video)
    
    $spectrum5_screen_displaying = true
  end

  
  def go_home    
    reset_rewards    
    show_home_page 
    start_page_controller.reset
    spectrum_1_page_controller.reset
    @home_page_displaying = true
    
    @start_screen_displaying = false
    $spectrum1_screen_displaying = false
  end
  
end
