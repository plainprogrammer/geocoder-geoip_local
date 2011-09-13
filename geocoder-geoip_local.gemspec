# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "geocoder/geoip_local/version"

Gem::Specification.new do |s|
  s.name        = "geocoder-geoip_local"
  s.version     = Geocoder::GeoipLocal::VERSION
  s.authors     = ["James Thompson"]
  s.email       = ["james@plainprograms.com"]
  s.homepage    = "http://www.plainprograms.com"
  s.summary     = %q{Local GeoIP Lookup for Geocoder}
  s.description = %q{A Geocoder lookup implementation for a local MaxMind GeoIP Database}

  s.rubyforge_project = "geocoder-geoip_local"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
