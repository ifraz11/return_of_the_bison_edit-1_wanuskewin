class FlippedNSView < NSView
  def isFlipped
    true
  end

  def image_view(image_name, alpha = 1.0, klass = NSImageView)
    klass.alloc.initWithFrame(frame).tap do |iv|
      iv.image = NSImage.imageNamed(image_name)
      iv.imageScaling = NSScaleToFit
      iv.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable
      iv.alphaValue = alpha
      # For more performant animations
      iv.wantsLayer = true
      iv.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay
    end
  end
end
