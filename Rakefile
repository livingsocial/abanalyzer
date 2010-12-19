require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc "Create documentation"
Rake::RDocTask.new("doc") { |rdoc|
  rdoc.title = "ABAnalyzer - A/B test analysis library for Ruby"
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

desc "Run all unit tests"
Rake::TestTask.new("test") { |t|
  t.libs << "lib"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
}

spec = Gem::Specification.new do |s|
  s.name = "abanalyzer"
  s.version = "0.0.1"
  s.authors = ["Brian Muller"]
  s.date = %q{2010-12-19}
  s.description = "A/B test analysis library for Ruby - performs Chi-Square tests and G-tests on A/B results."
  s.summary = "Performs statistical tests for significant differences in categorical data."
  s.email = "brian.muller@livingsocial.com"
  s.files = FileList["lib/**/*", "[A-Z]*", "Rakefile", "docs/**/*"]
  s.homepage = "https://github.com/livingsocial/abanalyzer"
  s.require_paths = ["lib"]
  s.add_dependency('statistics', '>= 0.54')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

desc "Default task: builds gem and runs tests"
task :default => [ :gem, :test ]
