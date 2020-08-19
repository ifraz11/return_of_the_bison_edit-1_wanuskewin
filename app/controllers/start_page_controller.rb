class StartPageController < QCController
    attr_reader :cueserver
  
  def view_object
    @_view_object ||= StartPage.alloc.initWithFrame(window_frame)
  end
  
  def startup
    super
    mp 'starting up!!'
    @cueserver = CueServer.new
    $start_screen_video_view = AVPlayerView.alloc.init
    $start_screen_video_view.frame = @window.frame
  end
  
  def actions
    @_actions ||= {
      
      test_button: :button_press
      
    }
  end
  
  def exclusions
    @_exclusions ||= [
      
      :background
      
    ]
  end
  
  def start_screen_video
    
    @_start_screen_video ||= begin
      url = FileHelper.file_url('Start_Screen.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $start_screen_video = AVPlayer.alloc.initWithPlayerItem(item)
      $start_screen_video_view.player = $start_screen_video
      $start_screen_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($start_screen_video_view)

    end
  end
  
  def get_length
    value = $start_screen_video_view.player.currentItem.asset.duration.value
    timescale = $start_screen_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $start_screen_video_view.player.currentTime.value
    mp "#{value} --- this is value"
    timescale = $start_screen_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reset_current_time
    $start_screen_video_view.player.seek(0)
    #mp "#{value} --- this is value"
    #timescale = $start_screen_video_view.player.currentTime.timescale
    #[value, timescale]
  end
  
  #def home_screen_appear
  #  mp "lets get this show on the road"
  #  view_object.addHomescreenappearAnimationReverse(false, totalDuration: 0.75)
  #end
  
  def start_screen_appear
    mp "bringing up start screen"
    start_screen_video
    view_object.addStartscreenappearAnimationReverse(false, totalDuration: 0.5)
    #view_object.addDialselection5to1AnimationReverse(false, totalDuration: 0.5)
    cueserver.spectrum_1
  end
  
  def option_spectrum_1
    if @spectrum2_in_centre == true
     view_object.addDialselection1to2AnimationReverse(true, totalDuration: 0.5)
   else  
     view_object.addDialselection5to1AnimationReverse(false, totalDuration: 0.5)
   end
     @spectrum1_in_centre = true
     
     @spectrum2_in_centre = false
     @spectrum3_in_centre = false
     @spectrum4_in_centre = false
     @spectrum5_in_centre = false
     cueserver.spectrum_1
     
  end
  
  def option_spectrum_2
    if @spectrum3_in_centre == true
     view_object.addDialselection2to3AnimationReverse(true, totalDuration: 0.5)
   else
     view_object.addDialselection1to2AnimationReverse(false, totalDuration: 0.5)
   end
     @spectrum2_in_centre = true
     
     @spectrum1_in_centre = false
     @spectrum3_in_centre = false
     @spectrum4_in_centre = false
     @spectrum5_in_centre = false
     cueserver.spectrum_2
  end
  
  def option_spectrum_3
    if @spectrum4_in_centre == true
     view_object.addDialselection3to4AnimationReverse(true, totalDuration: 0.5)
   else
     view_object.addDialselection2to3AnimationReverse(false, totalDuration: 0.5)
  end
   @spectrum3_in_centre = true
   
   @spectrum1_in_centre = false
   @spectrum2_in_centre = false
   @spectrum4_in_centre = false
   @spectrum5_in_centre = false 
   cueserver.spectrum_3   
  end
  
  def option_spectrum_4
    if @spectrum5_in_centre == true
     view_object.addDialselection4to5AnimationReverse(true, totalDuration: 0.5)
   else
     view_object.addDialselection3to4AnimationReverse(false, totalDuration: 0.5)
   end
    @spectrum4_in_centre = true
   
    @spectrum1_in_centre = false
    @spectrum2_in_centre = false
    @spectrum3_in_centre = false
    @spectrum5_in_centre = false
    cueserver.spectrum_4
  end
  
  def option_spectrum_5
    if @spectrum1_in_centre == true      
     view_object.addDialselection5to1AnimationReverse(true, totalDuration: 0.5) 
   else
     view_object.addDialselection4to5AnimationReverse(false, totalDuration: 0.5)
   end
    @spectrum5_in_centre = true
    
    @spectrum1_in_centre = false
    @spectrum2_in_centre = false
    @spectrum3_in_centre = false
    @spectrum4_in_centre = false
    cueserver.spectrum_5      
  end
  
  def reset
    view_object.removeAllAnimations
    @spectrum1_in_centre = true
    
    @spectrum2_in_centre = false
    @spectrum3_in_centre = false
    @spectrum4_in_centre = false
    @spectrum5_in_centre = false
  end
  
end