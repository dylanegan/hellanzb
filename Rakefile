require 'rubygems'
require 'cucumber/rake/task' #I have to add this
require 'spec/rake/spectask'
 
namespace :rcov do
  Cucumber::Rake::Task.new(:cucumber) do |t|    
    t.rcov = true
    t.rcov_opts = %w{--exclude gems\/,bin\/,features\/}
    t.rcov_opts << %[-o "coverage"]
  end
end

require 'rake/gempackagetask'
require 'rubygems/specification'

require File.dirname(__FILE__) + '/lib/hellanzb/version'

GEM = "hellanzb"
GEM_VERSION = Hellanzb::VERSION
AUTHOR = "Dylan Egan"
EMAIL = "dylanegan@gmail.com"
HOMEPAGE = "http://github.com/abcde"
SUMMARY = "XML-RPC API all wrapped up"

@spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(README.markdown Rakefile) + Dir.glob("{lib,bin,features}/**/*")
end

Rake::GemPackageTask.new(@spec) do |pkg|
  pkg.gem_spec = @spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION} --no-ri --no-rdoc}
end

desc "Release the version"
task :release => :repackage do
  version = GEM_VERSION
  puts "Releasing #{version}"

  `git show-ref tags/v#{version}`
  unless $?.success?
    abort "There is no tag for v#{version}"
  end

  `git show-ref heads/releasing`
  if $?.success?
    abort "Remove the releasing branch, we need it!"
  end

  puts "Checking out to the releasing branch as the tag"
  system("git", "checkout", "-b", "releasing", "tags/v#{version}")

  puts "Reseting back to master"
  system("git", "checkout", "master")
  system("git", "branch", "-d", "releasing")

  current = @spec.version.to_s + ".0"
  next_version = Gem::Version.new(current).bump

  puts "Changing the version to #{next_version}."

  version_file = File.dirname(__FILE__)+"/lib/#{GEM}/version.rb"
  File.open(version_file, "w") do |f|
    f.puts <<-EOT
module Hellanzb 
  VERSION = "#{next_version}"
end
    EOT
  end

  puts "Committing the version change"
  system("git", "commit", version_file, "-m", "Next version: #{next_version}")

  puts "Push the commit up! if you don't, you'll be hunted down"
end
