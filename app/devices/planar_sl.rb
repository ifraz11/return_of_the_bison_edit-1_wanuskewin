# Planar SL4851 & SL4143

class PlanarSL
  
  SCREEN_IPS = [
    "10.10.224.153", #trappers
    #"192.168.175.176" #wop may
  ]
  
  PORT = 5000

  def screen_set_to_100
    send_command_to_all "\x38\x30\x32\x73\x24\x30\x35\x30\x0D"
  end
  
  def screen_set_to_50
    send_command_to_all "\x38\x30\x32\x73\x24\x30\x35\x30\x0D"
  end
  
  def screen_set_to_25
    send_command_to_all "\x38\x30\x32\x73\x24\x30\x32\x35\x0D"
  end
  
  def screen_set_to_15
    send_command_to_all "\x38\x30\x32\x73\x24\x30\x31\x35\x0D"
  end
  
  def send_command_to_all(command)
    SCREEN_IPS.each do |ip|

      bytes = command.each_byte.to_a

      ns_data = NSMutableData.new
      bytes.each do |byte|
        p = Pointer.new(:int, 1)
        p[0] = byte
        ns_data.appendBytes(p, length:1)
      end


      send_command(ns_data, ip)
    end
  end
  
  def send_command(command, ip)
    socket = TCPSender.new
    socket.init_with_host(ip, PORT)
    NSLog "sending #{command} to #{ip}, #{PORT}"
    socket.send_raw_request(command)
  end
  
end
