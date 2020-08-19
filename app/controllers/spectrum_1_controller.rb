class Spectrum1PageController < QCController
    attr_reader :cueserver, :planar_sl
  
  def view_object
    @_view_object ||= Spectrum1Page.alloc.initWithFrame(window_frame)
  end
  
  @spectrum_1_correct = false
  @spectrum_congrats = false
  
  def startup
    super
    mp 'starting up!!'
   @cueserver = CueServer.new
   @planar_sl = PlanarSL.new
   
   $reward_video_1_view = AVPlayerView.alloc.init
   $reward_video_1_view.frame = @window.frame
   
   $spectrum_1_selection_video_view = AVPlayerView.alloc.init
   $spectrum_1_selection_video_view.frame = @window.frame

   
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
  
  def background_video_spectrum_1
    
    @_spectrum_1_selection_video ||= begin
      #v = AVPlayer.alloc.initWithPlayerItem(FileHelper.file_url('spectrum_2_movie_layer.mov'))
      #v = AVPlayer.alloc.init
      url = FileHelper.file_url('Spectrum_1_Page.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $spectrum_1_selection_video = AVPlayer.alloc.initWithPlayerItem(item)
      $spectrum_1_selection_video_view.player = $spectrum_1_selection_video
      $spectrum_1_selection_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($spectrum_1_selection_video_view)
    end
    $spectrum_1_selection_video_view.alphaValue = 1.0
    $reward_video_1_view.alphaValue = 0.0
  end
  
  def get_length
    value = $spectrum_1_selection_video_view.player.currentItem.asset.duration.value
    timescale = $spectrum_1_selection_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $spectrum_1_selection_video_view.player.currentTime.value
    timescale = $spectrum_1_selection_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reward_video_spectrum_1
    
    @_reward_video_spectrum_1 ||= begin
      #v = AVPlayer.alloc.initWithPlayerItem(FileHelper.file_url('spectrum_2_movie_layer.mov'))
      #v = AVPlayer.alloc.init
      url = FileHelper.file_url('spectrum_1_movie_layer.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $reward_video_1 = AVPlayer.alloc.initWithPlayerItem(item)
      $reward_video_1_view.player = $reward_video_1
      video_view.addSubview($reward_video_1_view)
    end
    $spectrum_1_selection_video_view.alphaValue = 0.0
    $reward_video_1_view.alphaValue = 1.0
  end
  
  def get_length_reward
    value = $reward_video_1_view.player.currentItem.asset.duration.value
    timescale = $reward_video_1_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time_reward
    value = $reward_video_1_view.player.currentTime.value
    timescale = $reward_video_1_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def spectrum1_page_appear
    mp "going to spectrum_1 page"
    view_object.addSpectrum1appearAnimationReverse(false, totalDuration: 0.75)
    background_video_spectrum_1
    #view_object.addSodiumrighttocentreAnimationReverse(false, totalDuration: 0.75)
    cueserver.sodium
    @sodium_in_centre = true
    $answer_box_showing = false
  end
  
  
  def sodium_centre
    return if $answer_box_showing  
    mp 'sodium to centre' 
    
    if @calcium_in_centre == true
    #  view_object.addCalciumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
   #   view_object.addSodiumrighttocentreAnimationReverse(false, totalDuration: 0.75)
    end  
    @sodium_in_centre = true
    
    @calcium_in_centre = false
    @hydrogen_in_centre = false
    @carbon_in_centre = false
    @oxygen_in_centre = false
    @helium_in_centre = false
    cueserver.sodium
  end
  
  def calcium_centre 
    return if $answer_box_showing   
    mp 'calcium to centre'
    
    if @hydrogen_in_centre == true
  #    view_object.addHydrogencentretorightAnimationReverse(false, totalDuration: 0.75)
    else
   #   view_object.addCalciumrighttocentreAnimationReverse(false, totalDuration: 0.75)
    end
    @calcium_in_centre = true
    
    @sodium_in_centre = false
    @hydrogen_in_centre = false
    @carbon_in_centre = false
    @oxygen_in_centre = false
    @helium_in_centre = false
    cueserver.calcium
  end
  
  def hydrogen_centre 
    return if $answer_box_showing   
    mp'hydrogen to centre'
    if @helium_in_centre == true
  #    view_object.addHeliumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
  #    view_object.addHydrogenrighttocentreAnimationReverse(false, totalDuration: 0.75)
   end
   @hydrogen_in_centre = true
   
   @calcium_in_centre = false
   @sodium_in_centre = false
   @carbon_in_centre = false
   @oxygen_in_centre = false
   @helium_in_centre = false
   cueserver.hydrogen
  end
  
  def helium_centre
    return if $answer_box_showing    
    mp "helium to centre"
    if @carbon_in_centre == true
  #    view_object.addCarboncentretorightAnimationReverse(false, totalDuration: 0.75)  
    else
  #    view_object.addHeliumrighttocentreAnimationReverse(false, totalDuration: 0.75) 
   end    
   @helium_in_centre = true
   
   @calcium_in_centre = false
   @sodium_in_centre = false
   @carbon_in_centre = false
   @oxygen_in_centre = false
   @hydrogen_in_centre = false
   cueserver.helium
  end
  
  
  def carbon_centre   
    return if $answer_box_showing
    mp "carbon to centre"    
    if @oxygen_in_centre == true
   #   view_object.addOxygencentretorightAnimationReverse(false, totalDuration: 0.75)
    else
   #   view_object.addCarbonrighttocentreAnimationReverse(false, totalDuration: 0.75)
   end
   @carbon_in_centre = true
   
   @calcium_in_centre = false
   @sodium_in_centre = false
   @helium_in_centre = false
   @oxygen_in_centre = false
   @hydrogen_in_centre = false
   cueserver.carbon
  end
  
  
  def oxygen_centre   
    return if $answer_box_showing 
    mp "oxygen to centre"
    
    if @sodium_in_centre == true
   #   view_object.addSodiumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
   #   view_object.addOxygenrighttocentreAnimationReverse(false, totalDuration: 0.75)  
    end 
    @oxygen_in_centre = true
    
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    cueserver.oxygen
  end
  
  def right_answer
    $answer_box_showing = true

      if @hydrogen_in_centre == true
       mp 'correcto patronuuuuuum!!!'
       view_object.addCorrectanswerspectrum1AnimationReverse(false, totalDuration: 0.75)
       $spectrum1_correct = true
       $spectrum1_screen_displaying = false
       #@spectrum_1_correct = true
      else
        if @spectrum_incorrect == true
          view_object.addIncorrectanswerspectrum1AnimationReverse(true, totalDuration: 0.75)
          @spectrum_incorrect = false
          $answer_box_showing = false
        else
          mp 'better luck next time potter!'
          view_object.addIncorrectanswerspectrum1AnimationReverse(false, totalDuration: 0.75)
          @spectrum_incorrect = true
        end
      end
  end
  
  def congrats_page_appear
    reset_elements
     #if @spectrum_congrats == true
       #rewards_page_appear
       #else
       cueserver.spectrum_1
       mp 'showing reward page!'
       view_object.addSpectrum1congratspageAnimationReverse(false, totalDuration: 0.75)
       @spectrum_congrats = true
       #end
  end
  
  def rewards_page_appear
      reward_video_spectrum_1
      
      #reward_video_spectrum_1.setHidden(false)

      mp 'showing rewards page!'
      view_object.addSpectrum1rewardspageAnimationReverse(false, totalDuration: 0.75)
      cueserver.orion
  end
  
  def reset_elements
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum1_correct = false
  end
  
  def reset
    view_object.removeAllAnimations
    #background_video_spectrum_1
    
    @spectrum_1_correct = false
    @spectrum_congrats = false
    
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $answer_box_showing = false
  end
  
end