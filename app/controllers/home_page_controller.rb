class HomePageController < QCController
      attr_reader :cueserver, :planar_sl
  
  def view_object
    @_view_object ||= UserInterface.alloc.initWithFrame(window_frame)
  end
  
  def startup
    super
    mp 'starting up!!'
    @cueserver = CueServer.new
    $home_video_view = AVPlayerView.alloc.init
    $home_video_view.frame = @window.frame
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
  
  def background_video_home   
    @_home_video ||= begin
      #v = AVPlayer.alloc.initWithPlayerItem(FileHelper.file_url('spectrum_2_movie_layer.mov'))
      #v = AVPlayer.alloc.init
      url = FileHelper.file_url('Home_screen.mov')
      mp "video url is #{url}"
      item = AVPlayerItem.playerItemWithURL(url)
      
      $home_video = AVPlayer.alloc.initWithPlayerItem(item)
      $home_video_view.player = $home_video
      $home_video_view.controlsStyle = AVPlayerViewControlsStyleNone
      video_view.addSubview($home_video_view)
    end
  end
  
  def get_length
    value = $home_video_view.player.currentItem.asset.duration.value
    timescale = $home_video_view.player.currentItem.asset.duration.timescale
    [value, timescale]
  end
  
  def get_current_time
    value = $home_video_view.player.currentTime.value
    timescale = $home_video_view.player.currentTime.timescale
    [value, timescale]
  end
  
  def home_screen_appear
    mp "lets get this show on the road"
    background_video_home
    view_object.addHomescreenappearAnimationReverse(false, totalDuration: 0.75)
    @elements_compared = false
    cueserver.helium
  end
  
  def element_compare
    mp 'comparing the elements'
    if @elements_compared == true
      view_object.addSpectrajointogetherAnimationReverse(true, totalDuration: 0.75)
      @elements_compared = false
    else     
      view_object.addSpectrajointogetherAnimationReverse(false, totalDuration: 0.75)
      @elements_compared = true
    end
  end
  
  def element_compare1
    mp 'comparing the elements'
    if @elements_compared1 == true
      view_object.addSpectrajointogether1AnimationReverse(true, totalDuration: 0.75)
      @elements_compared1 = false
    else     
      view_object.addSpectrajointogether1AnimationReverse(false, totalDuration: 0.75)
      @elements_compared1 = true
    end
  end
  
  def element_compare2
    mp 'comparing the elements'
    if @elements_compared2 == true
      view_object.addSpectrajointogether2AnimationReverse(true, totalDuration: 0.75)
      @elements_compared2 = false
    else     
      view_object.addSpectrajointogether2AnimationReverse(false, totalDuration: 0.75)
      @elements_compared2 = true
    end
  end
  
  def element_compare3
    mp 'comparing the elements'
    if @elements_compared3 == true
      view_object.addSpectrajointogether3AnimationReverse(true, totalDuration: 0.75)
      @elements_compared3 = false
    else     
      view_object.addSpectrajointogether3AnimationReverse(false, totalDuration: 0.75)
      @elements_compared3 = true
    end
  end
  
  def element_compare4
    mp 'comparing the elements'
    if @elements_compared4 == true
      view_object.addSpectrajointogether4AnimationReverse(true, totalDuration: 0.75)
      @elements_compared4 = false
    else     
      view_object.addSpectrajointogether4AnimationReverse(false, totalDuration: 0.75)
      @elements_compared4 = true
    end
  end
  
  def element_compare5
    mp 'comparing the elements'
    if @elements_compared5 == true
      view_object.addSpectrajointogether5AnimationReverse(true, totalDuration: 0.75)
      @elements_compared5 = false
    else     
      view_object.addSpectrajointogether5AnimationReverse(false, totalDuration: 0.75)
      @elements_compared5 = true
    end
  end
  
end
