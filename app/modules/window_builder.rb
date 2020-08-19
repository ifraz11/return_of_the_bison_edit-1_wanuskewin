module WindowBuilder
  def view
    @main_window.contentView
  end

  private

  def build_window
    width = NSApp.delegate.windowed ? 1920 / 2 : 1920
    height = NSApp.delegate.windowed ? 1080 / 2 : 1080

    if NSApp.delegate.windowed
      @main_window = NSWindow.alloc.initWithContentRect(NSMakeRect(0, 0, width, height),
        styleMask: centered_style_mask,
        backing: NSBackingStoreBuffered,
        defer: false)
    else
      @main_window = NSWindow.alloc.initWithContentRect(NSMakeRect(0, 0, width, height),
        styleMask: fullsize_style_mask,
        backing: NSBackingStoreBuffered,
        defer: false)
    end

    @main_window.tap do |mw|
      mw.collectionBehavior = NSWindowCollectionBehaviorFullScreenPrimary
      mw.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
      mw.delegate = self
      mw.setContentMinSize(NSMakeSize(width, height))
      mw.setAspectRatio(@main_window.frame.size)
      mw.orderFrontRegardless
    end

    if NSApp.delegate.windowed
      center_window
    else
      fullsize_window
    end
  end

  def fullsize_style_mask
    NSBorderlessWindowMask
  end

  def centered_style_mask
    NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask
  end

  def fullsize_window
    presentation_options = NSApplicationPresentationHideDock | NSApplicationPresentationHideMenuBar
    NSApp.setPresentationOptions(presentation_options)

    @main_window.setLevel(NSScreenSaverWindowLevel + 1)
    @main_window.setCollectionBehavior(NSWindowCollectionBehaviorFullScreenPrimary)
    @main_window.setFrame(NSMakeRect(0, 0, NSWidth(@main_window.frame), NSHeight(@main_window.frame)), display:true)
  end

  def center_window
    xPos = NSWidth(@main_window.screen.frame)/2 - NSWidth(@main_window.frame)/2
    yPos = NSHeight(@main_window.screen.frame)/2 - NSHeight(@main_window.frame)/2
    @main_window.setFrame(NSMakeRect(xPos, yPos, NSWidth(@main_window.frame), NSHeight(@main_window.frame)), display:true)
  end
  
end
