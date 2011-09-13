# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "tilt-js"
  s.version     = "0.0.1"
  s.authors     = ["mono"]
  s.email       = ["mono@monoweb.info"]
  s.homepage    = "http://monoweb.info/"
  s.summary     = %q{A Tilt Wrapper for the Google Closure Compiler}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'tilt', '>= 1.3.3'
  s.add_dependency 'closure-compiler', '>= 1.1.3'
end
