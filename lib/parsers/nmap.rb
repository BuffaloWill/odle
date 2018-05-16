require 'json'

class Nmap

  def parse(xml,threshold)
    vulns = Hash.new
    findings = Array.new
    items = Array.new

    doc = Nokogiri::XML(xml)

    #p doc
    doc.css("//host").each do |hostnode|
      address = hostnode.css("address")
      host = address.attr("addr")
      host = " " unless host
      vulns[host] = []
      affected_hosts = ""

      hostnode.css("/hostnames").each do |hname|
        hostname = hname.attr("hostname")

        hname.traverse do |x|
          if x.values[0] 
            if affected_hosts == ""
              affected_hosts = x.values[0] 
            else
              affected_hosts = affected_hosts + " " + x.values[0]         
            end
          end
      end

      # finding is one per host
      finding = Finding.new()
      finding.affected_hosts = affected_hosts
      vulns[host] << finding.to_hash                

      # finding is one per open port
      hostnode.css("/ports/port").each do |port|
        proto = port.attr("protocol")
        portid = port.attr("portid")
        state = port.css("/state").attr("state").value 
        service = port.css("/service").attr("name").value 

        # iterate the state
        finding = Finding.new()
        finding.affected_hosts = affected_hosts

        # if a script was run, grab the results
        if port.css("/script").size > 0 
          finding.title = "Script Scan:"+port.css("/script").attr("id").value+" [#{state} #{portid} (#{service})]"
          finding.overview = port.css("/script").attr("output").value
          vulns[host] << finding.to_hash                
        else
          if state == "open"
            finding.title = "Open port [#{state} #{portid} (#{service})]"
            vulns[host] << finding.to_hash                
          end
        end

      end
      end

      items = []
    end

    return vulns.to_json
  end

end