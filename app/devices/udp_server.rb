class UDPServer
  
  def initialize(port, multicast_ip)
    @port = port
    @multicast_ip = multicast_ip
    # @interface = interface
    start_udp_gdc_server
    #@cmd_processor = CmdProcessor.new
  end

  def start_udp_gdc_server
    @socket = GCDAsyncUdpSocket.alloc.initWithDelegate(self, delegateQueue:Dispatch::Queue.main.dispatch_object)
    $term = GCDAsyncSocket.CRData
    error = Pointer.new(:object)
    unless @socket.bindToPort(@port, error:error)
      p "error #{error[0].localizedDescription}"
    end
    unless @socket.joinMulticastGroup(@multicast_ip, error:error)
      p "error #{error[0].localizedDescription}" 
    end
    p "UDP Server socket Created on port #{@socket.localPort}, #{@socket.localAddress_IPv4}"
    @socket.beginReceiving(error)
    true
  end

  def udpSocket(sock, didReceiveData:data, fromAddress:address, withFilterContext:context )
    line = NSString.stringWithUTF8String(data.bytes)
    #occasionally line comes back as some random value (maybe nil.). Not sure why this is but I need to protect against this.
    mp "line is #{line}"
    unless line == nil
      mp "#{line[0, data.length]} - length = #{data.length} - line length = #{line.length},
from address #{address}"
      send_line(line[0, data.length])
    end
  end
  
  def send_line(data)
    CmdProcessor.process_command(data)
    #data = [info]
    #$center.postNotificationName("data_recieved_notification", object:self, userInfo:data)
    # p "posted notification with #{info}"
  end
  
  def udpSocketDidClose(sock, withError:error)
    p "disconnected with #{error}"
  end

end