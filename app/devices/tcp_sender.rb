class TCPSender
  def init_with_host(host, port)
    p "connecting to #{host}, #{port}"
    @client = FastSocket.alloc.initWithHost(host, andPort: port.to_s)
    @client.connect(2)
    mp "@client.isConnected #{@client.isConnected}"
  end
  
  def send_request_clock(to_send)
    sent = @client.sendBytes(to_send, count: 18)    
    # p "sent is #{sent} client is #{@client.isConnected}"
  end

  def send_request(to_send)
    mp "value: #{to_send} length: #{to_send.length}"
    data = to_send.dataUsingEncoding(NSUTF8StringEncoding)
    sent = @client.sendBytes(data.bytes, count: data.length)    
    @client.close
  end

  def send_raw_request(data)
    mp "sending raw request"
    mp "value: #{data} length: #{data.length}"
    @client.sendBytes(data.bytes, count: data.length)
    @client.close
  end
  
  def send_request_ascii(to_send)
    mp "value: #{to_send} length: #{to_send.length}"
    data = to_send.dataUsingEncoding(NSASCIIStringEncoding)
    mp "data.length = #{data.length}"
    mp "data.bytes = #{data.bytes}"
    mp "NSString.alloc.initWithData(data, encoding:NSASCIIStringEncoding) #{NSString.alloc.initWithData(data, encoding:NSASCIIStringEncoding)}"
    sent = @client.sendBytes(data.bytes, count: data.length)    
    NSLog "to_send is #{to_send} sent is #{sent} client is #{@client.isConnected}"
    @client.close
  end
end