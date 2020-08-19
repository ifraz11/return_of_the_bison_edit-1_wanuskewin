class Spectrum3PageController < QCController
      attr_reader :cueserver
  
  def view_object
    @_view_object ||= Spectrum3Page.alloc.initWithFrame(window_frame)
  end
  
  @spectrum_3_correct = false
  @spectrum_3_congrats = false
  
  def startup
    super
    mp 'starting up!!'
   @cueserver = CueServer.new
   # @av_player_layer = AVPlayerLayer.playerLayerWithPlayer(@av_player)
   # @av_player_layer.frame = [[0, 0], [1920, 1080]]
   $reward_video_3_view = AVPlayerView.alloc.init
   $reward_video_3_view.frame = @window.frame

   $spectrum_3_selection_video_view = AVPlayerView.alloc.init
   $spectrum_3_selection_video_view.frame = @window.frame

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
  
  def background_video_spectrum_3
    
    @_spectrum_3_selection_video ||= begin
      #v = AVPlayer.alloc.initWithPlayerItem(FileHelper.file_url('spectrum_2_movie_layer.mov'))
      #v = AVPlayer.alloc.init
      url = FileHelper.file_url('Absorption_1.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $spectrum_3_selection_video = AVPlayer.alloc.initWithPlayerItem(item)
      $spectrum_3_selection_video_view.player = $spectrum_3_selection_video
      $spectrum_3_selection_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($spectrum_3_selection_video_view)
    end
    $spectrum_3_selection_video_view.alphaValue = 1.0
    $reward_video_3_view.alphaValue = 0.0
  end
  
  def get_length
    value = $spectrum_3_selection_video_view.player.currentItem.asset.duration.value
    timescale = $spectrum_3_selection_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $spectrum_3_selection_video_view.player.currentTime.value
    timescale = $spectrum_3_selection_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reward_video_spectrum_3
    
    @_reward_video_spectrum_3 ||= begin
      url = FileHelper.file_url('spectrum_3_movie_layer.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $reward_video_3 = AVPlayer.alloc.initWithPlayerItem(item)
      $reward_video_3_view.player = $reward_video_3
      video_view.addSubview($reward_video_3_view)
    end
    $spectrum_3_selection_video_view.alphaValue = 0.0
    $reward_video_3_view.alphaValue = 1.0
  end
  
  def get_length_reward
    value = $reward_video_3_view.player.currentItem.asset.duration.value
    timescale = $reward_video_3_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time_reward
    value = $reward_video_3_view.player.currentTime.value
    timescale = $reward_video_3_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def spectrum3_page_appear
    mp "going to spectrum_3 page"
    view_object.addSpectrum3appearAnimationReverse(false, totalDuration: 0.75)
    background_video_spectrum_3
    #$spectrum_selection_video_view.alphaValue = 1.0
    #$reward_video_view.alphaValue = 0.0
    #view_object.addSodiumrighttocentreAnimationReverse(false, totalDuration: 0.75)
    cueserver.sodium
  end
  
  
  def sodium_centre
    return if $answer_box_showing  
    mp 'sodium to centre' 
    
    if @calcium_in_centre == true
   #   view_object.addCalciumcentretorightAnimationReverse(false, totalDuration: 0.75)
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
   #   view_object.addHydrogencentretorightAnimationReverse(false, totalDuration: 0.75)
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
   #   view_object.addHeliumcentretorightAnimationReverse(false, totalDuration: 0.75)
    else
   #   view_object.addHydrogenrighttocentreAnimationReverse(false, totalDuration: 0.75)
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
    #  view_object.addCarboncentretorightAnimationReverse(false, totalDuration: 0.75)  
    else
    #  view_object.addHeliumrighttocentreAnimationReverse(false, totalDuration: 0.75) 
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
    #  view_object.addOxygenrighttocentreAnimationReverse(false, totalDuration: 0.75)  
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
          mp "Hydrogen Text Box going away"
          view_object.addCorrectanswerhydrogenspectrum3AnimationReverse(true, totalDuration: 0.75)
          $answer_box_showing = false
          @hydrogen_answered = false
        else
          mp "Hydrogen Text Box coming in"
          view_object.addCorrectanswerhydrogenspectrum3AnimationReverse(false, totalDuration: 0.75)
          view_object.addSideelementhydrogenappearAnimationReverse(false, totalDuration: 0.75)
          @hydrogen_answered = true
          $spectrum3_hydrogen_correct = true
          if $spectrum3_helium_correct == true
            $spectrum3_screen_displaying = false
          else
          end
        end
      elsif @helium_in_centre == true
        if @helium_answered == true
          mp "Helium Text Box going away"
          view_object.addCorrectanswerheliumspectrum3AnimationReverse(true, totalDuration: 0.75)
          $answer_box_showing = false
          @helium_answered = false
        else
          mp "Helium Text Box coming in"
          view_object.addCorrectanswerheliumspectrum3AnimationReverse(false, totalDuration: 0.75)
          view_object.addSideelementheliumappearAnimationReverse(false, totalDuration: 0.75)
          $spectrum3_helium_correct = true
          @helium_answered = true
          if $spectrum3_hydrogen_correct == true
            $spectrum3_screen_displaying = false
          else
          end
        end
        #screen_displaying
      elsif $spectrum3_hydrogen_correct == true && $spectrum3_helium_correct == true
          $spectrum3_screen_displaying = false
      else
        if @spectrum_3_incorrect == true
          view_object.addIncorrectanswerspectrum3AnimationReverse(true, totalDuration: 0.75)
          $answer_box_showing = false
          @spectrum_3_incorrect = false
        else
          mp 'better luck next time potter!'
          view_object.addIncorrectanswerspectrum3AnimationReverse(false, totalDuration: 0.75)
          @spectrum_3_incorrect = true
        end
      end
  end
  
  
  def congrats_page_appear
      reset_elements
     #if @spectrum_congrats == true
       #rewards_page_appear
       #else
       cueserver.spectrum_3
       mp 'showing spectrum 3 congrats page!'
       view_object.addSpectrum3congratspageAnimationReverse(false, totalDuration: 0.75)
       #@spectrum_2_congrats = true
       #end
  end
  
  def rewards_page_appear
      reward_video_spectrum_3
                             
      #reward_video_spectrum_3.setHidden(false)
    #if @spectrum_congrats == true
      mp 'showing spectrum 3 rewards page!'
      view_object.addSpectrum3rewardspageAnimationReverse(false, totalDuration: 0.75)
      #else
      #end
      cueserver.rigel
  end
  
  def reset_elements
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum3_helium_correct = false
    $spectrum3_hydrogen_correct = false
  end
  
  def reset
    view_object.removeAllAnimations
   # background_video_spectrum_3
    
    @spectrum_3_correct = false
    @spectrum_congrats = false
    
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum3_helium_correct = false
    $spectrum3_hydrogen_correct = false
    
    @hydrogen_answered = false
    @helium_answered = false
    
    $answer_box_showing = false
  end
  
end