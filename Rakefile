require 'rubygems'
require 'bundler'
require 'rake/testtask'
require 'rdoc/task'

Bundler::GemHelper.install_tasks

desc "Create documentation"
RDoc::Task.new("doc") { |rdoc|
  rdoc.title = "ABAnalyzer - A/B test analysis library for Ruby"
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

desc "Run all unit tests"
Rake::TestTask.new("test") { |t|
  t.libs +=[ "lib", "." ]
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
}
