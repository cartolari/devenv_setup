require 'rake'
require 'rspec/core/rake_task'
require_relative 'lib/devenv_setup/io'

task :spec    => 'spec:all'
namespace :spec do
  targets = Dir.glob('./spec/*').map do |dir|
    next unless File.directory?(dir)
    File.basename(dir)
  end.reject(&:nil?)

  task :all => targets

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(:spec) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end

desc 'Provision the Vagrant machine'
task :provision do
  DevenvSetup::IO.pipe_to_stdout('vagrant up')
  DevenvSetup::IO.pipe_to_stdout('vagrant ssh -c "cd /vagrant && sudo ./install.sh"')
end

desc 'Provision the machine and run the tests'
task :default => [:provision, :spec]
