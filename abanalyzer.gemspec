$:.push File.expand_path("../lib", __FILE__)
require "abanalyzer/version"
require "rake"
require "date"

Gem::Specification.new do |s|
  s.name = "abanalyzer"
  s.version = ABAnalyzer::VERSION
  s.authors = ["Brian Muller"]
  s.date = Date.today.to_s
  s.description = "A/B test analysis library for Ruby"
  s.summary = "A/B test analysis library for Ruby"
  s.email = "brian.muller@livingsocial.com"
  s.files = FileList["lib/**/*", "[A-Z]*", "Rakefile", "docs/**/*"]
  s.homepage = "https://github.com/livingsocial/abanalyzer"
  s.require_paths = ["lib"]
  s.add_dependency('statistics2', '>= 0.54')
  s.rubyforge_project = "abanalyzer"
end
