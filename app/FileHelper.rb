class FileHelper

  # CHANGE THIS TO THE DIRECTORY WHERE THE VIDEOS ARE
  PATH = "~/Desktop/_lowell_assets/"
  # PATH = "~/Box/Project Files - Design/LOW - Kei Lowell AV_LX Design/07-Programmer Files/Rotary Encoder 2.0/After Effects/Video Files/"

  class << self
    
    def file_url(name)
      full_path = PATH + name
      NSURL.fileURLWithPath(full_path.stringByExpandingTildeInPath, isDirectory: false)
    end
    
    def get_video_item_from_path(path)
      # make_file_list
      mp "video path is #{path}"
      url = NSURL.fileURLWithPath(path)
      AVPlayerItem.playerItemWithURL(url)
    end

  end
end
