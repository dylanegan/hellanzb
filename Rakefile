require 'cucumber/rake/task' #I have to add this
require 'spec/rake/spectask'
 
namespace :rcov do
  Cucumber::Rake::Task.new(:cucumber) do |t|    
    t.rcov = true
    t.rcov_opts = %w{--exclude gems\/,bin\/,features\/}
    t.rcov_opts << %[-o "coverage"]
  end
end
