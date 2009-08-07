# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hellanzb}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dylan Egan"]
  s.date = %q{2009-08-07}
  s.default_executable = %q{hellanzb}
  s.description = %q{Basically a nice Ruby wrapper around the XML-RPC interface provided by hellanzb. It also provides a very basic wrapper to start and stop a hellanzb instance.}
  s.email = %q{dylanegan@gmail.com}
  s.executables = ["hellanzb"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "bin/hellanzb",
     "features/client.feature",
     "features/nzb.feature",
     "features/queue.feature",
     "features/server.feature",
     "features/status.feature",
     "features/step_definitions/client_steps.rb",
     "features/step_definitions/nzb_steps.rb",
     "features/step_definitions/queue_steps.rb",
     "features/step_definitions/server_steps.rb",
     "features/step_definitions/status_steps.rb",
     "features/support/env.rb",
     "features/support/hellanzb.client.conf",
     "features/support/hellanzb.conf.example",
     "features/support/hellanzb.server.conf",
     "features/support/nzbs/1.nzb",
     "features/support/nzbs/2.nzb",
     "features/support/nzbs/3.nzb",
     "features/support/nzbs/4.nzb",
     "features/support/nzbs/5.nzb",
     "lib/hellanzb.rb",
     "lib/hellanzb/client.rb",
     "lib/hellanzb/nzb.rb",
     "lib/hellanzb/queue.rb",
     "lib/hellanzb/server.rb",
     "lib/hellanzb/status.rb"
  ]
  s.homepage = %q{http://github.com/abcde/hellanzb}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{XML-RPC API all wrapped up}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
