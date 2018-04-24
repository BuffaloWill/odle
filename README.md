# odle (/_oh·dul_/)

odle is a Ruby gem and binary that takes various XML data from security tools and outputs their JSON equivalent. The goal is to be (1) simple, (2) fast, and (3) work on many platforms with only one dependency -- nokogiri. 

# Installation
odle has been tested on different versions of Ruby so the one available in your package manager will probably work. Anything Ruby 2+ is a safe bet. 

```
# make sure Ruby is installed first, then
gem install odle
```

# Example Usage
There are lots of examples on this page (link), but here are two simple examples.

## CLI

```
cat burp.xml | odle --burp 
```

## Ruby gem

```
require 'odle'

json_d = Metasploit.new().parse("./msf_export.xml")
```

# Data In, Data Out

Odle takes in data (mostly XML) and outputs a JSON hash coordinated by hosts. Each host in the hash contains an array of findings (i.e. vulnerabilities) from the data. See the wiki page for more details. 

# Supported Inputs

| Name          			| Version(s)    |
| ------------- 			| ------------- |
| Metasploit XML Export     | v5 			|
| BurpSuite XML Export      | Unknown 		|
| Nessus        			| v2 			|

If you want odle to support SECURITY_TOOL_X, we probably do too. Here is how you can help:

- Legally scan some public assets
- Export the data as XML
- create an issue
- Attach the results exported as XML (or a file format we can handle)
- Your issue must include a data sample from the tool or we will close the issue. If you would like to encrypt the data before upload, directions are here (link).
- Expected conversion results will also really help us (Total Hosts: N, Total Findings: M, etc.)

