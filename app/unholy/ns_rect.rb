class NSRect
  # Alias for size.width
  def width
    size.width
  end

  def width=(v)
    self.size.width = v
  end

  # Alias for size.height
  def height
    size.height
  end

  def height=(v)
    self.size.height = v
  end

  # Alias for origin.x.
  def x
    origin.x
  end

  def x=(v)
    self.origin.x = v
  end

  # Alias for origin.y.
  def y
    origin.y
  end

  def y=(v)
    self.origin.y = v
  end

  # Accesses origin.x + 0.5 * size.width.
  def centerX
    x + width * 0.5
  end

  def centerX=(v)
    self.x = v - width * 0.5
  end

  # Accesses origin.y + 0.5 * size.height.
  def centerY
    y + height * 0.5
  end

  def centerY=(v)
    self.y = v - height * 0.5
  end

  # MARK: edges

  # Alias for origin.x.
  def left
    origin.x
  end

  def left=(v)
    self.origin.x = v
  end

  # Accesses origin.x + size.width.
  def right
    x + width
  end

  def right=(v)
    self.x = v - width
  end

  # Alias for origin.y.
  def top
    y
  end

  def top=(v)
    self.y = v
  end

  # Accesses origin.y + size.height.
  def bottom
    y + height
  end

  def bottom=(v)
    self.y = v - height
  end

  # MARK: points

  # Accesses the point at the top left corner.
  def topLeft
    CGPointMake(left, top)
  end

  def topLeft=(v)
    self.left = v.x
    self.top = v.y
  end

  # Accesses the point at the middle of the top edge.
  def topCenter
    CGPointMake(centerX, top)
  end

  def topCenter=(v)
    self.centerX = v.x
    self.top = v.y
  end

  # Accesses the point at the top right corner.
  def topRight
    CGPointMake(right, top)
  end

  def topRight=(v)
    self.right = v.x
    self.top = v.y
  end

  # Accesses the point at the middle of the left edge.
  def centerLeft
    CGPointMake(left, centerY)
  end

  def centerLeft=(v)
    self.left = v.x
    self.centerY = v.y
  end

  # Accesses the point at the center.
  def center
    CGPointMake(centerX, centerY)
  end

  def center=(v)
    self.centerX = v.x
    self.centerY = v.y
  end

  # Accesses the point at the middle of the right edge.
  def centerRight
    CGPointMake(right, centerY)
  end

  def centerRight=(v)
    self.right = v.x
    self.centerY = v.y
  end

  # Accesses the point at the bottom left corner.
  def bottomLeft
    CGPointMake(left, bottom)
  end

  def bottomLeft=(v)
    self.left = v.x
    self.bottom = v.y
  end

  # Accesses the point at the middle of the bottom edge.
  def bottomCenter
    CGPointMake(centerX, bottom)
  end

  def bottomCenter=(v)
    self.centerX = v.x
    self.bottom = v.y
  end

  # Accesses the point at the bottom right corner.
  def bottomRight
    CGPointMake(right, bottom)
  end

  def bottomRight=(v)
    self.right = v.x
    self.bottom = v.y
  end

end
