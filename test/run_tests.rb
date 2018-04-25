require 'minitest/autorun'
require 'nokogiri'
require 'json'
require 'odle'

describe 'burp parser' do
	before do
		@data = JSON.parse(Burp.new().parse(File.open("./test/data/serpico-test-data-burp-2015.xml"),"0"))
	end

	it 'check host number' do
		8.must_equal @data.length
	end

	it 'check findings number' do
		fn = 0
		@data.each do |host|
			fn = fn + host.length
		end
		16.must_equal fn
	end

end

describe 'nessus parser' do
	before do
		@nd = JSON.parse(Nessus.new().parse(File.open("./test/data/nessus_v2.xml"),"0"))
	end

	it 'check host number' do
		1.must_equal @nd.length
	end

	it 'check findings number' do
		fn = 0
		@nd.each do |host|
			fn = fn + host.length
		end
		2.must_equal fn
	end

end

describe 'msf parser' do
	before do
		@msf = JSON.parse(Metasploit.new().parse(File.open("./test/data/serpico-test-data-msf.xml"),"0"))
	end

	it 'check host number' do
		1.must_equal @nd.length
	end

	it 'check findings number' do
		fn = 0
		@nd.each do |host|
			fn = fn + host.length
		end
		2.must_equal fn
	end

end