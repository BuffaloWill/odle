require 'json'

class Nessus

  def parse(xml,threshold)
    vulns = Hash.new
    findings = Array.new
    items = Array.new

    doc = Nokogiri::XML(xml)

    doc.css("//ReportHost").each do |hostnode|
  
      if (hostnode["name"] != nil)
        host = hostnode["name"]
      end
    
      hostnode.css("ReportItem").each do |itemnode|
    
        if (itemnode["port"].to_s != "0" && itemnode["severity"] >= threshold)

          # create a temporary finding object
          finding = Finding.new()
          finding.title = itemnode['pluginName'].to_s()
          finding.overview = itemnode.css("description").to_s()
          finding.remediation = itemnode.css("solution").to_s()

          # can this be inherited from an import properly?
          finding.type = "Imported"
          finding.risk = itemnode["severity"]
          finding.affected_hosts = hostnode["name"]
          if itemnode.css("plugin_output")
            finding.notes = hostnode["name"]+" ("+itemnode["protocol"]+ " port " + itemnode["port"]+"):"+itemnode.css("plugin_output").to_s()
          end

          finding.references = itemnode.css("see_also").to_s
          finding.id = itemnode['pluginID'].to_s()

          vulns[hostname] << finding.to_hash
          items << itemnode['pluginID'].to_s()
        end
      end

  #    vulns[host] = findings
      items = []
    end

    return vulns.to_json
  end

end