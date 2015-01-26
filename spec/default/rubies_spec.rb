require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))
  rubies = vars['ruby_install_ruby_versions']

  describe file('/usr/local/share/chruby/chruby.sh') do
    it { is_expected.to be_file  }
  end

  rubies.each do |ruby_version|
    describe file("/opt/rubies/ruby-#{ruby_version}") do
      it { is_expected.to be_directory  }
    end
  end

  describe file('/usr/local/bin/ag') do
    it { is_expected.to be_executable  }
  end

end
