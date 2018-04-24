require 'json'

class Metasploit

  def parse(xml,threshold)
    vulns = Hash.new
    vulns["findings"] = []

    doc = Nokogiri::XML(xml)
    doc.css('//hosts/host').each do |hostnode|
        findings = Array.new

        host = hostnode.css("/name").text.to_s

        hostnode.css("/vulns/vuln").each do |issue|
          # create a temporary finding object
            finding = Finding.new()
            finding.title = issue.css('name').text.to_s()
            finding.overview = issue.css('info').text.to_s()
            findings << finding.to_hash
        end
        vulns[host] = findings

    end

    #vulns["findings"] = uniq_findings(findings)
    return vulns.to_json
  end

end