module Fading
  ANIMATION_TIME = 0.5
  
  def fade_in(fading_view, &block)
    fading_view.alphaValue = 0.0
    fading_view.setHidden(false)

    NSAnimationContext.runAnimationGroup(lambda do |context|
      context.duration = ANIMATION_TIME
      fading_view.animator.alphaValue = 1.0
    end, completionHandler: lambda do
      block.call if block
    end)
  end

  def fade_out(fading_view, &block)
    fading_view.alphaValue = 1.0
    fading_view.setHidden(false)

    NSAnimationContext.runAnimationGroup(lambda do |context|
      context.duration = ANIMATION_TIME
      fading_view.animator.alphaValue = 0.0
    end, completionHandler: lambda do
      fading_view.setHidden(true)
      block.call if block
    end)
  end

  def crossfade(from_view, to_view, &block)
    to_view.alphaValue = 1.0
    to_view.setHidden(false)

    NSAnimationContext.runAnimationGroup(lambda do |context|
      context.duration = ANIMATION_TIME

      from_view.animator.alphaValue = 0.5
      to_view.animator.alphaValue = 0.5
    end, completionHandler: lambda do
      from_view.setHidden(true)

      from_view.stop if from_view.respond_to?(:stop)
      to_view.play if to_view.respond_to?(:play)
      block.call if block
    end)
  end
end
