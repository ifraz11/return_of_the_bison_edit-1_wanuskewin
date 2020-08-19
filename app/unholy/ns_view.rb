class NSView
  def mouseDown(event)
    ScreenSaver.cancel_timer #Add for Screensaver
    if NSApp.delegate.ss_showing == true 
      ScreenSaver.hide_screensaver
    else
      point = self.convertPoint(event.locationInWindow, fromView:nil)
      layer = self.layer.hitTest(NSPointToCGPoint(point))
      NSLog("mouse down!")
      dict = {
        "x" => point.x,
        "y" => point.y,
        "date" => NSDate.date
      }
      NSNotificationCenter.defaultCenter.postNotificationName("phidget_state_change", object:nil, userInfo:dict)
    end
    mp "Mouse Clicked!!!"
  end
end
