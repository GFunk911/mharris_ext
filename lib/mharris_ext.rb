glob = File.dirname(__FILE__) + "/mharris_ext/*.rb"
Dir[glob].each { |x| require x }