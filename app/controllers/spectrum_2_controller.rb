class Spectrum2PageController < QCController
  attr_reader :cueserver
  
  def view_object
    @_view_object ||= Spectrum2Page.alloc.initWithFrame(window_frame)
  end
  
  @spectrum_2_correct = false
  @spectrum_2_congrats = false
  
  def startup
    super
    mp 'starting up!!'
   @cueserver = CueServer.new
   # @av_player_layer = AVPlayerLayer.playerLayerWithPlayer(@av_player)
   # @av_player_layer.frame = [[0, 0], [1920, 1080]]
   $reward_video_2_view = AVPlayerView.alloc.init
   $reward_video_2_view.frame = @window.frame

   $spectrum_2_selection_video_view = AVPlayerView.alloc.init
   $spectrum_2_selection_video_view.frame = @window.frame
   
   @spectrum_2_correct = false
   @spectrum_congrats = false
   
   @oxygen_in_centre = false   
   @calcium_in_centre = false
   @sodium_in_centre = false
   @helium_in_centre = false
   @carbon_in_centre = false
   @hydrogen_in_centre = false
   
   $answer_box_showing = false
   $spectrum2_correct = false
   
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
  
  def background_video_spectrum_2
    
    @_spectrum_2_selection_video ||= begin
      url = FileHelper.file_url('Spectrum_1_Page.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $spectrum_2_selection_video = AVPlayer.alloc.initWithPlayerItem(item)
      $spectrum_2_selection_video_view.player = $spectrum_2_selection_video
      $spectrum_2_selection_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($spectrum_2_selection_video_view)
    end
    $spectrum_2_selection_video_view.alphaValue = 1.0
    $reward_video_2_view.alphaValue = 0.0
  end
  
  def get_length
    value = $spectrum_2_selection_video_view.player.currentItem.asset.duration.value
    timescale = $spectrum_2_selection_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $spectrum_2_selection_video_view.player.currentTime.value
    timescale = $spectrum_2_selection_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reward_video_spectrum_2
    
    @_reward_video_spectrum_2 ||= begin
      url = FileHelper.file_url('spectrum_2_movie_layer.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $reward_video_2 = AVPlayer.alloc.initWithPlayerItem(item)
      $reward_video_2_view.player = $reward_video_2
      video_view.addSubview($reward_video_2_view)
    end
    $spectrum_2_selection_video_view.alphaValue = 0.0
    $reward_video_2_view.alphaValue = 1.0
  end
  
  def get_length_reward
    value = $reward_video_2_view.player.currentItem.asset.duration.value
    timescale = $reward_video_2_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time_reward
    value = $reward_video_2_view.player.currentTime.value
    timescale = $reward_video_2_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def spectrum2_page_appear
    mp "going to spectrum_2 page"
    view_object.addSpectrum2appearAnimationReverse(false, totalDuration: 0.75)
    background_video_spectrum_2
    #view_object.addSodiumrighttocentreAnimationReverse(false, totalDuration: 0.75)
    cueserver.sodium
  end
  
  
  def sodium_centre 
    return if $answer_box_showing  
    mp 'sodium to centre' 
    
    if @calcium_in_centre == true
      view_object.addCalciumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
      view_object.addSodiumrighttocentreAnimationReverse(false, totalDuration: 0.75)
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
      view_object.addHydrogencentretorightAnimationReverse(false, totalDuration: 0.75)
    else
      view_object.addCalciumrighttocentreAnimationReverse(false, totalDuration: 0.75)
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
      view_object.addHeliumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
      view_object.addHydrogenrighttocentreAnimationReverse(false, totalDuration: 0.75)
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
      view_object.addCarboncentretorightAnimationReverse(false, totalDuration: 0.75)  
    else
      view_object.addHeliumrighttocentreAnimationReverse(false, totalDuration: 0.75) 
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
      view_object.addOxygencentretorightAnimationReverse(false, totalDuration: 0.75)
    else
      view_object.addCarbonrighttocentreAnimationReverse(false, totalDuration: 0.75)
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
      view_object.addSodiumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
      view_object.addOxygenrighttocentreAnimationReverse(false, totalDuration: 0.75)  
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
    
      if @oxygen_in_centre == true
       mp 'correcto patronuuuuuum!!!'
       view_object.addCorrectanswerspectrum2AnimationReverse(false, totalDuration: 0.75)
       $spectrum2_correct = true
       $spectrum2_screen_displaying = false
      else
        if @spectrum_2_incorrect == true
          view_object.addIncorrectanswerspectrum2AnimationReverse(true, totalDuration: 0.75)
          @spectrum_2_incorrect = false
          $answer_box_showing = false
        else
          mp 'better luck next time potter!'
          view_object.addIncorrectanswerspectrum2AnimationReverse(false, totalDuration: 0.75)
          @spectrum_2_incorrect = true
        end
      end
  end
  
  def congrats_page_appear
      reset_elements
       cueserver.spectrum_2
       mp 'showing spectrum 2 congrats page!'
       view_object.addSpectrum2congratspageAnimationReverse(false, totalDuration: 0.75)
  end
  
  def rewards_page_appear
      reward_video_spectrum_2

      #reward_video_spectrum_2.setHidden(false)

      mp 'showing spectrum 2 rewards page!'
      
      view_object.addSpectrum2rewardspageAnimationReverse(false, totalDuration: 0.75)
      cueserver.aurora
  end
  
  def reset_elements
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum2_correct = false
  end
  
  def reset
    view_object.removeAllAnimations
    #background_video_spectrum_2
    
    
    @spectrum_2_correct = false
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