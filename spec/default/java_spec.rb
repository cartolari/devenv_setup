require 'spec_helper'

describe 'devenv' do
  describe command('which java') do
    its(:stdout) { should eq("/usr/bin/java\n") }
  end

  describe command('java -version') do
    its(:stderr) { should match('1.8.0_25') }
  end
end