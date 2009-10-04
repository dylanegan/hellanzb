begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "hellanzb"
    gemspec.summary = "XML-RPC API all wrapped up"
    gemspec.description = "Basically a nice Ruby wrapper around the XML-RPC interface provided by hellanzb. It also provides a very basic wrapper to start and stop a hellanzb instance."
    gemspec.email = "dylanegan@gmail.com"
    gemspec.homepage = "http://github.com/abcde/hellanzb"
    gemspec.authors = ["Dylan Egan"]
    gemspec.files = %w(README.markdown Rakefile VERSION) + Dir.glob("{bin,features,lib}/**/*")
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require File.dirname(__FILE__) + '/tmp/vendor/environment'

require 'cucumber/rake/task' #I have to add this
require 'spec/rake/spectask'
 
namespace :rcov do
  desc "Run the Cucumber features with code coverage"
  Cucumber::Rake::Task.new(:features) do |t| 
    t.rcov = true
    t.rcov_opts = %w{--exclude gems\/,bin\/,features\/}
    t.rcov_opts << %[-o "coverage"]
  end
end

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = "default"
end

desc "Runs the Cucumber features by default"
task :default => :features

desc 'Run bacon'
task :bacon do
  puts `ruby tmp/bin/bacon #{Dir["spec/**/*_spec.rb"].join(" ")}`
end
