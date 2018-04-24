require 'json'

class Host
    attr_accessor :ip, :port
end

class Finding
    attr_accessor :title,:id,:effort,:type,:dread_total,:overview,:poc,:remediation,:notes,:assessment_type,:references,:risk,:damage,:reproducability,:exploitability,:affected_users,:discoverability,:av,:ac,:au,:c,:i,:a,:e,:rl,:rc,:cdp,:td,:cr,:ir,:ar,:cvss_base,:cvss_impact,:cvss_exploitability,:cvss_temporal,:cvss_environmental,:cvss_modified_impact,:cvss_total,:ease,:c2_vs,:attack_vector,:attack_complexity,:privileges_required,:user_interaction,:scope_cvss,:confidentiality,:integrity,:availability,:exploit_maturity,:remeditation_level,:report_confidence,:confidentiality_requirement,:integrity_requirement,:availability_requirement,:mod_attack_vector,:mod_attack_complexity,:mod_privileges_required,:mod_user_interaction,:mod_scope,:mod_confidentiality,:mod_integrity,:mod_availability,:cvss_base_score,:cvss_impact_score,:cvss_mod_impact_score,:c3_vs,:severity,:likelihood,:severity_rationale,:likelihood_rationale,:affected_hosts

    def to_hash
        hash = {}
        self.instance_variables.each do |var|
        	#p var.to_s.gsub("@","")
            hash[var.to_s.gsub("@","").gsub("\"","")] = self.instance_variable_get var
        end
        return hash
    end
end
