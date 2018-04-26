# odle (/_oh·dul_/)

odle is a Ruby gem and binary that takes various XML data from security tools and outputs their JSON equivalent. The goal is to be (1) simple, (2) fast, and (3) work on many platforms with only one dependency -- nokogiri. 

![Example Usage](https://i.imgur.com/rhHBwew.gif)

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

json_d = Metasploit.new().parse("./msf_export.xml","0")
```

# Data In, Data Out

Odle takes in data (mostly XML) and outputs a JSON hash coordinated by hosts. Each host in the hash contains an array of findings (i.e. vulnerabilities) from the data. See the wiki page for more details. 

# Supported Inputs

| Name          			| Version(s)    |
| ------------- 			| ------------- |
| Metasploit XML Export     | v5 			|
| BurpSuite XML Export      | Unknown 		|
| Nessus        			| v2 			|
