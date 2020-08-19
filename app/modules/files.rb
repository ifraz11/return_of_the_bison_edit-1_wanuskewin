module Files
  def file(name, extension)
    NSBundle.mainBundle.URLForResource(name, withExtension:extension)
  end  
end
