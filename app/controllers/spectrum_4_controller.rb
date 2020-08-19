class Spectrum4PageController < QCController
        attr_reader :cueserver
  
  def view_object
    @_view_object ||= Spectrum4Page.alloc.initWithFrame(window_frame)
  end
  
  @spectrum_4_correct = false
  @spectrum_4_congrats = false
  
  def startup
    super
    mp 'starting up!!'
   @cueserver = CueServer.new
   # @av_player_layer = AVPlayerLayer.playerLayerWithPlayer(@av_player)
   # @av_player_layer.frame = [[0, 0], [1920, 1080]]
   $reward_video_4_view = AVPlayerView.alloc.init
   $reward_video_4_view.frame = @window.frame

   $spectrum_4_selection_video_view = AVPlayerView.alloc.init
   $spectrum_4_selection_video_view.frame = @window.frame

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
  
  def background_video_spectrum_4
    
    @_spectrum_4_selection_video ||= begin
      #v = AVPlayer.alloc.initWithPlayerItem(FileHelper.file_url('spectrum_2_movie_layer.mov'))
      #v = AVPlayer.alloc.init
      url = FileHelper.file_url('Spectrum_1_Page.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $spectrum_4_selection_video = AVPlayer.alloc.initWithPlayerItem(item)
      $spectrum_4_selection_video_view.player = $spectrum_4_selection_video
      $spectrum_4_selection_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($spectrum_4_selection_video_view)

    end
    $spectrum_4_selection_video_view.alphaValue = 1.0
    $reward_video_4_view.alphaValue = 0.0
  end
  
  def get_length
    value = $spectrum_4_selection_video_view.player.currentItem.asset.duration.value
    timescale = $spectrum_4_selection_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $spectrum_4_selection_video_view.player.currentTime.value
    timescale = $spectrum_4_selection_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reward_video_spectrum_4
    
    @_reward_video_4_spectrum_4 ||= begin
      url = FileHelper.file_url('spectrum_4_movie_layer.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $reward_video_4 = AVPlayer.alloc.initWithPlayerItem(item)
      $reward_video_4_view.player = $reward_video_4
      video_view.addSubview($reward_video_4_view)
    end
    $spectrum_4_selection_video_view.alphaValue = 0.0
    $reward_video_4_view.alphaValue = 1.0
  end
  
  def get_length_reward
    value = $reward_video_4_view.player.currentItem.asset.duration.value
    timescale = $reward_video_4_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time_reward
    value = $reward_video_4_view.player.currentTime.value
    timescale = $reward_video_4_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def spectrum4_page_appear
    mp "going to spectrum_4 page"
    view_object.addSpectrum4appearAnimationReverse(false, totalDuration: 0.75)
    background_video_spectrum_4
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
    
    if @hydrogen_in_centre == true
      if @hydrogen_answered == true
        view_object.addCorrectanswerhydrogenspectrum4AnimationReverse(true, totalDuration: 0.75)
        $answer_box_showing = false
        @hydrogen_answered = false
      else
        mp 'correcto patronuuuuuum!!!'
        view_object.addCorrectanswerhydrogenspectrum4AnimationReverse(false, totalDuration: 0.75)
        view_object.addSideelementhydrogenappearAnimationReverse(false, totalDuration: 0.75)
        @hydrogen_answered = true
        $spectrum4_hydrogen_correct = true
        if $spectrum4_oxygen_correct == true
          $spectrum4_screen_displaying = false
        else
        end
      end
    elsif @oxygen_in_centre == true
      if @oxygen_answered == true
        view_object.addCorrectansweroxygenspectrum4AnimationReverse(true, totalDuration: 0.75)
        $answer_box_showing = false
        @oxygen_answered = false
      else
        view_object.addCorrectansweroxygenspectrum4AnimationReverse(false, totalDuration: 0.75)
        view_object.addSideelementoxygenappearAnimationReverse(false, totalDuration: 0.75)
        @oxygen_answered = true
        $spectrum4_oxygen_correct = true
        if $spectrum4_hydrogen_correct == true
          $spectrum4_screen_displaying = false
        else
        end
      end
      #screen_displaying
    elsif $spectrum4_hydrogen_correct == true && $spectrum4_oxygen_correct == true
        $spectrum4_screen_displaying = false
    else
      if @spectrum_4_incorrect == true
        view_object.addIncorrectanswerspectrum4AnimationReverse(true, totalDuration: 0.75)
        $answer_box_showing = false
        @spectrum_4_incorrect = false
      else
        mp 'better luck next time potter!'
        view_object.addIncorrectanswerspectrum4AnimationReverse(false, totalDuration: 0.75)
        @spectrum_4_incorrect = true
      end
    end
  end
  
  def congrats_page_appear
    reset_elements
     #if @spectrum_congrats == true
       #rewards_page_appear
       #else
       cueserver.spectrum_4
       mp 'showing spectrum 4 congrats page!'
       view_object.addSpectrum4congratspageAnimationReverse(false, totalDuration: 0.75)
       #@spectrum_2_congrats = true
       #end
  end
  
  def rewards_page_appear
      reward_video_spectrum_4
      
      #reward_video_spectrum_4.setHidden(false)
    #if @spectrum_congrats == true
      mp 'showing spectrum 4 rewards page!'
      view_object.addSpectrum4rewardspageAnimationReverse(false, totalDuration: 0.75)
      #else
      #end
      cueserver.helix_nebula
  end
  
  def reset_elements
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum4_hydrogen_correct = false
    $spectrum4_oxygen_correct = false
  end
  
  def reset
    view_object.removeAllAnimations
    #background_video_spectrum_4  
    
    @spectrum_4_correct = false
    @spectrum_congrats = false

    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    @hydrogen_answered = false
    @oxygen_answered = false
    
    $spectrum4_hydrogen_correct = false
    $spectrum4_oxygen_correct = false
    
    $answer_box_showing = false
  end
  
end