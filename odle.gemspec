Gem::Specification.new do |s|
  s.name        = 'odle'
  s.version     = '0.0.7'
  s.date        = '2018-05-13'
  s.summary     = 'odle'
  s.description = 'An easy to use security data parsing tool. Takes in data from different tools and outputs standardized JSON.'
  s.authors     = ['Will Vandevanter']
  s.email       = 'will@silentrobots.com'
  s.require_paths = ['lib', 'lib/parsers', 'lib/model']
  s.executables   = ['odle']
  s.files         = ['lib/odle.rb', 'lib/parsers/burp.rb', 'lib/parsers/nessus.rb', 'lib/parsers/msfv5.rb', 'lib/parsers/nmap.rb', 'lib/model/data.rb']
  s.homepage    =
    'http://rubygems.org/gems/odle'
  s.license       = 'BSD-3-Clause-Attribution'
end
