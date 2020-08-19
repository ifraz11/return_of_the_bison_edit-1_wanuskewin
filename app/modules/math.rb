module Math
  def centered_rect_in_rect(innerRect, outerRect)
    innerRect = CGRectMake(innerRect.first.first, innerRect.first.last, innerRect.last.first, innerRect.last.last) if innerRect.is_a?(Array)
    outerRect = CGRectMake(outerRect.first.first, outerRect.first.last, outerRect.last.first, outerRect.last.last) if outerRect.is_a?(Array)

    innerRect.origin.x = outerRect.origin.x + ((outerRect.size.width - innerRect.size.width) / 2.0).floor
    innerRect.origin.y = outerRect.origin.y + ((outerRect.size.height - innerRect.size.height) / 2.0).floor
    innerRect
  end

  def centered_vertically_in_rect(innerRect, outerRect)
    innerRect = CGRectMake(innerRect.first.first, innerRect.first.last, innerRect.last.first, innerRect.last.last) if innerRect.is_a?(Array)
    outerRect = CGRectMake(outerRect.first.first, outerRect.first.last, outerRect.last.first, outerRect.last.last) if outerRect.is_a?(Array)

    innerRect.origin.x = outerRect.origin.x + ((outerRect.size.width - innerRect.size.width) / 2.0).floor
    innerRect
  end
end
