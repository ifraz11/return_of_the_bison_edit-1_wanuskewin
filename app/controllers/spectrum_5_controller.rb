class Spectrum5PageController < QCController
        attr_reader :cueserver
  
  def view_object
    @_view_object ||= Spectrum5Page.alloc.initWithFrame(window_frame)
  end
  
  @spectrum_5_correct = false
  @spectrum_5_congrats = false
  
  def startup
    super
    mp 'starting up Spectrum 5!!'
   @cueserver = CueServer.new
   # @av_player_layer = AVPlayerLayer.playerLayerWithPlayer(@av_player)
   # @av_player_layer.frame = [[0, 0], [1920, 1080]]
   $reward_video_5_view = AVPlayerView.alloc.init
   $reward_video_5_view.frame =  @window.frame
   #
   $spectrum_5_selection_video_view = AVPlayerView.alloc.init
   $spectrum_5_selection_video_view.frame = @window.frame

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
  
  def background_video_spectrum_5
   
    @_spectrum_5_selection_video ||= begin
      url = FileHelper.file_url('Absorption_1.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $spectrum_5_selection_video = AVPlayer.alloc.initWithPlayerItem(item)
      $spectrum_5_selection_video_view.player = $spectrum_5_selection_video
      $spectrum_5_selection_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($spectrum_5_selection_video_view)
    end
    $spectrum_5_selection_video_view.alphaValue = 1.0
    $reward_video_5_view.alphaValue = 0.0
  end
  
  def get_length
    value = $spectrum_5_selection_video_view.player.currentItem.asset.duration.value
    timescale = $spectrum_5_selection_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $spectrum_5_selection_video_view.player.currentTime.value
    timescale = $spectrum_5_selection_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def reward_video_spectrum_5
    
    @_reward_video_spectrum_5 ||= begin
      url = FileHelper.file_url('spectrum_5_movie_layer.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $reward_video_5 = AVPlayer.alloc.initWithPlayerItem(item)
      $reward_video_5_view.player = $reward_video_5
      video_view.addSubview($reward_video_5_view)
    end
    $spectrum_5_selection_video_view.alphaValue = 0.0
    $reward_video_5_view.alphaValue = 1.0
  end
  
  def get_length_reward
    value = $reward_video_5_view.player.currentItem.asset.duration.value
    timescale = $reward_video_5_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time_reward
    value = $reward_video_5_view.player.currentTime.value
    timescale = $reward_video_5_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def spectrum5_page_appear
    mp "going to spectrum_5 page"
    view_object.addSpectrum5appearAnimationReverse(false, totalDuration: 0.75)
    background_video_spectrum_5
    #background_video_spectrum_5.setHidden(false)
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
        mp "Hydrogen going away"
        view_object.addCorrectanswerhydrogenspectrum5AnimationReverse(true, totalDuration: 0.75)
        view_object.addElement1hideAnimationReverse(false, totalDuration: 0.75)
        $answer_box_showing = false
        @hydrogen_answered = false
      else
        mp "Hydrogen coming in"
        view_object.addCorrectanswerhydrogenspectrum5AnimationReverse(false, totalDuration: 0.75)
        #view_object.addElement1hideAnimationReverse(false, totalDuration: 0.75)
        view_object.addSideelementhydrogenappearAnimationReverse(false, totalDuration: 0.75)
        @hydrogen_answered = true
        $spectrum5_hydrogen_correct = true
        if $spectrum5_sodium_correct == true && $spectrum5_calcium_correct == true
          $spectrum5_screen_displaying = false
        else
        end
      end
    elsif @sodium_in_centre == true
      if @sodium_answered == true
        view_object.addCorrectanswersodiumspectrum5AnimationReverse(true, totalDuration: 0.75)
        view_object.addElement2hideAnimationReverse(false, totalDuration: 0.75)
        $answer_box_showing = false
        @sodium_answered = false
      else
        view_object.addCorrectanswersodiumspectrum5AnimationReverse(false, totalDuration: 0.75)
        #view_object.addElement2hideAnimationReverse(false, totalDuration: 0.75)
        view_object.addSideelementsodiumappearAnimationReverse(false, totalDuration: 0.75)
        @sodium_answered = true
        $spectrum5_sodium_correct = true
        if $spectrum5_hydrogen_correct == true && $spectrum5_calcium_correct == true
          $spectrum5_screen_displaying = false
        else
        end
      end
    elsif @calcium_in_centre == true
      if @calcium_answered == true
        view_object.addCorrectanswercalciumspectrum5AnimationReverse(true, totalDuration: 0.75)
        view_object.addElement3hideAnimationReverse(false, totalDuration: 0.75)
        $answer_box_showing = false
        @calcium_answered = false
      else
        view_object.addCorrectanswercalciumspectrum5AnimationReverse(false, totalDuration: 0.75)
        #view_object.addElement3hideAnimationReverse(false, totalDuration: 0.75)
        view_object.addSideelementcalciumappearAnimationReverse(false, totalDuration: 0.75)
        @calcium_answered = true
        $spectrum5_calcium_correct = true
        if $spectrum5_hydrogen_correct == true && $spectrum5_sodium_correct == true
          $spectrum5_screen_displaying = false
        else
        end
      end
      #screen_displaying
    elsif $spectrum5_hydrogen_correct && $spectrum5_sodium_correct && $spectrum5_calcium_correct == true
        $spectrum5_screen_displaying = false
    else
      if @spectrum_5_incorrect == true
        view_object.addIncorrectanswerspectrum5AnimationReverse(true, totalDuration: 0.75)
        $answer_box_showing = false
        @spectrum_5_incorrect = false
      else
        mp 'better luck next time potter!'
        view_object.addIncorrectanswerspectrum5AnimationReverse(false, totalDuration: 0.75)
        @spectrum_5_incorrect = true
      end
    end
  end
  
  def congrats_page_appear
    reset_elements
     #if @spectrum_congrats == true
       #rewards_page_appear
       #else
       cueserver.spectrum_5
       mp 'showing spectrum 5 congrats page!'
       view_object.addSpectrum5congratspageAnimationReverse(false, totalDuration: 0.75)
       #@spectrum_2_congrats = true
       #end
  end
  
  def rewards_page_appear
      reward_video_spectrum_5
      #reward_video_spectrum_5.setHidden(false)
      #if @spectrum_congrats == true
  
      mp 'showing spectrum 5 rewards page!'
      view_object.addSpectrum5rewardspageAnimationReverse(false, totalDuration: 0.75)
      #else
      #end
      cueserver.sun
  end
  
  def reset_elements
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    $spectrum5_hydrogen_correct = false
    $spectrum5_sodium_correct = false
    $spectrum5_calcium_correct = false
  end
  
  def reset
    view_object.removeAllAnimations
    #background_video_spectrum_5
    
    @spectrum_5_correct = false
    @spectrum_congrats = false
    
    @oxygen_in_centre = false   
    @calcium_in_centre = false
    @sodium_in_centre = false
    @helium_in_centre = false
    @carbon_in_centre = false
    @hydrogen_in_centre = false
    
    @hydrogen_answered = false
    @sodium_answered = false
    @calcium_answered = false
    
    $spectrum5_calcium_correct = false
    $spectrum5_sodium_correct = false
    $spectrum5_hydrogen_correct = false
    
    $answer_box_showing = false
  end
  
end