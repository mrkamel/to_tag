
$:.push File.expand_path("../lib", __FILE__)
require "to_tag/version"

Gem::Specification.new do |s|
  s.name        = "to_tag"
  s.version     = ToTag::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = ""
  s.summary     = %q{Transform words into tags}
  s.description = %q{Transform words into tags and multiple words into multiple tags without loosing search operators}

  s.rubyforge_project = "to_tag"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_dependency "unicode"
end
