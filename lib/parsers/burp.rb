require 'json'

  class Burp
    
    def parse(xml,threshold)
    vulns = Hash.new
    findings = Array.new
    vulns["findings"] = []

    doc = Nokogiri::XML(xml)
    doc.css('//issues/issue').each do |issue|
      if issue.css('severity').text
        # create a temporary finding object
        finding = Finding.new()
        finding.title = issue.css('name').text.to_s()
        finding.overview = issue.css('issueBackground').text.to_s()+issue.css('issueDetail').text.to_s()
        finding.remediation = issue.css('remediationBackground').text.to_s()

        if issue.css('severity').text == 'Low'
          finding.risk = 1
        elsif issue.css('severity').text == 'Medium'
          finding.risk = 2
        elsif issue.css('severity').text =='High'
          finding.risk = 3
        else
          finding.risk = 1
        end

    
        finding.type = "Web Application"

        findings << finding

        host = issue.css('host').text
        ip = issue.css('host').attr('ip')
        id = issue.css('type').text
        hostname = "#{host}"

        finding.affected_hosts = "#{host} (#{ip})"

        finding.id = id
        if vulns[hostname]
          vulns[hostname] << finding.to_hash
        else
          vulns[hostname] = []
          vulns[hostname] << finding.to_hash
        end
      end
    end

    #vulns["findings"] = uniq_findings(findings)
    return vulns.to_json
    end

  end
