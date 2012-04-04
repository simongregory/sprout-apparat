class CoverageServer
  def initialize(server)
    @server = server
    @run = ""
    start
  end

  def start
    client = @server.accept

    client.puts("<startOfTestRunAck/>\x00")

    while (line = client.gets("\x00").chomp("\x00"))

      if line == '<policy-file-request/>'
        client.puts policy_file
      end

      break if line  == '<endOfTestRun/>'
      @run << line
    end

    client.puts("<endOfTestRunAck/>\x00")
    client.close

    @server.close

    puts @run.to_s
  end

  def policy_file
  <<-EOF
<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM "http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd">
<cross-domain-policy>
  <allow-access-from domain=\"*\" to-ports=\"#{port}\"/>
</cross-domain-policy>
EOF
  end

end
